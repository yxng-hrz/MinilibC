BITS    64
SECTION .text
GLOBAL  strchr
GLOBAL  index

index:
strchr:
    CMP byte[RDI], SIL
    JE RETURN_RESULT
    CMP byte[RDI], 0
    JE RETURN_NOT_FOUND
    INC RDI
    JMP strchr

RETURN_RESULT:
    MOV RAX, RDI
    RET

RETURN_NOT_FOUND:
    XOR RAX, RAX
    RET
