push [._start]
pop pc
._start dw .start

.write
  pop r1 ; buf
  pop r0 ; len
  push lr ; link register
  mov r2, -1
  mov r3, 1
.write_loop
  jz .write_ret
  push r0
  mov r0, [r1]
  int 2
  add r1, r3
  pop r0
  add r0, r2
  jmp .write_loop
.write_ret
  pop pc


.hello db "Hello world!\n"
._hello dw .hello
._hello_len dw 13
._write dw .write
.start
push [._hello_len]
push [._hello]
push [._write]
pop pc
int 0