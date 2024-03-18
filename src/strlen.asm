BITS    64
SECTION .text
GLOBAL  strlen

strlen:
    XOR RAX, RAX

COUNT:
    CMP byte[RDI + RAX], 0
    JNE INCREMENT
    RET

INCREMENT:
    INC RAX
    JMP COUNT