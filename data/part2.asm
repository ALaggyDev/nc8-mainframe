  push [.l_0]                           ; 0x0000 .
  pop pc                                ; 0x0001 .
.l_0
  dw .l_1
  int 0                                 ; 0x0004 .
  int 0                                 ; 0x0005 .
  int 0                                 ; 0x0006 .
  int 0                                 ; 0x0007 .
  int 0                                 ; 0x0008 .
  int 0                                 ; 0x0009 .
  int 0                                 ; 0x000a .
  int 0                                 ; 0x000b .
  int 0                                 ; 0x000c .
  int 0                                 ; 0x000d .
  int 0                                 ; 0x000e .
  int 0                                 ; 0x000f .
  int 0                                 ; 0x0010 .
  int 0                                 ; 0x0011 .
  int 0                                 ; 0x0012 .
  int 0                                 ; 0x0013 .
  int 0                                 ; 0x0014 .
  int 0                                 ; 0x0015 .
  int 0                                 ; 0x0016 .
  int 0                                 ; 0x0017 .
  int 0                                 ; 0x0018 .
  int 0                                 ; 0x0019 .
  int 0                                 ; 0x001a .
  int 0                                 ; 0x001b .
  int 0                                 ; 0x001c .
  int 0                                 ; 0x001d .
  int 0                                 ; 0x001e .
  int 0                                 ; 0x001f .
  int 0                                 ; 0x0020 .
  int 0                                 ; 0x0021 .
  int 0                                 ; 0x0022 .
  int 0                                 ; 0x0023 .
  int 0                                 ; 0x0024 .
  int 0                                 ; 0x0025 .
  int 0                                 ; 0x0026 .
  int 0                                 ; 0x0027 .
  int 0                                 ; 0x0028 .
  int 0                                 ; 0x0029 .
  int 0                                 ; 0x002a .
  int 0                                 ; 0x002b .
  int 0                                 ; 0x002c .
  int 0                                 ; 0x002d .
  int 0                                 ; 0x002e .
  int 0                                 ; 0x002f .
  int 0                                 ; 0x0030 .
  int 0                                 ; 0x0031 .
  int 0                                 ; 0x0032 .
  int 0                                 ; 0x0033 .
  int 0                                 ; 0x0034 .
  pop r0                                ; 0x0035 .
  pop r1                                ; 0x0036 .
  mov [r0], r1                          ; 0x0037 !
  pop pc                                ; 0x0038 .
  xor r0, r0                            ; 0x0039 P
  add r3, r0                            ; 0x003a L
  add r1, r1                            ; 0x003b E
  add r0, r1                            ; 0x003c A
  xor r0, r3                            ; 0x003d S
  add r1, r1                            ; 0x003e E
  mov [r0], r0                          ; 0x003f  
  add r1, r1                            ; 0x0040 E
  add r3, r2                            ; 0x0041 N
  xor r1, r0                            ; 0x0042 T
  add r1, r1                            ; 0x0043 E
  xor r0, r2                            ; 0x0044 R
  mov [r0], r0                          ; 0x0045  
  add r0, r3                            ; 0x0046 C
  add r3, r3                            ; 0x0047 O
  add r1, r0                            ; 0x0048 D
  add r1, r1                            ; 0x0049 E
  mov [r0], r0                          ; 0x004a  
  mov [r0], r3                          ; 0x004b #
  mov r0, [r2]                          ; 0x004c 2
  int 10                                ; 0x004d .
.l_2
  dw 21
.l_3
  dw 57
.l_4
  dw .l_5
.l_1
  push [.l_2]                           ; 0x0054 .
  push [.l_3]                           ; 0x0055 .
  push [.l_4]                           ; 0x0056 .
  pop pc                                ; 0x0057 .
.l_6
  jmp .l_7                              ; 0x0058 .
.l_8
  dw 4
.l_9
  dw .l_10
