use std::{cmp::Ordering, collections::HashMap, env::args, fs};

use nc8::{helper::str_to_int, Reg};

// This code is TERRIBLE, I know.
// Should have spend some time learning some good parser such as nom...

fn main() {
    let mut args = args();
    args.next();
    let asm_path = args.next().expect("Argument not found");

    let asm = fs::read_to_string(&asm_path).expect("Can not read assembly.");

    let mut labels: HashMap<&str, u16> = HashMap::new();
    let mut location: u16 = 0;

    let mut output: Vec<u8> = Vec::new();

    for line in asm.lines() {
        let mut iter = line.split_whitespace().peekable();

        // Identify labels
        if let Some(&cur) = iter.peek() {
            if cur.starts_with('.') {
                labels.insert(cur, location);
                iter.next();
            }
        }

        // Identify instructions
        if let Some(cur) = iter.next() {
            match cur {
                "int" | "mov" | "add" | "xor" | "and" | "or" | "mul" | "div" | "jz" | "jnz"
                | "jmp" | "push" | "pop" => {
                    location += 1;
                }
                "dw" => {
                    location += 2;
                }
                ";" => {}
                _ => {
                    panic!("Unknown instruction.")
                }
            }
        }
    }

    location = 0;

    for line in asm.lines() {
        // TODO: I give up, use a proper parser pleae
        let line = line.replace(',', "");

        let mut iter = line.split_whitespace().peekable();

        // Identify labels
        if let Some(&cur) = iter.peek() {
            if cur.starts_with('.') {
                iter.next();
            }
        }

        // Identify instructions
        if let Some(cur) = iter.next() {
            match cur {
                "int" => {
                    let val = str_to_int(iter.next().expect("Bad")).expect("Bad");
                    if val > 15 {
                        panic!("Bad");
                    }

                    output.push(val as u8);
                    location += 1;
                }
                "mov" => {
                    let s1 = iter.next().expect("Bad");
                    let s2 = iter.next().expect("Bad");

                    if s1.starts_with('[') {
                        let reg1 = Reg::try_from(&s1[1..s1.len() - 1]).expect("Bad") as u8;
                        let reg2 = Reg::try_from(s2).expect("Bad") as u8;
                        if reg1 > 3 || reg2 > 3 {
                            panic!("Bad");
                        }
                        output.push(0x20 | (reg1 << 2) | reg2);
                    } else if s2.starts_with('[') {
                        let reg1 = Reg::try_from(s1).expect("Bad") as u8;
                        let reg2 = Reg::try_from(&s2[1..s2.len() - 1]).expect("Bad") as u8;
                        if reg1 > 3 || reg2 > 3 {
                            panic!("Bad");
                        }
                        output.push(0x30 | (reg1 << 2) | reg2);
                    } else {
                        let reg = Reg::try_from(s1).expect("Bad") as u8;
                        let val = signed_2_to_u8(s2);
                        if reg > 3 {
                            panic!("Bad");
                        }
                        output.push(0x10 | (reg << 2) | val);
                    }

                    location += 1;
                }
                "add" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x40 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "xor" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x50 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "and" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x60 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "or" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x70 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "mul" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x80 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "div" => {
                    let reg1 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    let reg2 = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;
                    if reg1 > 3 || reg2 > 3 {
                        panic!("Bad");
                    }

                    output.push(0x90 | (reg1 << 2) | reg2);
                    location += 1;
                }
                "jz" => {
                    location += 1;

                    let s = iter.next().expect("Bad");
                    let rel = parse_offset(s, location, &labels);

                    output.push(0xA0 | (rel as u8 & 0b1111));
                }
                "jnz" => {
                    location += 1;

                    let s = iter.next().expect("Bad");
                    let rel = parse_offset(s, location, &labels);

                    output.push(0xB0 | (rel as u8 & 0b1111));
                }
                "jmp" => {
                    location += 1;

                    let s = iter.next().expect("Bad");
                    let rel = parse_offset(s, location, &labels);

                    output.push(0xC0 | (rel as u8 & 0b1111));
                }
                "push" => {
                    location += 1;

                    let s = iter.next().expect("Bad");
                    if !s.starts_with('[') {
                        let reg = Reg::try_from(s).expect("Bad") as u8;

                        output.push(0xD0 | reg);
                    } else {
                        let rel = parse_offset(&s[1..s.len() - 1], location, &labels);

                        output.push(0xE0 | (rel as u8 & 0b1111));
                    }
                }
                "pop" => {
                    let reg = Reg::try_from(iter.next().expect("Bad")).expect("Bad") as u8;

                    output.push(0xF0 | reg);
                    location += 1;
                }
                "dw" => {
                    let s = iter.next().expect("Bad");

                    let val = if s.starts_with('.') {
                        *labels.get(s).expect("Bad")
                    } else {
                        str_to_int(s).expect("Bad")
                    };

                    output.push((val >> 8) as u8);
                    output.push(val as u8);
                    location += 2;
                }
                ";" => {}
                _ => {
                    panic!("Unknown instruction.")
                }
            }
        }
    }

    fs::write(format!("{asm_path}.runnable"), output).expect("Can not write binary.");
}

fn signed_2_to_u8(val: &str) -> u8 {
    match val {
        "0" => 0b00,
        "1" => 0b01,
        "-2" => 0b10,
        "-1" => 0b11,
        _ => panic!("Bad"),
    }
}

fn parse_offset(val: &str, location: u16, labels: &HashMap<&str, u16>) -> i16 {
    let rel = if val.starts_with('.') {
        let offset = *labels.get(val).expect("Bad") as i16 - location as i16;

        match offset.cmp(&0) {
            Ordering::Greater => offset - 1,
            Ordering::Less => offset + 1,
            Ordering::Equal => offset,
        }
    } else {
        val.parse::<i16>().expect("Bad")
    };

    if !(-8..8).contains(&rel) {
        panic!("Bad");
    }

    rel
}
