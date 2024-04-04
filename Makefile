# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/04 14:16:43 by ayarmaya          #+#    #+#              #
#    Updated: 2024/04/04 19:05:36 by ayarmaya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C = client
NAME_S = server

SRC_C = client.c
SRC_S = server.c

PATH_SRC	=	src/
SRCS_C		=	$(addprefix $(PATH_SRC), $(SRC_C))
SRCS_S		=	$(addprefix $(PATH_SRC), $(SRC_S))
OBJS_C		=	$(SRCS_C:.c=.o)
OBJS_S		=	$(SRCS_S:.c=.o)
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
HEADERS		=	-I./include
RM			= 	rm -f

all:		$(NAME_C) $(NAME_S)

$(NAME_C): 	$(OBJS_C)
			$(CC) $(CFLAGS) $(OBJS_C) -o $(NAME_C) $(HEADERS)

$(NAME_S): 	$(OBJS_S)
			$(CC) $(CFLAGS) $(OBJS_S) -o $(NAME_S) $(HEADERS)

%.o: 		%.c
			$(CC) $(CFLAGS) $(HEADERS) -c $< -o $@

clean:
			$(RM) $(OBJS_C)
			$(RM) $(OBJS_S)

fclean:		clean
			$(RM) $(NAME_C)
			$(RM) $(NAME_S)
			
re:			fclean all

.PHONY:		all clean fclean re
