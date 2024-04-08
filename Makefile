# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/04 14:16:43 by ayarmaya          #+#    #+#              #
#    Updated: 2024/04/06 03:35:56 by ayarmaya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C		=	client
NAME_S		=	server

SRC_C		=	client.c
SRC_S		=	server.c

SRCS_C		=	$(addprefix $(PATH_SRC), $(SRC_C))
SRCS_S		=	$(addprefix $(PATH_SRC), $(SRC_S))

OBJS_C		=	$(SRCS_C:.c=.o)
OBJS_S		=	$(SRCS_S:.c=.o)

PATH_SRC	=	src/
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
HEADERS		=	-I./include
PRINTF		=	ft_printf/libftprintf.a
RM			= 	rm -f

all:		$(NAME_C) $(NAME_S)

$(NAME_C): 	$(OBJS_C)
			@make -C ft_printf
			$(CC) $(CFLAGS) $(OBJS_C) -o $(NAME_C) $(HEADERS) $(PRINTF)

$(NAME_S): 	$(OBJS_S)
			$(CC) $(CFLAGS) $(OBJS_S) -o $(NAME_S) $(HEADERS) $(PRINTF)

%.o: 		%.c
			$(CC) $(CFLAGS) $(HEADERS) -c $< -o $@

clean:
			@make clean -C ft_printf
			$(RM) $(OBJS_C)
			$(RM) $(OBJS_S)

fclean:		clean
			@make fclean -C ft_printf
			$(RM) $(NAME_C)
			$(RM) $(NAME_S)
			
re:			fclean all

.PHONY:		all clean fclean re
