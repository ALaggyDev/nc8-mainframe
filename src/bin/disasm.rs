use std::{env::args, fmt::Write, fs};

use nc8::helper::byte_to_printable;

// I wrote this disassembler before I wrote the interpreter.
// I pretty much just hardcoded everything and this code really sucks.

fn split_byte(byte: u8) -> (u8, u8) {
    (byte >> 4, byte & 0b1111)
}

fn num_to_reg(num: u8) -> &'static str {
    match num {
        0x0 => "r0",
        0x1 => "r1",
        0x2 => "r2",
        0x3 => "r3",
        0x4 => "r4",
        0x5 => "r5",
        0x6 => "r6",
        0x7 => "r7",
        0x8 => "r8",
        0x9 => "r9",
        0xA => "r10",
        0xB => "r11",
        0xC => "r12",
        0xD => "r13",
        0xE => "pc",
        0xF => "sp",
        _ => panic!("Unexpected register."),
    }
}

fn num_to_signed_2_bit(num: u8) -> i8 {
    match num {
        0b00 => 0,
        0b01 => 1,
        0b10 => -2,
        0b11 => -1,
        _ => panic!("Unexpected signed 2 bit integer"),
    }
}

fn num_to_signed_4_bit(num: u8) -> i8 {
    let neg_bit = (num & 0b1000) != 0;
    if !neg_bit {
        num as i8
    } else {
        (num as i8) - 16
    }
}

fn strange_weird_nonsense_relative_position_thing(num: i8) -> i8 {
    if num >= 0 {
        num + 2
    } else {
        num
    }
}

fn main() {
    let mut args = args();
    args.next();
    let data_path = args.next().expect("Argument not found");

    let data: Vec<u8> = fs::read(&data_path).expect("Can not read data.");

    let mut labels: Vec<Option<u32>> = vec![None; data.len()];
    let mut label_count: u32 = 0;

    let mut is_values: Vec<bool> = vec![false; data.len()];
    let mut is_label_values: Vec<bool> = vec![false; data.len()];

    let mut output = String::new();

    // Generate label
    for (i, &byte) in data.iter().enumerate() {
        let (instr, info) = split_byte(byte);

        match instr {
            0xA | 0xB | 0xC | 0xE => {
                let rel = (i as isize
                    + strange_weird_nonsense_relative_position_thing(num_to_signed_4_bit(info))
                        as isize) as usize;

                if labels[rel].is_none() {
                    labels[rel] = Some(label_count);
                    label_count += 1;
                }

                // "push [<rel>]"
                if instr == 0xE {
                    is_values[rel] = true;

                    // next instruction is "pop pc"
                    if i + 1 != data.len() && data[i + 1] == 0xFE {
                        is_label_values[rel] = true;

                        let value = ((data[rel] as u16) << 8 | (data[rel + 1] as u16)) as usize;
                        if labels[value].is_none() {
                            labels[value] = Some(label_count);
                            label_count += 1;
                        }

                        // mark the next instruction after "pop pc" as a label
                        if i + 2 != data.len() && labels[i + 2].is_none() {
                            labels[i + 2] = Some(label_count);
                            label_count += 1;
                        }
                    }
                }
            }
            _ => {}
        };
    }

    // Generate assembly
    for (i, &byte) in data.iter().enumerate() {
        let (instr, info) = split_byte(byte);
        let (info_a, info_b) = (info >> 2, info & 0b11);

        if let Some(label) = labels[i] {
            writeln!(&mut output, ".l_{}", label).unwrap();
        }

        if i != 0 && is_values[i - 1] {
            continue;
        }

        if is_values[i] {
            let value = ((byte as u16) << 8 | (data[i + 1] as u16)) as i16;
            (if !is_label_values[i] {
                writeln!(&mut output, "  dw {}", value)
            } else {
                writeln!(&mut output, "  dw .l_{}", labels[value as usize].unwrap())
            })
            .unwrap();
            continue;
        }

        let mut line = String::new();
        line.push_str("  ");

        (match instr {
            0x0 => write!(&mut line, "int {}", info),
            0x1 => write!(
                &mut line,
                "mov {}, {}",
                num_to_reg(info_a),
                num_to_signed_2_bit(info_b)
            ),
            0x2 => write!(
                &mut line,
                "mov [{}], {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x3 => write!(
                &mut line,
                "mov {}, [{}]",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x4 => write!(
                &mut line,
                "add {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x5 => write!(
                &mut line,
                "xor {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x6 => write!(
                &mut line,
                "and {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x7 => write!(
                &mut line,
                "or {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x8 => write!(
                &mut line,
                "mul {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0x9 => write!(
                &mut line,
                "div {}, {}",
                num_to_reg(info_a),
                num_to_reg(info_b)
            ),
            0xA => write!(
                &mut line,
                "jz .l_{}",
                labels[(i as isize
                    + strange_weird_nonsense_relative_position_thing(num_to_signed_4_bit(info))
                        as isize) as usize]
                    .unwrap()
            ),
            0xB => write!(
                &mut line,
                "jnz .l_{}",
                labels[(i as isize
                    + strange_weird_nonsense_relative_position_thing(num_to_signed_4_bit(info))
                        as isize) as usize]
                    .unwrap()
            ),
            0xC => write!(
                &mut line,
                "jmp .l_{}",
                labels[(i as isize
                    + strange_weird_nonsense_relative_position_thing(num_to_signed_4_bit(info))
                        as isize) as usize]
                    .unwrap()
            ),
            0xD => write!(&mut line, "push {}", num_to_reg(info)),
            0xE => write!(
                &mut line,
                "push [.l_{}]",
                labels[(i as isize
                    + strange_weird_nonsense_relative_position_thing(num_to_signed_4_bit(info))
                        as isize) as usize]
                    .unwrap()
            ),
            0xF => write!(&mut line, "pop {}", num_to_reg(info)),
            _ => panic!("Unexpected instruction"),
        })
        .unwrap();

        writeln!(
            &mut output,
            "{}{}; 0x{:04x} {}",
            line,
            " ".repeat(40 - line.len().min(38)),
            i,
            byte_to_printable(byte)
        )
        .unwrap();
    }

    fs::write(format!("{data_path}.asm"), output).expect("Can not write data.");
}
