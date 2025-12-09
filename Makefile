.PHONY: all clean fclean re    clear c fclear f test


###############################################
#               CONFIGURATION                 #
###############################################

NAME        := libasm.a
BINARY_NAME := program

CC          := cc
CFLAGS      := -Wall -Wextra -Werror -I ./inc

NASM        := nasm
NASMFLAGS   := -f elf64
DEBUGNASMFLAGS	= -g3 -F dwarf

SRC_DIR     := src
OBJ_DIR     := .obj

# $(SRC)
-include ./mk/source.mk


# Trouve tous les .s dans src/
ASM_SRC     := $(addprefix $(SRC_DIR)/, $(SRC))
OBJ         := $(ASM_SRC:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

MAIN        := main.c


###############################################
#                 RULES                       #
###############################################



all: $(NAME)


###############################################
#       COMPILATION DE LA LIB STATIQUE        #
###############################################


$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)
	@echo "✔ libasm.a créée"


###############################################
#        COMPILATION ASM → OBJ                #
###############################################


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $(DEBUGNASMFLAGS) $< -o $@


###############################################
#            COMPILATION DU TEST              #
###############################################

prog: re
	$(CC) $(CFLAGS) -g3 $(MAIN) $(NAME) -o $(BINARY_NAME)
	gdb -x ./error/gdb/gdbinit.txt program

test: all
	$(CC) $(CFLAGS) $(MAIN) $(NAME) -o $(BINARY_NAME)

	@if [ -z "$(ARG0)" ]; then \
		echo "❌ ARG est vide, veuillez fournir un argument."; \
		exit 42; \
	else \
		echo "-----------------------------------------------------------------------------";\
		echo "✔ exécutable créé et lancé avec : ./$(BINARY_NAME) [$(ARG0)] [$(ARG1)] [$(ARG2)] [$(ARG3)] [$(ARG4)] [$(ARG5)]"; \
		./$(BINARY_NAME) $(ARG0) $(ARG1) $(ARG2) $(ARG3) $(ARG4) $(ARG5); \
	fi

	@rm -rf $(OBJ_DIR)
	@rm $(BINARY_NAME)

vtest: all
	$(CC) $(CFLAGS) -g3 $(MAIN) $(NAME) -o $(BINARY_NAME)

	@if [ -z "$(ARG0)" ]; then \
		echo "❌ ARG est vide, veuillez fournir un argument."; \
		exit 42; \
	else \
		echo "-----------------------------------------------------------------------------";\
		echo "✔ exécutable créé et lancé avec : ./$(BINARY_NAME) [$(ARG0)] [$(ARG1)] [$(ARG2)] [$(ARG3)] [$(ARG4)] [$(ARG5)]"; \
		valgrind --leak-check=full --show-leak-kinds=all --show-mismatched-frees=yes --track-fds=yes --trace-children=yes ./$(BINARY_NAME) $(ARG0) $(ARG1) $(ARG2) $(ARG3) $(ARG4) $(ARG5); \
	fi

	@rm -rf $(OBJ_DIR)
	@rm $(BINARY_NAME)

###############################################
#                CLEANING                     #
###############################################


clean:
	rm -rf $(OBJ_DIR)
	@echo "✔ objets supprimés"


fclean: clean
	rm -f $(NAME) $(BINARY_NAME)
	@echo "✔ tout nettoyé"


c					:	clean
clear				:	clean


f					:	fclean
fclear				:	fclean


re: fclean all
