BITS    64
SECTION .text
GLOBAL  strcmp

strcmp:
    MOV R8B, byte[RDI]
    CMP R8B, 0
    JE RETURN_VALUE ; Quit when \0
    CMP byte[RSI], 0
    JE RETURN_VALUE
    CMP R8B, byte[RSI]
    JNE RETURN_VALUE
    INC RDI
    INC RSI
    JMP strcmp

RETURN_VALUE:
    SUB R8B, byte[RSI] ; Calcul diff
    MOVSX EAX, R8B ; Move with correct value
    RET
