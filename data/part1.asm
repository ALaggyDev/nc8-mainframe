  push [.l_0]                           ; 0x0000 .
  pop pc                                ; 0x0001 .
.l_0
  dw .l_1
  xor r0, r0                            ; 0x0004 P
  add r3, r0                            ; 0x0005 L
  add r1, r1                            ; 0x0006 E
  add r0, r1                            ; 0x0007 A
  xor r0, r3                            ; 0x0008 S
  add r1, r1                            ; 0x0009 E
  mov [r0], r0                          ; 0x000a  
  add r1, r1                            ; 0x000b E
  add r3, r2                            ; 0x000c N
  xor r1, r0                            ; 0x000d T
  add r1, r1                            ; 0x000e E
  xor r0, r2                            ; 0x000f R
  mov [r0], r0                          ; 0x0010  
  add r0, r3                            ; 0x0011 C
  add r3, r3                            ; 0x0012 O
  add r1, r0                            ; 0x0013 D
  add r1, r1                            ; 0x0014 E
  mov [r0], r0                          ; 0x0015  
  mov [r0], r3                          ; 0x0016 #
  mov r0, [r1]                          ; 0x0017 1
  int 10                                ; 0x0018 .
.l_2
  dw 21
.l_3
  dw 4
.l_4
  dw .l_5
.l_1
  push [.l_2]                           ; 0x001f .
  push [.l_3]                           ; 0x0020 .
  push [.l_4]                           ; 0x0021 .
  pop pc                                ; 0x0022 .
.l_6
  jmp .l_7                              ; 0x0023 .
.l_8
  dw 390
.l_9
  dw .l_10
.l_7
  push [.l_8]                           ; 0x0028 .
  push [.l_9]                           ; 0x0029 .
  pop pc                                ; 0x002a .
.l_11
  jmp .l_12                             ; 0x002b .
.l_13
  dw 390
.l_14
  dw .l_15
.l_12
  push [.l_13]                          ; 0x0030 .
  push [.l_14]                          ; 0x0031 .
  pop pc                                ; 0x0032 .
.l_16
  jmp .l_17                             ; 0x0033 .
.l_21
  dw .l_22
.l_19
  dw .l_20
.l_17
  jz .l_18                              ; 0x0038 .
  push [.l_19]                          ; 0x0039 .
  pop pc                                ; 0x003a .
.l_18
  push [.l_21]                          ; 0x003b .
  pop pc                                ; 0x003c .
.l_23
  add r0, r3                            ; 0x003d C
  add r3, r3                            ; 0x003e O
  add r1, r0                            ; 0x003f D
  add r1, r1                            ; 0x0040 E
  mov [r0], r0                          ; 0x0041  
  add r0, r1                            ; 0x0042 A
  add r0, r3                            ; 0x0043 C
  add r0, r3                            ; 0x0044 C
  add r1, r1                            ; 0x0045 E
  xor r0, r0                            ; 0x0046 P
  xor r1, r0                            ; 0x0047 T
  add r1, r1                            ; 0x0048 E
  add r1, r0                            ; 0x0049 D
  int 10                                ; 0x004a .
.l_24
  dw 14
.l_25
  dw 61
.l_26
  dw .l_5
.l_20
  push [.l_24]                          ; 0x0051 .
  push [.l_25]                          ; 0x0052 .
  push [.l_26]                          ; 0x0053 .
  pop pc                                ; 0x0054 .
.l_27
  xor r0, r0                            ; 0x0055 P
  int 0                                 ; 0x0056 .
  add r0, r3                            ; 0x0057 C
  add r3, r3                            ; 0x0058 O
  add r1, r0                            ; 0x0059 D
  add r1, r1                            ; 0x005a E
  mov [r0], r0                          ; 0x005b  
  xor r0, r2                            ; 0x005c R
  add r1, r1                            ; 0x005d E
  add r2, r2                            ; 0x005e J
  add r1, r1                            ; 0x005f E
  add r0, r3                            ; 0x0060 C
  xor r1, r0                            ; 0x0061 T
  add r1, r1                            ; 0x0062 E
  add r1, r0                            ; 0x0063 D
  int 10                                ; 0x0064 .
