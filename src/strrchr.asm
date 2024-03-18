BITS    64
SECTION .text
GLOBAL  strrchr
GLOBAL  rindex

rindex:
strrchr:
    XOR RAX, RAX    ; Set default to nullptr

COMPARE:
    CMP byte[RDI], SIL
    JE SET_FOUND    ; Define lastest found index
    CMP byte[RDI], 0
    JE RETURN_RESULT ; End of string, return index
    INC RDI
    JMP COMPARE

SET_FOUND:
    CMP byte[RDI], 0
    JE FOUND_LEAVE
    MOV RAX, RDI
    INC RDI
    JMP COMPARE

FOUND_LEAVE:
    MOV RAX, RDI
    RET

RETURN_RESULT:
    RET
