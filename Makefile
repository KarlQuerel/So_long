NAME	= so_long

PATH_LIBFT	= libft
LIBFT	= ${PATH_LIBFT}/libft.a

PATH_MLX = minilbx
MLX = ${PATH_MLX}/libmlx.a

L_FLAGS	= -lX11 -lXext -lm

PATH_SRCS	= srcs
SRCS	= ${PATH_SRCS}/so_long.c	\
		${PATH_SRCS}/maps.c	\
		${PATH_SRCS}/check_errors.c \
		${PATH_SRCS}/movement.c \
		
OBJS	= ${SRCS:.c=.o}

CC	= cc

C_FLAGS	= -Wall -Werror -Wextra -g

RM	= rm -f

all: ${LIBFT} ${MLX} ${NAME}

${NAME}: ${OBJS}
		${CC} ${C_FLAGS} -o ${NAME} ${OBJS} ${LIBFT} ${MLX} ${L_FLAGS}
		clear
		@toilet COMPILED -F border -f future

${LIBFT}:
		make -C ${PATH_LIBFT}
		clear
		@toilet LIBFT -F border -f future

${MLX}:
		make -C ${PATH_MLX}
		clear
		@toilet MLX -F border -f future

.c.o:
	${CC} ${C_FLAGS} -c $< -o ${<:.c=.o} -I ${PATH_LIBFT} -I ${PATH_SRCS}

clean:
		make -C ${PATH_LIBFT} clean
		make -C ${PATH_MLX} clean
		${RM} ${OBJS}
		clear
		@toilet CLEAN -F border -f future

fclean:	clean
		make -C ${PATH_LIBFT} fclean
		${RM} ${NAME}
		clear
		@toilet FCLEAN -F border -f future

re:	fclean all

.PHONY:	all clean fclean re