.l_28
  dw 14
.l_29
  dw 87
.l_30
  dw .l_5
.l_22
  push [.l_28]                          ; 0x006b .
  push [.l_29]                          ; 0x006c .
  push [.l_30]                          ; 0x006d .
  pop pc                                ; 0x006e .
.l_31
  mov r0, 1                             ; 0x006f .
.l_33
  int 0                                 ; 0x0070 .
.l_15
  pop r2                                ; 0x0071 .
  push r13                              ; 0x0072 .
  mov r3, 1                             ; 0x0073 .
  jmp .l_32                             ; 0x0074 .
.l_34
  dw -70
.l_32
  push [.l_34]                          ; 0x0077 .
  pop r0                                ; 0x0078 .
  mov r1, [r2]                          ; 0x0079 6
  add r2, r3                            ; 0x007a K
  add r0, r1                            ; 0x007b A
  jz .l_35                              ; 0x007c .
  xor r0, r0                            ; 0x007d P
  pop pc                                ; 0x007e .
.l_37
  dw -76
.l_35
  push [.l_37]                          ; 0x0081 .
  pop r0                                ; 0x0082 .
  mov r1, [r2]                          ; 0x0083 6
  add r2, r3                            ; 0x0084 K
  add r0, r1                            ; 0x0085 A
.l_36
  jz .l_38                              ; 0x0086 .
  xor r0, r0                            ; 0x0087 P
  pop pc                                ; 0x0088 .
.l_39
  dw -65
.l_38
  push [.l_39]                          ; 0x008b .
  pop r0                                ; 0x008c .
.l_41
  mov r1, [r2]                          ; 0x008d 6
  add r2, r3                            ; 0x008e K
  add r0, r1                            ; 0x008f A
  jz .l_40                              ; 0x0090 .
  xor r0, r0                            ; 0x0091 P
  pop pc                                ; 0x0092 .
.l_42
  dw -71
.l_40
  push [.l_42]                          ; 0x0095 .
  pop r0                                ; 0x0096 .
  mov r1, [r2]                          ; 0x0097 6
  add r2, r3                            ; 0x0098 K
  add r0, r1                            ; 0x0099 A
  jz .l_43                              ; 0x009a .
  xor r0, r0                            ; 0x009b P
  pop pc                                ; 0x009c .
.l_44
  dw -45
.l_43
  push [.l_44]                          ; 0x009f .
  pop r0                                ; 0x00a0 .
  mov r1, [r2]                          ; 0x00a1 6
  add r2, r3                            ; 0x00a2 K
  add r0, r1                            ; 0x00a3 A
  jz .l_45                              ; 0x00a4 .
  xor r0, r0                            ; 0x00a5 P
.l_46
  pop pc                                ; 0x00a6 .
.l_47
  dw -66
.l_45
  push [.l_47]                          ; 0x00a9 .
  pop r0                                ; 0x00aa .
  mov r1, [r2]                          ; 0x00ab 6
  add r2, r3                            ; 0x00ac K
  add r0, r1                            ; 0x00ad A
  jz .l_48                              ; 0x00ae .
  xor r0, r0                            ; 0x00af P
  pop pc                                ; 0x00b0 .
.l_50
  dw -64
.l_48
  push [.l_50]                          ; 0x00b3 .
.l_49
  pop r0                                ; 0x00b4 .
  mov r1, [r2]                          ; 0x00b5 6
  add r2, r3                            ; 0x00b6 K
  add r0, r1                            ; 0x00b7 A
  jz .l_51                              ; 0x00b8 .
  xor r0, r0                            ; 0x00b9 P
  pop pc                                ; 0x00ba .
.l_52
  dw -98
.l_51
  push [.l_52]                          ; 0x00bd .
  pop r0                                ; 0x00be .
  mov r1, [r2]                          ; 0x00bf 6
  add r2, r3                            ; 0x00c0 K
  add r0, r1                            ; 0x00c1 A
  jz .l_53                              ; 0x00c2 .
  xor r0, r0                            ; 0x00c3 P
  pop pc                                ; 0x00c4 .
.l_54
  dw -121
