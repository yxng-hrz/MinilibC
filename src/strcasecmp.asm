BITS    64
SECTION .text
GLOBAL  strcasecmp

strcasecmp:
    MOV R8B, byte[RDI]
    MOV R9B, byte[RSI]

START_INIT:
    CMP R8B, 97 ; if >= 97 ('a')
    JAE INIT_FIRST
    CMP R9B, 97 ; same
    JAE INIT_SECOND
    JMP COMPARE

INIT_FIRST:
    SUB R8B, 32
    JMP START_INIT

INIT_SECOND:
    SUB R9B, 32
    JMP START_INIT

COMPARE:
    CMP R8B, 0
    JE RETURN_VALUE ; Quit when \0
    CMP R9B, 0
    JE RETURN_VALUE
    CMP R8B, R9B
    JNE RETURN_VALUE
    INC RDI
    INC RSI
    JMP strcasecmp

RETURN_VALUE:
    SUB R8B, R9B ; Calcul diff
    MOVSX EAX, R8B ; Move with correct value
    RET
