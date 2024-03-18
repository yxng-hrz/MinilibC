BITS    64
SECTION .text
GLOBAL  strpbrk

; RSI, RDI

strpbrk:
    MOV R9, RSI

TRY_FIND:
    CMP byte[R9], 0
    JE INCR_FIND
    MOV R8B, byte[RDI]
    CMP R8B, byte[R9]
    JE FOUNDC
    INC R9
    JMP TRY_FIND

FOUNDC:
    MOV RAX, RDI
    RET

INCR_FIND:
    INC RDI
    CMP byte[RDI], 0
    JE NOFIND
    JMP strpbrk

NOFIND:
    XOR RAX, RAX
    RET