.l_7
  push [.l_8]                           ; 0x005d .
  pop r12                               ; 0x005e .
  push r12                              ; 0x005f .
  push [.l_9]                           ; 0x0060 .
  pop pc                                ; 0x0061 .
.l_11
  jmp .l_12                             ; 0x0062 .
.l_13
  dw 4
.l_15
  dw 256
.l_14
  dw 248
.l_12
  push [.l_13]                          ; 0x0069 .
  push r12                              ; 0x006a .
  push [.l_14]                          ; 0x006b .
.l_17
  push [.l_15]                          ; 0x006c .
  jmp .l_16                             ; 0x006d .
.l_21
  dw 250
.l_22
  dw 256
.l_18
  dw .l_19
.l_16
  push [.l_18]                          ; 0x0074 .
  pop pc                                ; 0x0075 .
.l_20
  push [.l_21]                          ; 0x0076 .
  push [.l_22]                          ; 0x0077 .
  jmp .l_23                             ; 0x0078 .
.l_24
  dw 4
.l_25
  dw .l_26
.l_23
  pop r10                               ; 0x007d .
  pop r5                                ; 0x007e .
  push [.l_24]                          ; 0x007f .
  push r5                               ; 0x0080 .
  push r10                              ; 0x0081 .
  push [.l_25]                          ; 0x0082 .
  pop pc                                ; 0x0083 .
.l_27
  jz .l_28                              ; 0x0084 .
  push [.l_29]                          ; 0x0085 .
  pop pc                                ; 0x0086 .
.l_29
  dw .l_30
.l_31
  dw 4
.l_28
  push [.l_31]                          ; 0x008b .
  pop r1                                ; 0x008c .
  push r12                              ; 0x008d .
  pop r0                                ; 0x008e .
  add r0, r1                            ; 0x008f A
  push r0                               ; 0x0090 .
  pop r12                               ; 0x0091 .
  push r10                              ; 0x0092 .
  pop pc                                ; 0x0093 .
.l_26
  xor r0, r0                            ; 0x0094 P
  push r0                               ; 0x0095 .
  pop r5                                ; 0x0096 .
  pop r1                                ; 0x0097 .
  pop r2                                ; 0x0098 .
  pop r3                                ; 0x0099 .
  push r13                              ; 0x009a .
  add r3, r1                            ; 0x009b M
  push r3                               ; 0x009c .
  pop r4                                ; 0x009d .
.l_39
  push r4                               ; 0x009e .
  pop r0                                ; 0x009f .
  xor r0, r1                            ; 0x00a0 Q
  jz .l_32                              ; 0x00a1 .
  jmp .l_33                             ; 0x00a2 .
.l_35
  dw .l_36
.l_32
  push [.l_35]                          ; 0x00a5 .
  pop pc                                ; 0x00a6 .
.l_33
  mov r0, [r1]                          ; 0x00a7 1
  mov r3, [r2]                          ; 0x00a8 >
  xor r0, r3                            ; 0x00a9 S
  jz .l_37                              ; 0x00aa .
  mov r0, 1                             ; 0x00ab .
.l_34
  push r0                               ; 0x00ac .
  pop r5                                ; 0x00ad .
  jmp .l_37                             ; 0x00ae .
.l_38
  dw .l_39
.l_37
  mov r0, 1                             ; 0x00b1 .
  add r1, r0                            ; 0x00b2 D
  add r2, r0                            ; 0x00b3 H
  push [.l_38]                          ; 0x00b4 .
  pop pc                                ; 0x00b5 .
.l_36
  push r5                               ; 0x00b6 .
  pop r0                                ; 0x00b7 .
  pop pc                                ; 0x00b8 .
.l_19
  pop r4                                ; 0x00b9 .
  pop r5                                ; 0x00ba .
  pop r6                                ; 0x00bb .
  pop r7                                ; 0x00bc .
  push r13                              ; 0x00bd .
  xor r3, r3                            ; 0x00be _
