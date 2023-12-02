use std::fmt;

use crate::Reg;

#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Instr {
    Int(u8),
    MovRI(Reg, i8),
    MovPR(Reg, Reg),
    MovRP(Reg, Reg),
    Add(Reg, Reg),
    Xor(Reg, Reg),
    And(Reg, Reg),
    Or(Reg, Reg),
    Mul(Reg, Reg),
    Div(Reg, Reg),
    Jz(i8),
    Jnz(i8),
    Jmp(i8),
    PushR(Reg),
    PushP(i8),
    Pop(Reg),
}

impl From<u8> for Instr {
    fn from(value: u8) -> Self {
        let (upper, lower) = (value >> 4, value & 0b1111);

        match upper {
            0x0 => Self::Int(lower),
            0x1 => Self::MovRI(Reg::from(lower >> 2), value_to_signed_2_bit(lower & 0b11)),
            0x2 => Self::MovPR(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x3 => Self::MovRP(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x4 => Self::Add(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x5 => Self::Xor(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x6 => Self::And(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x7 => Self::Or(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x8 => Self::Mul(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0x9 => Self::Div(Reg::from(lower >> 2), Reg::from(lower & 0b11)),
            0xA => Self::Jz(value_to_signed_4_bit(lower)),
            0xB => Self::Jnz(value_to_signed_4_bit(lower)),
            0xC => Self::Jmp(value_to_signed_4_bit(lower)),
            0xD => Self::PushR(Reg::from(lower)),
            0xE => Self::PushP(value_to_signed_4_bit(lower)),
            0xF => Self::Pop(Reg::from(lower)),
            _ => unreachable!(),
        }
    }
}

impl fmt::Display for Instr {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Instr::Int(val) => write!(f, "int {val}"),
            Instr::MovRI(reg, val) => write!(f, "mov {reg}, {val}"),
            Instr::MovPR(reg1, reg2) => write!(f, "mov [{reg1}], {reg2}"),
            Instr::MovRP(reg1, reg2) => write!(f, "mov {reg1}, [{reg2}]"),
            Instr::Add(reg1, reg2) => write!(f, "add {reg1}, {reg2}"),
            Instr::Xor(reg1, reg2) => write!(f, "xor {reg1}, {reg2}"),
            Instr::And(reg1, reg2) => write!(f, "and {reg1}, {reg2}"),
            Instr::Or(reg1, reg2) => write!(f, "or {reg1}, {reg2}"),
            Instr::Mul(reg1, reg2) => write!(f, "mul {reg1}, {reg2}"),
            Instr::Div(reg1, reg2) => write!(f, "div {reg1}, {reg2}"),
            Instr::Jz(rel) => write!(f, "jz {rel:+}"),
            Instr::Jnz(rel) => write!(f, "jnz {rel:+}"),
            Instr::Jmp(rel) => write!(f, "jmp {rel:+}"),
            Instr::PushR(reg) => write!(f, "push {reg}"),
            Instr::PushP(rel) => write!(f, "push [{rel:+}]"),
            Instr::Pop(reg) => write!(f, "pop {reg}"),
        }
    }
}

impl fmt::Debug for Instr {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        fmt::Display::fmt(self, f)
    }
}

fn value_to_signed_2_bit(value: u8) -> i8 {
    match value {
        0b00 => 0,
        0b01 => 1,
        0b10 => -2,
        0b11 => -1,
        _ => panic!("Unexpected signed 2 bit integer"),
    }
}

fn value_to_signed_4_bit(value: u8) -> i8 {
    if value >= 16 {
        panic!("Unexpected signed 4 bit integer");
    }

    let neg_bit = (value & 0b1000) != 0;
    if !neg_bit {
        value as i8
    } else {
        (value as i8) - 16
    }
}
