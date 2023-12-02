; Bubble sort in NC8

  ; r0 <- data ptr, r1 <- 32
  push [._data]
  pop r0
  push [._32]
  pop r1

  ; get data
  int 10

  jmp .sort

._data dw .data
._32 dw 32

.sort
  ; r5 <- REAL end of ptr - 1, r6 <- cur. ptr
  mov r2, -1
  add r1, r2
  add r1, r0
  push r1
  pop r5
  push r0
  pop r6
  push r0
  pop r3
.loop
  ; r2 <- r3 + 1
  mov r2, 1
  add r2, r3

  mov r0, [r3]
  mov r1, [r2]

  ; store r2
  push r2

  ; r1 = -r1
  mov r2, -1   ;    (!a) + 1 = -a   (! means NOT)
  add r1, r2   ; -> !(a - 1) = -a
  xor r1, r2

  ; get r2
  pop r2

  ; r0 += r1
  add r0, r1
  push [._0x100]
  pop r1
  and r0, r1
  jz .swap
  jmp .continue
._0x100 dw 0x100

.swap
  mov r0, [r3]
  mov r1, [r2]
  mov [r2], r0
  mov [r3], r1
.continue
  ; r3 <- r2  (r2 = r3 + 1)
  push r2
  pop r3

  ; check if ended

  ; r0 <- end of ptr
  push r5
  pop r0
  xor r0, r3
  jz .outer

  push [._loop]
  pop pc
._loop dw .loop

.outer
  ; r0 = r5 - 1
  push r5
  pop r0
  mov r1, -1
  add r0, r1

  push r0
  pop r5

  ; r3 <- r6
  push r6
  pop r3

  xor r0, r3
  jz .done

  push [._loop2]
  pop pc
._loop2 dw .loop

.done
  push r6
  pop r0
  int 11

.data