.l_44
  push r5                               ; 0x00bf .
  pop r0                                ; 0x00c0 .
  xor r0, r3                            ; 0x00c1 S
  jz .l_40                              ; 0x00c2 .
  jmp .l_41                             ; 0x00c3 .
.l_40
  pop pc                                ; 0x00c4 .
.l_41
  push r6                               ; 0x00c5 .
  pop r0                                ; 0x00c6 .
  push r7                               ; 0x00c7 .
  pop r1                                ; 0x00c8 .
  push r3                               ; 0x00c9 .
  pop r2                                ; 0x00ca .
  div r2, r1                            ; 0x00cb .
  add r0, r1                            ; 0x00cc A
  mov r0, [r0]                          ; 0x00cd 0
  push r4                               ; 0x00ce .
  pop r1                                ; 0x00cf .
  add r1, r3                            ; 0x00d0 G
  mov r2, [r1]                          ; 0x00d1 9
  xor r0, r2                            ; 0x00d2 R
  mov [r1], r0                          ; 0x00d3 $
  jmp .l_42                             ; 0x00d4 .
.l_43
  dw .l_44
.l_42
  mov r0, 1                             ; 0x00d7 .
  add r3, r0                            ; 0x00d8 L
  push [.l_43]                          ; 0x00d9 .
  pop pc                                ; 0x00da .
.l_45
  dw -10
.l_10
  push [.l_45]                          ; 0x00dd .
  pop r2                                ; 0x00de .
  pop r1                                ; 0x00df .
  push r13                              ; 0x00e0 .
  mov r3, 1                             ; 0x00e1 .
.l_47
  int 1                                 ; 0x00e2 .
  mov [r1], r0                          ; 0x00e3 $
  add r0, r2                            ; 0x00e4 B
  jz .l_46                              ; 0x00e5 .
  add r1, r3                            ; 0x00e6 G
  jmp .l_47                             ; 0x00e7 .
.l_46
  pop pc                                ; 0x00e8 .
.l_48
  dw -1
.l_5
  push [.l_48]                          ; 0x00eb .
  pop r2                                ; 0x00ec .
  pop r1                                ; 0x00ed .
  pop r0                                ; 0x00ee .
  push r13                              ; 0x00ef .
  mov r3, 1                             ; 0x00f0 .
.l_50
  jz .l_49                              ; 0x00f1 .
  push r0                               ; 0x00f2 .
  mov r0, [r1]                          ; 0x00f3 1
  int 2                                 ; 0x00f4 .
  add r1, r3                            ; 0x00f5 G
  pop r0                                ; 0x00f6 .
  add r0, r2                            ; 0x00f7 B
  jmp .l_50                             ; 0x00f8 .
.l_49
  pop pc                                ; 0x00f9 .
  push [.l_51]                          ; 0x00fa .
  pop pc                                ; 0x00fb .
.l_51
  dw .l_52
  pop pc                                ; 0x00fe .
  pop pc                                ; 0x00ff .
  jz .l_53                              ; 0x0100 .
  jnz .l_54                             ; 0x0101 .
  add r0, r0                            ; 0x0102 @
  xor r1, r3                            ; 0x0103 W
  mul r0, r2                            ; 0x0104 .
.l_54
  and r1, r2                            ; 0x0105 f
  xor r0, r2                            ; 0x0106 R
  or r0, r0                             ; 0x0107 p
.l_53
  add r1, r3                            ; 0x0108 G
  add r2, r0                            ; 0x0109 H
  add r0, r0                            ; 0x010a @
  mov r2, [r2]                          ; 0x010b :
.l_59
  add r1, r2                            ; 0x010c F
.l_57
  mov r0, [r1]                          ; 0x010d 1
.l_55
  add r0, r0                            ; 0x010e @
.l_58
  int 0                                 ; 0x010f .
.l_52
  jz .l_55                              ; 0x0110 .
  jz .l_56                              ; 0x0111 .
  jz .l_57                              ; 0x0112 .
  jz .l_58                              ; 0x0113 .
  jnz .l_59                             ; 0x0114 .
  int 14                                ; 0x0115 .
  int 14                                ; 0x0116 .
  int 8                                 ; 0x0117 .
