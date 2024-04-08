# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/04 14:58:05 by ayarmaya          #+#    #+#              #
#    Updated: 2024/04/06 03:35:51 by ayarmaya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libftprintf.a

SRC		=	ft_printf \
			ft_printhex \
			ft_printint \
			ft_printptr \
			ft_printstr \
			ft_printuint \

SRCS		=	$(addsuffix .c, ${SRC})

OBJS		=	${SRCS:.c=.o}

CC		=	cc

CFLAGS		=	-Wall -Wextra -Werror

RM		=	rm -f

AR		=	ar crs

all:		${NAME}

${NAME}: 	${OBJS}
			${AR} ${NAME} ${OBJS}

clean:
			${RM} ${OBJS}

fclean:		clean
			${RM} ${NAME}

re:		fclean all

.PHONY:	all clean fclean re
