# NC8 Reverse Engineering Track

NC8 Mainframe Mangagement Interface is a series of CTF challenges in NSEC 2018.
You can find the challenges in [ringzer0ctf](https://ringzer0ctf.com/challenges).

**Spoiler Alert**: If you haven't solve the challenges yet, do not read any further. The NC8 challenges are really fun to tackle by yourself.

### NC8 Mainframe assembly overview:

Every instruction takes up 1 byte. The first 4 bits represent the instruction type, and the last 4 bits represent either registers, signed numbers or relative offsets (depending on the instruction).

| Opcode | Assembly             |
| ------ | -------------------- |
| 0X     | `int <num>`          |
| 1X     | `mov <reg>, <num>`   |
| 2X     | `mov [<reg>], reg`   |
| 3X     | `mov <reg>, [<reg>]` |
| 4X     | `add <reg>, <reg>`   |
| 5X     | `xor <reg>, <reg>`   |
| 6X     | `and <reg>, <reg>`   |
| 7X     | `or <reg>, <reg>`    |
| 8X     | `mul <reg>, <reg>`   |
| 9X     | `div <reg>, <reg>`   |
| AX     | `jz <rel>`           |
| BX     | `jnz <rel>`          |
| CX     | `jmp <rel>`          |
| DX     | `push <reg>`         |
| EX     | `push [<rel>]`       |
| FX     | `pop <reg>`          |

[^1]: Only 1, 2, -1, -2 can be used.

| Code    | Description                               |
| ------- | ----------------------------------------- |
| 0       | Exit                                      |
| 1       | Read one byte to r0                       |
| 2       | Print one byte from r0                    |
| 4       | Write the 32 secret bytes to [r0] (part4) |
| 10 & 11 | See the manual                            |

### Code

Warning: I didn't try to make my code easy to read, the assembler & disassembler is quite error prone and terrible.

`cargo run data/partXXX` for debugger.
`cargo run --bin disasm data/partXXX` for disassembler.
`cargo run --bin asm data/partXXX.asm` for assembler.

![Screenshot of the debugger](/assets/debugger.png)