.l_53
  push [.l_54]                          ; 0x00c7 .
  pop r0                                ; 0x00c8 .
  mov r1, [r2]                          ; 0x00c9 6
  add r2, r3                            ; 0x00ca K
  add r0, r1                            ; 0x00cb A
  jz .l_55                              ; 0x00cc .
  xor r0, r0                            ; 0x00cd P
  pop pc                                ; 0x00ce .
.l_57
  dw -95
.l_55
  push [.l_57]                          ; 0x00d1 .
  pop r0                                ; 0x00d2 .
.l_56
  mov r1, [r2]                          ; 0x00d3 6
  add r2, r3                            ; 0x00d4 K
  add r0, r1                            ; 0x00d5 A
  jz .l_58                              ; 0x00d6 .
  xor r0, r0                            ; 0x00d7 P
  pop pc                                ; 0x00d8 .
.l_59
  dw -115
.l_58
  push [.l_59]                          ; 0x00db .
  pop r0                                ; 0x00dc .
  mov r1, [r2]                          ; 0x00dd 6
  add r2, r3                            ; 0x00de K
  add r0, r1                            ; 0x00df A
  jz .l_60                              ; 0x00e0 .
  xor r0, r0                            ; 0x00e1 P
  pop pc                                ; 0x00e2 .
.l_61
  dw -116
.l_60
  push [.l_61]                          ; 0x00e5 .
  pop r0                                ; 0x00e6 .
  mov r1, [r2]                          ; 0x00e7 6
  add r2, r3                            ; 0x00e8 K
  add r0, r1                            ; 0x00e9 A
  jz .l_62                              ; 0x00ea .
.l_63
  xor r0, r0                            ; 0x00eb P
  pop pc                                ; 0x00ec .
.l_64
  dw -51
.l_62
  push [.l_64]                          ; 0x00ef .
  pop r0                                ; 0x00f0 .
  mov r1, [r2]                          ; 0x00f1 6
  add r2, r3                            ; 0x00f2 K
  add r0, r1                            ; 0x00f3 A
  jz .l_65                              ; 0x00f4 .
  xor r0, r0                            ; 0x00f5 P
  pop pc                                ; 0x00f6 .
.l_66
  dw -112
.l_65
  push [.l_66]                          ; 0x00f9 .
  pop r0                                ; 0x00fa .
  mov r1, [r2]                          ; 0x00fb 6
  add r2, r3                            ; 0x00fc K
  add r0, r1                            ; 0x00fd A
  jz .l_67                              ; 0x00fe .
  xor r0, r0                            ; 0x00ff P
  pop pc                                ; 0x0100 .
.l_68
  dw -115
.l_67
  push [.l_68]                          ; 0x0103 .
  pop r0                                ; 0x0104 .
  mov r1, [r2]                          ; 0x0105 6
  add r2, r3                            ; 0x0106 K
  add r0, r1                            ; 0x0107 A
  jz .l_69                              ; 0x0108 .
  xor r0, r0                            ; 0x0109 P
  pop pc                                ; 0x010a .
.l_71
  dw -95
.l_69
  push [.l_71]                          ; 0x010d .
  pop r0                                ; 0x010e .
.l_70
  mov r1, [r2]                          ; 0x010f 6
  add r2, r3                            ; 0x0110 K
  add r0, r1                            ; 0x0111 A
  jz .l_72                              ; 0x0112 .
  xor r0, r0                            ; 0x0113 P
  pop pc                                ; 0x0114 .
.l_73
  dw -119
.l_72
  push [.l_73]                          ; 0x0117 .
  pop r0                                ; 0x0118 .
  mov r1, [r2]                          ; 0x0119 6
  add r2, r3                            ; 0x011a K
  add r0, r1                            ; 0x011b A
  jz .l_74                              ; 0x011c .
  xor r0, r0                            ; 0x011d P
  pop pc                                ; 0x011e .
.l_75
  dw -49
.l_74
  push [.l_75]                          ; 0x0121 .
  pop r0                                ; 0x0122 .
  mov r1, [r2]                          ; 0x0123 6
  add r2, r3                            ; 0x0124 K
  add r0, r1                            ; 0x0125 A
  jz .l_76                              ; 0x0126 .
  xor r0, r0                            ; 0x0127 P
  pop pc                                ; 0x0128 .
