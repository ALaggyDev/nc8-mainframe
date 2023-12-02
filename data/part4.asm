  push [.l_0]                           ; 0x0000 .
  pop pc                                ; 0x0001 .
.l_0
  dw .l_1

.str_reading
  db "READING SECRET CODE INTO MEMORY...\n"

; Call print("READING...", 35)
.l_3
  dw 35
.l_4
  dw .str_reading
.l_2
.l_5
  dw .print
.l_1
  push [.l_3]                           ; 0x002d .
  push [.l_4]                           ; 0x002e .
  push [.l_5]                           ; 0x002f .
  pop pc                                ; 0x0030 .

; int 4 with r0 = 4096
.l_7
  push [.l_8]                           ; 0x0031 .
  pop pc                                ; 0x0032 .

; call .fn_2
.l_10
  push [.l_11]                          ; 0x0033 .
  pop pc                                ; 0x0034 .

.l_13
  jmp .l_10                             ; 0x0035 .

.l_8
  dw .fn_1
.l_11
  dw .fn_2
.l_14
  dw 4096

.fn_1
  push [.l_14]                          ; 0x003c .
  pop r0                                ; 0x003d .
  int 4                                 ; 0x003e .
  push r13                              ; 0x003f .
  pop pc                                ; 0x0040 .

.l_16
  dw 32
.l_15
  dw 64

; (r1, r11, r9) = (64, 32, 64)
; r12 = r13
; r0 = sp
; r0 -= 64
; sp = r0 (sp is modified)
; r10 = r0
; jmp .fn_3
.fn_2
  push [.l_15]                          ; 0x0045 .
  push [.l_16]                          ; 0x0046 .
  push [.l_15]                          ; 0x0047 .
  pop r1                                ; 0x0048 .
  pop r11                               ; 0x0049 .
  pop r9                                ; 0x004a .

  push r13                              ; 0x004b .
  pop r12                               ; 0x004c .
  push sp                               ; 0x004d .
  pop r0                                ; 0x004e .

  mov r2, 1                             ; 0x004f .
  mov r3, -1                            ; 0x0050 .
  xor r3, r1                            ; 0x0051 ]
  add r3, r2                            ; 0x0052 N
  add r0, r3                            ; 0x0053 C
  
  push r0                               ; 0x0054 .
  pop sp                                ; 0x0055 .
  push r0                               ; 0x0056 .
  pop r10                               ; 0x0057 .

  push [.l_17]                          ; 0x0058 .
  pop pc                                ; 0x0059 .
.l_17
  dw .fn_3

.str_enter
  db "PLEASE ENTER CODE #4\n"

.l_20
  dw .read
.l_21
  dw 21
.l_22
  dw .str_enter
.l_23
  dw .print

.fn_3
  push [.l_20]                          ; 0x0079 .

  ; Call print("PLEASE...", 21)
  push [.l_21]                          ; 0x007a .
  push [.l_22]                          ; 0x007b .
  push [.l_23]                          ; 0x007c .
  pop pc                                ; 0x007d .
.l_24
  pop r5                                ; 0x007e . r5 = .read

  push r9                               ; 0x007f . ; r9 = 64
  push r10                              ; 0x0080 . ; r10 = new sp

  push r5                               ; 0x0081 .
  pop pc                                ; 0x0082 . Call read(r10, 64)

  push r11                              ; 0x0083 . ; r11 = 32
  push [.l_25]                          ; 0x0084 . ; 4096
  push r10                              ; 0x0085 . ; r10

  push [.l_26]                          ; 0x0086 .
  pop pc                                ; 0x0087 . ; Call compare(r10, 4096, 32)

.l_28
  jz .l_29                              ; 0x0088 .
  jmp .l_30                             ; 0x0089 .
.l_29
  int 0                                 ; 0x008a .
.l_25
  dw 4096
.l_26
  dw .compare
.l_30
  push [.l_32]                          ; 0x008f .
  push [.l_33]                          ; 0x0090 .
  push [.l_34]                          ; 0x0091 .
  pop pc                                ; 0x0092 . ; Call print("CODE REJECTED\n", 15)
.l_35
  push r12                              ; 0x0093 .
  pop pc                                ; 0x0094 .
.l_32
  dw 14
.l_33
  dw .str_rejected
.l_34
  dw .print

.str_rejected
  db "CODE REJECTED\n"

; compare(char* buf1, int buf2, int len)
.compare
  ; r0, r5 = 0
  xor r0, r0                            ; 0x00a9 P
  push r0                               ; 0x00aa .
  pop r5                                ; 0x00ab .

  ; r1 = buf1, r2 = 4096, r3 = 32
  pop r1                                ; 0x00ac .
  pop r2                                ; 0x00ad .
  pop r3                                ; 0x00ae .

  push r13                              ; 0x00af .

  ; r3, r4 = r3 + r1(buf1)
  add r3, r1                            ; 0x00b0 M
  push r3                               ; 0x00b1 .
  pop r4                                ; 0x00b2 .
.l_45
  push r4                               ; 0x00b3 .
.l_39
  pop r0                                ; 0x00b4 .
  xor r0, r1                            ; 0x00b5 Q
  jz .l_37                              ; 0x00b6 .
  jmp .l_38                             ; 0x00b7 .
.l_40
  dw .l_41
.l_37
  push [.l_40]                          ; 0x00ba .
  pop pc                                ; 0x00bb .
.l_38
  mov r0, [r1]                          ; 0x00bc 1
  mov r3, [r2]                          ; 0x00bd >
  xor r0, r3                            ; 0x00be S

  jz .l_42                              ; 0x00bf .
  mov r0, 1                             ; 0x00c0 .
  push r0                               ; 0x00c1 .
  pop r5                                ; 0x00c2 .
  jmp .l_42                             ; 0x00c3 .
.l_44
  dw .l_45
.l_42
  mov r0, 1                             ; 0x00c6 .
  add r1, r0                            ; 0x00c7 D
  add r2, r0                            ; 0x00c8 H
  push [.l_44]                          ; 0x00c9 .
.l_43
  pop pc                                ; 0x00ca .
.l_41
  push r5                               ; 0x00cb .
  pop r0                                ; 0x00cc .
  pop pc                                ; 0x00cd .

; print(char* buf, int len)
.print
  pop r1                                ; 0x00ce .
  pop r0                                ; 0x00cf .
  push r13                              ; 0x00d0 .
  mov r3, 1                             ; 0x00d1 .
  mov r2, -1                            ; 0x00d2 .
.l_47
  jz .l_46                              ; 0x00d3 .
  push r0                               ; 0x00d4 .
  mov r0, [r1]                          ; 0x00d5 1
  int 2                                 ; 0x00d6 .
  add r1, r3                            ; 0x00d7 G
  pop r0                                ; 0x00d8 .
  add r0, r2                            ; 0x00d9 B
  jmp .l_47                             ; 0x00da .
.l_46
  pop pc                                ; 0x00db .

; read(char* buf, int len)
.read
  pop r1                                ; 0x00dc .
  pop r0                                ; 0x00dd .
  push r13                              ; 0x00de .
  mov r3, 1                             ; 0x00df .
  mov r2, -1                            ; 0x00e0 .
.l_49
  jz .l_48                              ; 0x00e1 .
  push r0                               ; 0x00e2 .
  int 1                                 ; 0x00e3 .
  mov [r1], r0                          ; 0x00e4 $
  add r1, r3                            ; 0x00e5 G
  pop r0                                ; 0x00e6 .
  add r0, r2                            ; 0x00e7 B
  jmp .l_49                             ; 0x00e8 .
.l_48
  pop pc                                ; 0x00e9 .
