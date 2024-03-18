BITS    64
SECTION .text
GLOBAL  memmove

; RDI, RSI, RDX

memmove:
    MOV RAX, RDI    ; Set return to area
    XOR RCX, RCX   ; Set counter to 0 for n uses
    CMP RDI, RSI    ; RDI < RSI
    JAE REVERSE_SET

SET:
    CMP RCX, RDX
    JB DEFINE_MEM    ; If i < n set and continue
    RET

DEFINE_MEM:
    MOV R8B, byte[RSI + RCX]
    MOV byte[RDI + RCX], R8B ; Put correct value in correct slot
    INC RCX
    JMP SET

USE_QUIT:
    RET

REVERSE_SET:
    CMP RDX, 0  ; if i == 0
    JE USE_QUIT
    DEC RDX

REVERSE_DEFINE_MEM:
    MOV R8B, byte[RSI + RDX]
    MOV byte[RDI + RDX], R8B ; Put correct value in correct slot
    JMP REVERSE_SET
