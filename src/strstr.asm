BITS    64
SECTION .text
GLOBAL  strstr

strstr:
    MOV R9, RDI
    MOV R10, RSI

TRY:
    CMP byte[R10], 0
    JE FOUND
    CMP byte[R9], 0
    JE NOT_FOUND
    MOV R8B, byte[R10]
    CMP byte[R9], R8B
    JNE RESTART
    INC R9
    INC R10
    JMP TRY

RESTART:
    INC RDI
    JMP strstr

FOUND:
    MOV RAX, RDI
    RET

NOT_FOUND:
    XOR RAX, RAX
    RET
