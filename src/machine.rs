use std::{collections::VecDeque, num::Wrapping};

use crate::{Instr, Reg};

pub const MAX_MEMORY_SIZE: usize = 32768;

#[derive(Clone, Debug)]
pub struct Machine {
    pub memory: Box<[u8; MAX_MEMORY_SIZE]>,

    pub regs: [Wrapping<u16>; 16],

    pub input: VecDeque<u8>,
    pub output: Vec<u8>,

    pub exited: bool,
    pub steps: u32,
}

impl Machine {
    pub fn new(binary: &[u8], input: Vec<u8>) -> Self {
        if binary.len() > MAX_MEMORY_SIZE {
            panic!("Binary too big.");
        }

        let mut memory: Vec<u8> = Vec::with_capacity(MAX_MEMORY_SIZE);
        memory.extend_from_slice(binary);
        memory.resize(MAX_MEMORY_SIZE, 0);

        let memory: Box<[u8; MAX_MEMORY_SIZE]> = memory.try_into().unwrap();

        let mut regs = [Wrapping(0); 16];
        regs[Reg::SP as usize] = Wrapping(0x7FFE);

        Self {
            memory,
            regs,
            input: VecDeque::from(input),
            output: Vec::new(),
            exited: false,
            steps: 0,
        }
    }

    pub fn pc(&self) -> Wrapping<u16> {
        self.regs[Reg::PC as usize]
    }

    pub fn sp(&self) -> Wrapping<u16> {
        self.regs[Reg::SP as usize]
    }

    pub fn step(&mut self) {
        if self.exited {
            panic!("Machine has already exited.");
        }

        let byte = self.memory[self.pc().0 as usize];

        let instr = Instr::from(byte);

        self.regs[Reg::PC as usize] += 1;

        match instr {
            Instr::Int(val) => self.interrupt(val),
            Instr::MovRI(reg, val) => {
                self.regs[reg as usize].0 = val as u16;
            }
            Instr::MovPR(reg1, reg2) => {
                self.memory[self.regs[reg1 as usize].0 as usize] = self.regs[reg2 as usize].0 as u8;
            }
            Instr::MovRP(reg1, reg2) => {
                self.regs[reg1 as usize].0 =
                    self.memory[self.regs[reg2 as usize].0 as usize] as u16;
            }
            Instr::Add(reg1, reg2) => {
                self.regs[reg1 as usize] += self.regs[reg2 as usize];
            }
            Instr::Xor(reg1, reg2) => {
                self.regs[reg1 as usize] ^= self.regs[reg2 as usize];
            }
            Instr::And(reg1, reg2) => {
                self.regs[reg1 as usize] &= self.regs[reg2 as usize];
            }
            Instr::Or(reg1, reg2) => {
                self.regs[reg1 as usize] |= self.regs[reg2 as usize];
            }
            Instr::Mul(reg1, reg2) => {
                self.regs[reg1 as usize] *= self.regs[reg2 as usize];
            }
            Instr::Div(reg1, reg2) => {
                (self.regs[reg1 as usize], self.regs[reg2 as usize]) = (
                    self.regs[reg1 as usize] / self.regs[reg2 as usize],
                    self.regs[reg1 as usize] % self.regs[reg2 as usize],
                );
            }
            Instr::Jz(rel) => {
                if self.regs[Reg::R0 as usize].0 == 0 {
                    self.regs[Reg::PC as usize] += change_offset(rel) as u16;
                }
            }
            Instr::Jnz(rel) => {
                if self.regs[Reg::R0 as usize].0 != 0 {
                    self.regs[Reg::PC as usize] += change_offset(rel) as u16;
                }
            }
            Instr::Jmp(rel) => {
                self.regs[Reg::PC as usize] += change_offset(rel) as u16;
            }
            Instr::PushR(reg) => {
                let val = self.regs[reg as usize].0;
                
                self.regs[Reg::SP as usize] -= 2;
                self.set_double(self.sp().0, val);
            }
            Instr::PushP(rel) => {
                self.regs[Reg::SP as usize] -= 2;

                let offset = change_offset(rel) as i16;

                self.set_double(
                    self.sp().0,
                    self.get_double((self.pc().0 as i16 + offset) as u16),
                );
            }
            Instr::Pop(reg) => {
                if reg == Reg::PC {
                    self.regs[Reg::R13 as usize] = self.pc();
                }

                let val = self.get_double(self.sp().0);
                self.regs[Reg::SP as usize] += 2;
                self.regs[reg as usize].0 = val;
            }
        }

        self.steps += 1;
    }

    pub fn get_double(&self, addr: u16) -> u16 {
        (self.memory[addr as usize] as u16) << 8 | (self.memory[(addr + 1) as usize] as u16)
    }

    pub fn set_double(&mut self, addr: u16, val: u16) {
        self.memory[addr as usize] = (val >> 8) as u8;
        self.memory[(addr + 1) as usize] = val as u8;
    }

    fn interrupt(&mut self, value: u8) {
        match value {
            0 => self.exited = true,
            1 => {
                if let Some(input) = self.input.pop_front() {
                    self.regs[Reg::R0 as usize].0 = input as u16;
                } else {
                    self.output.extend_from_slice("END_OF_INPUT".as_bytes());
                    self.exited = true;
                }
            }
            2 => self.output.push(self.regs[Reg::R0 as usize].0 as u8),
            4 => {
                self.output.extend_from_slice("INTERRUPT_FOUR".as_bytes());
            },
            _ => panic!("Unknown interrupt {}.", value),
        }
    }
}

pub fn change_offset(value: i8) -> i8 {
    if value >= 0 {
        value + 1
    } else {
        value - 1
    }
}