.l_56
  mov r0, -2                            ; 0x0118 .
  int 5                                 ; 0x0119 .
  int 15                                ; 0x011a .
  int 0                                 ; 0x011b .
  and r1, r2                            ; 0x011c f
  mov r3, -1                            ; 0x011d .
  mov r1, 1                             ; 0x011e .
  int 6                                 ; 0x011f .
  int 1                                 ; 0x0120 .
  int 9                                 ; 0x0121 .
  or r0, r0                             ; 0x0122 p
  or r3, r1                             ; 0x0123 }
  and r1, r2                            ; 0x0124 f
  int 10                                ; 0x0125 .
  int 13                                ; 0x0126 .
  int 6                                 ; 0x0127 .
  int 1                                 ; 0x0128 .
  and r0, r1                            ; 0x0129 a
  mov r1, 1                             ; 0x012a .
  mov [r3], r3                          ; 0x012b /
  or r1, r3                             ; 0x012c w
  mov r3, [r3]                          ; 0x012d ?
  or r0, r0                             ; 0x012e p
  mov r1, [r0]                          ; 0x012f 4
  or r1, r2                             ; 0x0130 v
  mov [r0], r2                          ; 0x0131 "
  mov [r3], r1                          ; 0x0132 -
  mov r3, [r2]                          ; 0x0133 >
  mov r0, -2                            ; 0x0134 .
  mov [r1], r0                          ; 0x0135 $
  or r0, r2                             ; 0x0136 r
  int 5                                 ; 0x0137 .
  mov [r0], r3                          ; 0x0138 #
  mov [r2], r3                          ; 0x0139 +
  mov [r3], r1                          ; 0x013a -
  mov [r2], r1                          ; 0x013b )
  mov [r2], r0                          ; 0x013c (
  mov [r1], r1                          ; 0x013d %
  mov [r3], r3                          ; 0x013e /
  mov [r0], r0                          ; 0x013f  
.l_60
  add r3, r0                            ; 0x0140 L
  add r3, r0                            ; 0x0141 L
  and r3, r1                            ; 0x0142 m
  add r1, r2                            ; 0x0143 F
.l_61
  xor r0, r3                            ; 0x0144 S
.l_62
  add r3, r0                            ; 0x0145 L
  jz .l_60                              ; 0x0146 .
  jz .l_61                              ; 0x0147 .
  jz .l_62                              ; 0x0148 .
.l_64
  jz .l_63                              ; 0x0149 .
  jnz .l_64                             ; 0x014a .
.l_63
  mul r0, r2                            ; 0x014b .
  add r1, r2                            ; 0x014c F
.l_66
  add r2, r0                            ; 0x014d H
.l_67
  add r0, r0                            ; 0x014e @
  mov r2, [r2]                          ; 0x014f :
.l_70
  add r1, r2                            ; 0x0150 F
  jnz .l_65                             ; 0x0151 .
  jz .l_66                              ; 0x0152 .
  div r2, r3                            ; 0x0153 .
.l_65
  jz .l_67                              ; 0x0154 .
  jz .l_68                              ; 0x0155 .
  jz .l_69                              ; 0x0156 .
.l_73
  jnz .l_70                             ; 0x0157 .
.l_69
  jnz .l_70                             ; 0x0158 .
  add r3, r1                            ; 0x0159 M
  mov r2, -2                            ; 0x015a .
  jnz .l_71                             ; 0x015b .
.l_68
  jnz .l_72                             ; 0x015c .
  jnz .l_73                             ; 0x015d .
  jnz .l_74                             ; 0x015e .
  div r2, r2                            ; 0x015f .
.l_71
  mov r2, 1                             ; 0x0160 .
.l_72
  div r2, r1                            ; 0x0161 .
  jnz .l_75                             ; 0x0162 .
  mov r1, 0                             ; 0x0163 .
  push [.l_76]                          ; 0x0164 .
.l_75
  mul r3, r0                            ; 0x0165 .
.l_74
  jnz .l_75                             ; 0x0166 .
  div r0, r1                            ; 0x0167 .
  jnz .l_77                             ; 0x0168 .
  div r2, r3                            ; 0x0169 .
  jnz .l_76                             ; 0x016a .
  div r1, r0                            ; 0x016b .
.l_76
  dw -19243
.l_79
  int 0                                 ; 0x016e .
  or r1, r3                             ; 0x016f w
.l_77
  div r0, r2                            ; 0x0170 .
  jnz .l_79                             ; 0x0171 .
.l_78
  int 6                                 ; 0x0172 .
  or r3, r2                             ; 0x0173 ~
.l_81
  int 14                                ; 0x0174 .
  and r2, r2                            ; 0x0175 j
.l_80
  mul r0, r0                            ; 0x0176 .
  add r1, r2                            ; 0x0177 F
  mov [r1], r3                          ; 0x0178 '
  xor r3, r1                            ; 0x0179 ]
  int 13                                ; 0x017a .
