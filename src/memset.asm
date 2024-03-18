BITS    64
SECTION .text
GLOBAL  memset

memset:
    MOV RAX, RDI    ; Set return to area
    XOR RCX, RCX   ; Set counter to 0 for n uses

SET:
    CMP RCX, RDX
    JB DEFINE_MEM    ; If i < n set and continue
    RET

DEFINE_MEM:
    MOV byte[RDI + RCX], SIL
    INC RCX
    JMP SET
