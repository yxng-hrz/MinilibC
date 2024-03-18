##
## EPITECH PROJECT, 2024
## B-ASM-400-PAR-4-1-asmminilibc-guillaume.houriez
## File description:
## Makefile
##

SRC	=	src/strlen.asm	\
		src/strchr.asm	\
		src/strrchr.asm	\
		src/memset.asm	\
		src/memcpy.asm	\
		src/strcmp.asm	\
		src/memmove.asm	\
		src/strncmp.asm	\
		src/strcasecmp.asm	\
		src/strstr.asm	\
		src/strpbrk.asm	\
		src/strcspn.asm	\

NAME	=	libasm.so

OBJS	=	$(SRC:.asm=.o)

ASMFLAGS	=	-f elf64

LDFLAGS	=	-shared	\
			-fPIC

%.o : %.asm
	nasm $(ASMFLAGS) $<

all:	$(NAME)

$(NAME):	$(OBJS)
	ld $(LDFLAGS) -o $(NAME) $(OBJS)

clean:
	rm -f $(OBJS)

fclean:	clean
	rm -f $(NAME)
	rm -f $(TESTNAME)
	find -name "*.gcda" -delete -o -name "*.gcno" -delete

re:	fclean $(NAME)

.PHONY:	all clean fclean re
