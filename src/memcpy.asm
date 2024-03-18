BITS    64
SECTION .text
GLOBAL  memcpy

memcpy:
    MOV RAX, RDI    ; Set return to area
    XOR RCX, RCX   ; Set counter to 0 for n uses

SET:
    CMP RCX, RDX
    JB DEFINE_MEM    ; If i < n set and continue
    RET

DEFINE_MEM:
    MOV R8B, byte[RSI + RCX]
    MOV byte[RDI + RCX], R8B ; Put correct value in correct slot
    INC RCX
    JMP SET