.l_83
  jz .l_80                              ; 0x017b .
  jnz .l_81                             ; 0x017c .
  push r11                              ; 0x017d .
  jz .l_80                              ; 0x017e .
  pop r3                                ; 0x017f .
  jnz .l_82                             ; 0x0180 .
  div r2, r0                            ; 0x0181 .
  mov r3, [r3]                          ; 0x0182 ?
  jmp .l_83                             ; 0x0183 .
  pop r10                               ; 0x0184 .
.l_82
  xor r2, r3                            ; 0x0185 [
  add r1, r1                            ; 0x0186 E
  jz .l_84                              ; 0x0187 .
  xor r1, r2                            ; 0x0188 V
  and r0, r0                            ; 0x0189 `
  add r3, r2                            ; 0x018a N
  jnz .l_85                             ; 0x018b .
.l_84
  add r1, r1                            ; 0x018c E
  xor r2, r3                            ; 0x018d [
  div r3, r2                            ; 0x018e .
.l_85
  jnz .l_86                             ; 0x018f .
  xor r1, r0                            ; 0x0190 T
  xor r2, r0                            ; 0x0191 X
  add r1, r3                            ; 0x0192 G
  jz .l_87                              ; 0x0193 .
.l_86
  jnz .l_88                             ; 0x0194 .
  add r0, r1                            ; 0x0195 A
.l_87
  div r3, r2                            ; 0x0196 .
  jz .l_89                              ; 0x0197 .
  add r3, r0                            ; 0x0198 L
.l_89
  xor r2, r0                            ; 0x0199 X
  add r1, r3                            ; 0x019a G
  mul r2, r1                            ; 0x019b .
.l_88
  jnz .l_90                             ; 0x019c .
  int 5                                 ; 0x019d .
  and r1, r1                            ; 0x019e e
  xor r1, r0                            ; 0x019f T
  or r0, r1                             ; 0x01a0 q
  or r3, r2                             ; 0x01a1 ~
  add r0, r0                            ; 0x01a2 @
  div r1, r2                            ; 0x01a3 .
  jnz .l_91                             ; 0x01a4 .
.l_90
  add r1, r0                            ; 0x01a5 D
  xor r3, r3                            ; 0x01a6 _
  div r1, r1                            ; 0x01a7 .
  jnz .l_92                             ; 0x01a8 .
  int 5                                 ; 0x01a9 .
  and r1, r1                            ; 0x01aa e
.l_91
  add r2, r2                            ; 0x01ab J
  xor r2, r3                            ; 0x01ac [
  xor r1, r3                            ; 0x01ad W
  jnz .l_93                             ; 0x01ae .
  xor r0, r3                            ; 0x01af S
  xor r2, r3                            ; 0x01b0 [
.l_92
  add r2, r2                            ; 0x01b1 J
.l_93
  xor r3, r3                            ; 0x01b2 _
  xor r0, r3                            ; 0x01b3 S
  or r1, r0                             ; 0x01b4 t
  add r2, r3                            ; 0x01b5 K
  and r1, r3                            ; 0x01b6 g
  add r0, r1                            ; 0x01b7 A
  mul r3, r2                            ; 0x01b8 .
.l_96
  dw -24654
.l_97
  push [.l_95]                          ; 0x01bb .
  int 5                                 ; 0x01bc .
  div r3, r3                            ; 0x01bd .
.l_94
  push [.l_96]                          ; 0x01be .
.l_98
  dw -13073
  pop r3                                ; 0x01c1 .
.l_95
  dw -825
  pop sp                                ; 0x01c4 .
  pop r8                                ; 0x01c5 .
  pop sp                                ; 0x01c6 .
  push r8                               ; 0x01c7 .
  pop r9                                ; 0x01c8 .
  mul r1, r3                            ; 0x01c9 .
  pop r8                                ; 0x01ca .
  push r8                               ; 0x01cb .
.l_99
  push pc                               ; 0x01cc .
  div r3, r1                            ; 0x01cd .
.l_100
  dw 14088
  mov r0, 1                             ; 0x01d0 .
  push [.l_100]                         ; 0x01d1 .
  mov [r1], r0                          ; 0x01d2 $
  xor r3, r1                            ; 0x01d3 ]
  add r1, r1                            ; 0x01d4 E
  div r1, r3                            ; 0x01d5 .
  pop r11                               ; 0x01d6 .
  and r1, r3                            ; 0x01d7 g
  or r1, r3                             ; 0x01d8 w
  div r2, r2                            ; 0x01d9 .
  xor r1, r3                            ; 0x01da W
.l_101
  mul r2, r2                            ; 0x01db .
  jmp .l_101                            ; 0x01dc .
  int 3                                 ; 0x01dd .
  or r2, r0                             ; 0x01de x
  mul r1, r2                            ; 0x01df .
  and r0, r1                            ; 0x01e0 a
  jz .l_102                             ; 0x01e1 .
  div r2, r1                            ; 0x01e2 .
  mul r2, r0                            ; 0x01e3 .
  and r2, r2                            ; 0x01e4 j
  jz .l_103                             ; 0x01e5 .
.l_102
  or r2, r2                             ; 0x01e6 z
  jz .l_104                             ; 0x01e7 .
.l_103
  or r0, r1                             ; 0x01e8 q
.l_106
  jz .l_105                             ; 0x01e9 .
.l_109
  or r3, r1                             ; 0x01ea }
  add r0, r1                            ; 0x01eb A
  jz .l_106                             ; 0x01ec .
.l_108
  and r1, r2                            ; 0x01ed f
.l_105
  jnz .l_107                            ; 0x01ee .
  mov r1, 1                             ; 0x01ef .
.l_104
  jz .l_108                             ; 0x01f0 .
  jmp .l_109                            ; 0x01f1 .
  push r3                               ; 0x01f2 .
  and r0, r2                            ; 0x01f3 b
  mov r2, [r1]                          ; 0x01f4 9
  mov r1, [r2]                          ; 0x01f5 6
.l_107
  and r2, r1                            ; 0x01f6 i
.l_110
  xor r1, r3                            ; 0x01f7 W
  jnz .l_110                            ; 0x01f8 .
  div r3, r1                            ; 0x01f9 .
.l_112
  jmp .l_111                            ; 0x01fa .
  and r2, r3                            ; 0x01fb k
.l_111
  jnz .l_112                            ; 0x01fc .
.l_113
  mul r3, r0                            ; 0x01fd .
.l_114
  jnz .l_113                            ; 0x01fe .
  jz .l_111                             ; 0x01ff .
  jnz .l_114                            ; 0x0200 .
  push r11                              ; 0x0201 .
.l_117
  jmp .l_115                            ; 0x0202 .
  jz .l_116                             ; 0x0203 .
.l_115
  jnz .l_117                            ; 0x0204 .
  push r7                               ; 0x0205 .
.l_119
  jmp .l_118                            ; 0x0206 .
  and r2, r3                            ; 0x0207 k
.l_118
  jnz .l_119                            ; 0x0208 .
.l_120
  and r1, r3                            ; 0x0209 g
.l_116
  jnz .l_120                            ; 0x020a .
  jz .l_118                             ; 0x020b .
  jmp .l_121                            ; 0x020c .
.l_122
  add r3, r1                            ; 0x020d M
.l_121
  jnz .l_122                            ; 0x020e .
.l_123
  jz .l_118                             ; 0x020f .
  jnz .l_123                            ; 0x0210 .
.l_124
  div r3, r1                            ; 0x0211 .
  jnz .l_124                            ; 0x0212 .
  mov [r1], r1                          ; 0x0213 %
  push r1                               ; 0x0214 .
  int 10                                ; 0x0215 .
.l_126
  jmp .l_125                            ; 0x0216 .
  and r2, r3                            ; 0x0217 k
.l_125
  jnz .l_126                            ; 0x0218 .
  xor r3, r2                            ; 0x0219 ^
  jmp .l_127                            ; 0x021a .
.l_128
  and r2, r3                            ; 0x021b k
.l_127
  jnz .l_128                            ; 0x021c .
  div r3, r1                            ; 0x021d .
.l_130
  jmp .l_129                            ; 0x021e .
  pop r12                               ; 0x021f .
.l_129
  jnz .l_130                            ; 0x0220 .
.l_131
  jmp .l_130                            ; 0x0221 .
  jnz .l_131                            ; 0x0222 .
  jz .l_132                             ; 0x0223 .
  jmp .l_133                            ; 0x0224 .
.l_134
  xor r1, r1                            ; 0x0225 U
.l_133
  jnz .l_134                            ; 0x0226 .
.l_136
  jz .l_135                             ; 0x0227 .
  jnz .l_136                            ; 0x0228 .
.l_137
  div r3, r1                            ; 0x0229 .
.l_132
  jnz .l_137                            ; 0x022a .
  mov [r3], r1                          ; 0x022b -
  jnz .l_132                            ; 0x022c .
  push r7                               ; 0x022d .
.l_135
  push r2                               ; 0x022e .
  push r8                               ; 0x022f .
  jnz .l_135                            ; 0x0230 .
  mov r3, [r0]                          ; 0x0231 <
  jmp .l_138                            ; 0x0232 .
.l_139
  and r3, r3                            ; 0x0233 o
.l_138
  dw -16479
.l_141
.l_142
  jnz .l_141                            ; 0x0236 .
  xor r2, r2                            ; 0x0237 Z
.l_140
  jnz .l_142                            ; 0x0238 .
.l_143
  push [.l_138]                         ; 0x0239 .
  jnz .l_143                            ; 0x023a .
.l_144
  jz .l_138                             ; 0x023b .
  jnz .l_144                            ; 0x023c .
.l_145
  push r7                               ; 0x023d .
  jnz .l_145                            ; 0x023e .
.l_147
  jz .l_146                             ; 0x023f .
.l_151
  dw -16479
.l_149
.l_150
  jnz .l_149                            ; 0x0242 .
  mov r1, [r1]                          ; 0x0243 5
.l_148
  jnz .l_150                            ; 0x0244 .
  push [.l_151]                         ; 0x0245 .
.l_146
  jmp .l_152                            ; 0x0246 .
  or r0, r3                             ; 0x0247 s
.l_152
  jnz .l_146                            ; 0x0248 .
  push r11                              ; 0x0249 .
.l_154
  jmp .l_153                            ; 0x024a .
  and r3, r3                            ; 0x024b o
.l_153
  jnz .l_154                            ; 0x024c .
  xor r1, r3                            ; 0x024d W
  push r2                               ; 0x024e .
.l_155
  push r8                               ; 0x024f .
  jnz .l_155                            ; 0x0250 .
.l_157
  jz .l_156                             ; 0x0251 .
  jnz .l_157                            ; 0x0252 .
.l_158
  mov [r3], r0                          ; 0x0253 ,
.l_156
  jnz .l_158                            ; 0x0254 .
  jz .l_159                             ; 0x0255 .
.l_160
  jmp .l_159                            ; 0x0256 .
  and r3, r3                            ; 0x0257 o
.l_159
  jnz .l_160                            ; 0x0258 .
.l_161
  int 8                                 ; 0x0259 .
  jnz .l_161                            ; 0x025a .
  div r2, r3                            ; 0x025b .
  and r0, r1                            ; 0x025c a
.l_163
  jz .l_162                             ; 0x025d .
.l_164
  jnz .l_163                            ; 0x025e .
.l_162
  push r6                               ; 0x025f .
  jnz .l_164                            ; 0x0260 .
  jmp .l_162                            ; 0x0261 .
.l_165
  int 7                                 ; 0x0262 .
  add r2, r0                            ; 0x0263 H
  jnz .l_165                            ; 0x0264 .
.l_166
  int 8                                 ; 0x0265 .
  jnz .l_166                            ; 0x0266 .
  div r3, r1                            ; 0x0267 .
  push r0                               ; 0x0268 .
.l_167
  int 11                                ; 0x0269 .
.l_168
  jnz .l_167                            ; 0x026a .
  push r6                               ; 0x026b .
  jnz .l_168                            ; 0x026c .
  push r0                               ; 0x026d .
.l_169
  mov r2, [r2]                          ; 0x026e :
  mov [r0], r0                          ; 0x026f  
  jnz .l_169                            ; 0x0270 .
.l_170
  xor r3, r3                            ; 0x0271 _
  jnz .l_170                            ; 0x0272 .
  jz .l_171                             ; 0x0273 .
  push r1                               ; 0x0274 .
.l_172
  int 10                                ; 0x0275 .
  jnz .l_172                            ; 0x0276 .
.l_173
  int 10                                ; 0x0277 .
  jnz .l_173                            ; 0x0278 .
  jmp .l_174                            ; 0x0279 .
.l_171
  pop r5                                ; 0x027a .
  xor r3, r2                            ; 0x027b ^
  add r3, r0                            ; 0x027c L
  or r2, r2                             ; 0x027d z
  pop r4                                ; 0x027e .
  or r2, r0                             ; 0x027f x
.l_174
  mov [r0], r0                          ; 0x0280  
  and r2, r0                            ; 0x0281 h
  jmp .l_175                            ; 0x0282 .
  push r0                               ; 0x0283 .
  add r2, r3                            ; 0x0284 K
  mov r0, [r0]                          ; 0x0285 0
  add r0, r3                            ; 0x0286 C
.l_175
  add r3, r3                            ; 0x0287 O
  add r1, r0                            ; 0x0288 D
  add r1, r1                            ; 0x0289 E
  mov [r0], r0                          ; 0x028a  
  xor r0, r2                            ; 0x028b R
  add r1, r1                            ; 0x028c E
  add r2, r2                            ; 0x028d J
  add r1, r1                            ; 0x028e E
  add r0, r3                            ; 0x028f C
  xor r1, r0                            ; 0x0290 T
  add r1, r1                            ; 0x0291 E
  add r1, r0                            ; 0x0292 D
  int 10                                ; 0x0293 .
.l_176
  dw 14
.l_177
  dw 646
.l_178
  dw .l_5
.l_30
  push [.l_176]                         ; 0x029a .
  push [.l_177]                         ; 0x029b .
  push [.l_178]                         ; 0x029c .
  pop pc                                ; 0x029d .
.l_179
  mov r0, 1                             ; 0x029e .
  int 0                                 ; 0x029f .
