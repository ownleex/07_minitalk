# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/04 14:16:43 by ayarmaya          #+#    #+#              #
#    Updated: 2024/04/11 01:38:20 by ayarmaya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C				=	client
NAME_S				=	server
NAME_BONUS_C		=	client_bonus
NAME_BONUS_S		=	server_bonus

SRC_C				=	client.c
SRC_S				=	server.c
SRC_BONUS_C			=	client_bonus.c
SRC_BONUS_S			=	server_bonus.c

SRCS_C				=	$(addprefix $(PATH_SRC), $(SRC_C))
SRCS_S				=	$(addprefix $(PATH_SRC), $(SRC_S))
SRCS_BONUS_C		=	$(addprefix $(PATH_SRC), $(SRC_BONUS_C))
SRCS_BONUS_S		=	$(addprefix $(PATH_SRC), $(SRC_BONUS_S))

OBJS_C				=	$(SRCS_C:.c=.o)
OBJS_S				=	$(SRCS_S:.c=.o)
OBJS_BONUS_C		=	$(SRCS_BONUS_C:.c=.o)
OBJS_BONUS_S		=	$(SRCS_BONUS_S:.c=.o)

PATH_SRC			=	src/
CC					=	cc
CFLAGS				=	-Wall -Wextra -Werror
HEADERS				=	-I./include
PRINTF				=	ft_printf/libftprintf.a
RM					= 	rm -f

all:		$(NAME_C) $(NAME_S)

bonus:		$(NAME_BONUS_C) $(NAME_BONUS_S)

$(NAME_C): 	$(OBJS_C)
			@make -C ft_printf
			$(CC) $(CFLAGS) $(OBJS_C) -o $(NAME_C) $(HEADERS) $(PRINTF)

$(NAME_S): 	$(OBJS_S)
			$(CC) $(CFLAGS) $(OBJS_S) -o $(NAME_S) $(HEADERS) $(PRINTF)

$(NAME_BONUS_C): 	$(OBJS_BONUS_C)
			@make -C ft_printf
			$(CC) $(CFLAGS) $(OBJS_BONUS_C) -o $(NAME_BONUS_C) $(HEADERS) $(PRINTF)

$(NAME_BONUS_S): 	$(OBJS_BONUS_S)
			$(CC) $(CFLAGS) $(OBJS_BONUS_S) -o $(NAME_BONUS_S) $(HEADERS) $(PRINTF)

%.o: 		%.c
			$(CC) $(CFLAGS) $(HEADERS) -c $< -o $@

clean:
			@make clean -C ft_printf
			$(RM) $(OBJS_C)
			$(RM) $(OBJS_S)
			$(RM) $(OBJS_BONUS_C)
			$(RM) $(OBJS_BONUS_S)

fclean:		clean
			@make fclean -C ft_printf
			$(RM) $(NAME_C)
			$(RM) $(NAME_S)
			$(RM) $(NAME_BONUS_C)
			$(RM) $(NAME_BONUS_S)
			
re:			fclean all

.PHONY:		all bonus clean fclean re
