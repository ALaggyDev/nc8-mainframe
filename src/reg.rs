use std::{fmt, mem};

#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Reg {
    R0,
    R1,
    R2,
    R3,
    R4,
    R5,
    R6,
    R7,
    R8,
    R9,
    R10,
    R11,
    R12,
    R13,
    PC,
    SP,
}

impl From<u8> for Reg {
    fn from(value: u8) -> Self {
        if value >= 16 {
            panic!("Reg can not exceed 15.");
        }
        unsafe { mem::transmute(value) }
    }
}

impl From<Reg> for &'static str {
    fn from(value: Reg) -> Self {
        match value {
            Reg::R0 => "r0",
            Reg::R1 => "r1",
            Reg::R2 => "r2",
            Reg::R3 => "r3",
            Reg::R4 => "r4",
            Reg::R5 => "r5",
            Reg::R6 => "r6",
            Reg::R7 => "r7",
            Reg::R8 => "r8",
            Reg::R9 => "r9",
            Reg::R10 => "r10",
            Reg::R11 => "r11",
            Reg::R12 => "r12",
            Reg::R13 => "r13",
            Reg::PC => "pc",
            Reg::SP => "sp",
        }
    }
}

impl TryFrom<&str> for Reg {
    type Error = ();

    fn try_from(value: &str) -> Result<Self, Self::Error> {
        Ok(match value {
            "r0" => Reg::R0,
            "r1" => Reg::R1,
            "r2" => Reg::R2,
            "r3" => Reg::R3,
            "r4" => Reg::R4,
            "r5" => Reg::R5,
            "r6" => Reg::R6,
            "r7" => Reg::R7,
            "r8" => Reg::R8,
            "r9" => Reg::R9,
            "r10" => Reg::R10,
            "r11" => Reg::R11,
            "r12" => Reg::R12,
            "r13" => Reg::R13,
            "pc" => Reg::PC,
            "sp" => Reg::SP,
            _ => return Err(()),
        })
    }
}

impl fmt::Display for Reg {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        f.write_str((*self).into())
    }
}

impl fmt::Debug for Reg {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        fmt::Display::fmt(self, f)
    }
}
