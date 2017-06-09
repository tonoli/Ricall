
RICALL	=	ricall
CC	=	gcc
CFLAGS	=	-Wall -Wextra
RM	=	rm -f
MKDIR	=	mkdir -p
LIBS	=	-L/usr/local/lib -lportaudio
HEAD	=	./include
MODEL 	=	-DMODELDIR=\"`pkg-config --variable=modeldir pocketsphinx`\" 
S_INC	=	-I/usr/local/include -I/usr/local/include/sphinxbase  -I/usr/local/include/pocketsphinx  
S_LIB	=	-L/usr/local/lib -lpocketsphinx -lsphinxbase -lsphinxad -lportaudio
SRCS    = 	paex_record.c

OBJS	=	$(SRCS:.c=.o)
VPATH	=	src/:

all:	$(RICALL)

# Executables
$(RICALL): $(OBJS)
	$(CC) -o $@ $^ $(SPINX) $(S_INC) $(S_LIB)
	echo "Compiling [$@]"

# Object files
$(OBJS): $(SRCS)
	$(CC) -c $^ $(SPHINX) $(MODEL) $(S_INC) 
	echo "Creating object files"

# Cleaning rules
clean:
	rm -f $(OBJS)
	echo "Cleaning [$(OBJS)]"

fclean:
	rm -f $(OBJS)
	rm -rf $(RICALL)
	echo "Cleaning ricall"

re: fclean all
.PHONY: clean fclean re libft all