.l_77
  dw -116
.l_76
  push [.l_77]                          ; 0x012b .
  pop r0                                ; 0x012c .
  mov r1, [r2]                          ; 0x012d 6
  add r2, r3                            ; 0x012e K
  add r0, r1                            ; 0x012f A
  jz .l_78                              ; 0x0130 .
  xor r0, r0                            ; 0x0131 P
  pop pc                                ; 0x0132 .
.l_79
  dw -104
.l_78
  push [.l_79]                          ; 0x0135 .
  pop r0                                ; 0x0136 .
  mov r1, [r2]                          ; 0x0137 6
  add r2, r3                            ; 0x0138 K
  add r0, r1                            ; 0x0139 A
  jz .l_80                              ; 0x013a .
  xor r0, r0                            ; 0x013b P
  pop pc                                ; 0x013c .
.l_82
  dw -95
.l_80
  push [.l_82]                          ; 0x013f .
  pop r0                                ; 0x0140 .
.l_81
  mov r1, [r2]                          ; 0x0141 6
  add r2, r3                            ; 0x0142 K
  add r0, r1                            ; 0x0143 A
  jz .l_83                              ; 0x0144 .
  xor r0, r0                            ; 0x0145 P
  pop pc                                ; 0x0146 .
.l_85
  dw -78
.l_83
  push [.l_85]                          ; 0x0149 .
  pop r0                                ; 0x014a .
  mov r1, [r2]                          ; 0x014b 6
.l_84
  add r2, r3                            ; 0x014c K
  add r0, r1                            ; 0x014d A
  jz .l_86                              ; 0x014e .
.l_87
  xor r0, r0                            ; 0x014f P
  pop pc                                ; 0x0150 .
.l_88
  dw -67
.l_86
  push [.l_88]                          ; 0x0153 .
.l_90
  pop r0                                ; 0x0154 .
  mov r1, [r2]                          ; 0x0155 6
  add r2, r3                            ; 0x0156 K
  add r0, r1                            ; 0x0157 A
  jz .l_89                              ; 0x0158 .
  xor r0, r0                            ; 0x0159 P
  pop pc                                ; 0x015a .
.l_91
  dw -56
.l_89
  push [.l_91]                          ; 0x015d .
  pop r0                                ; 0x015e .
  mov r1, [r2]                          ; 0x015f 6
  add r2, r3                            ; 0x0160 K
  add r0, r1                            ; 0x0161 A
  jz .l_92                              ; 0x0162 .
  xor r0, r0                            ; 0x0163 P
  pop pc                                ; 0x0164 .
.l_92
  mov r0, 1                             ; 0x0165 .
  pop pc                                ; 0x0166 .
.l_93
  dw -10
.l_10
  push [.l_93]                          ; 0x0169 .
  pop r2                                ; 0x016a .
  pop r1                                ; 0x016b .
  push r13                              ; 0x016c .
  mov r3, 1                             ; 0x016d .
.l_95
  int 1                                 ; 0x016e .
  mov [r1], r0                          ; 0x016f $
  add r0, r2                            ; 0x0170 B
  jz .l_94                              ; 0x0171 .
  add r1, r3                            ; 0x0172 G
  jmp .l_95                             ; 0x0173 .
.l_94
  pop pc                                ; 0x0174 .
.l_96
  dw -1
.l_5
  push [.l_96]                          ; 0x0177 .
  pop r2                                ; 0x0178 .
  pop r1                                ; 0x0179 .
  pop r0                                ; 0x017a .
  push r13                              ; 0x017b .
  mov r3, 1                             ; 0x017c .
.l_98
  jz .l_97                              ; 0x017d .
  push r0                               ; 0x017e .
  mov r0, [r1]                          ; 0x017f 1
  int 2                                 ; 0x0180 .
  add r1, r3                            ; 0x0181 G
  pop r0                                ; 0x0182 .
  add r0, r2                            ; 0x0183 B
  jmp .l_98                             ; 0x0184 .
.l_97
  pop pc                                ; 0x0185 .
  int 0                                 ; 0x0186 .
