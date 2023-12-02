use std::num::ParseIntError;

pub fn str_to_int(val: &str) -> Result<u16, ParseIntError> {
    if let Some(hex_val) = val.strip_prefix("0x") {
        u16::from_str_radix(hex_val, 16)
    } else {
        val.parse::<i16>().map(|val| val as u16)
    }
}

pub fn byte_to_printable(num: u8) -> char {
    if (32..127).contains(&num) {
        num as char
    } else {
        '.'
    }
}
