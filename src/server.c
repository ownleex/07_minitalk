/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/04 01:21:57 by ayarmaya          #+#    #+#             */
/*   Updated: 2024/04/12 03:57:06 by ayarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	ft_btoa(int sig)
{
	static int	bit;
	static int	c;

	if (sig == SIGUSR1)
		c |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_printf("%c", c);
		bit = 0;
		c = 0;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	(void)argv;
	if (argc != 1)
	{
		write(2, "ERROR\n", 6);
		return (1);
	}
	pid = getpid();
	ft_printf("PID : %d\n\n", pid);
	signal(SIGUSR1, ft_btoa);
	signal(SIGUSR2, ft_btoa);
	while (argc == 1)
		pause ();
	return (0);
}
