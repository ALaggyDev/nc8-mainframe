from pwn import *

# FLAG-A_B1t_M0R3_C0MPl3X_15nTnit?

# FLAG-Th1s1s0nlyTh3Beglnning
# FLAG-3very_B055_13vel_H4s_3_st4ge

# What does the code do?

# Stage 1
# It seems to xor the bytes between 0x0100 to 0x01E8 with the key (0..4 bytes of input) repeated over
# Readable ascii from 0x105 to 0x0140: "BOOTING STAGE1: FLAG-Th1s1s0nlyTh3Beglnning"

# Stage 2
# Code to xor at from 0x0140 to ? - add between 0x016D to ? with the (4..8 bytes of input) repeated over

# Flag verification
# Check if buffer from 0x104 to ?, equals buffer from 0x17d to ?

# Stage 3
# Fancy sp magic later, we jumped to 0x00B9, sp = 0x01fe
# Program seems to take buffer from 0x104..0x108, and xor on the flag (12..20)
# Then check if 0x27a..? equals flag (12..20)

# ....... Then (step 14220)
# Program add 0x0282..0x0286 to 0x00fa..0x00fe
# (0x00fa..0x00fe) == A3CE 4C40
# Program xor 0x100..? with key (20..24) til steps ~20500
# Program check 0x0100..0x0104 equals 0x00fa..0x00fe

# ....... Then (step 20693)
# Program xor key (24..32) with 0x104..?
# Program check key (24..32) equals 0x01d2-?

# ....... Then (step 21078)
# Program xor 0x100..0x01F8 with key (32..36) til steps ~27300
# Program check 0x100..? equals 0x00fa..? (4 bytes)


def get_add(a, b):
    val = b-a
    if val >= 0:
        return chr(val)
    else:
        return chr(256 + val)

# original = unhex("F5D4 7E8F BC17 04E4 102C 0FF5 0317 DFF4 1214 06E6 F00D DFE7 0A14 06CE F149 2413".replace(" ", ""))
# after = unhex("3915 C0D2 0058 4627 546D 5138 4758 2137 5655 4829 344E 212A 4E55 4811 358A 6656".replace(" ", ""))

# print([test(a,b) for (a, b) in zip(original, after)])

# at_0104 = unhex("C42A1337")
# at_174d = unhex("97E9B4F5")

# print([get_add(a,b) for (a, b) in zip(at_174d, at_0104)])

# a = unhex("C42A1337C42A1337")
# b = unhex("F55E4C7AF4782068")
# print(xor(a,b))

# a = unhex("A3CE4C40")
# b = unhex("E0FE0110")

# print(xor(a,b))

# a = unhex("871A5E67871A5E67")
# b = unhex("EB290638B62F3033")

# print(xor(a,b))


a = unhex("CDA7387F")
b = unhex("FB961418")

print(xor(a, b, b"XXXX"))
