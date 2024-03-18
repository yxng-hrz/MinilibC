BITS    64
SECTION .text
GLOBAL  strcspn

; RDI, RSI

strcspn:
    XOR RAX, RAX

PRECOMP:
    MOV R9, RSI

TRY:
    MOV R8B, byte[R9]
    CMP R8B, 0
    JE NEXT
    CMP byte[RDI], R8B
    JE RETO
    INC R9
    JMP TRY

RETO:
    RET

NEXT:
    INC RAX
    INC RDI
    CMP byte[RDI], 0
    JE RETO
    JMP PRECOMP
