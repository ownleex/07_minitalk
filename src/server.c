/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/04 01:21:57 by ayarmaya          #+#    #+#             */
/*   Updated: 2024/04/06 00:07:45 by ayarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

t_signal_data	g_signal = {0, 0};

void	ft_btoa(int sig)
{
	if (sig == SIGUSR1)
		g_signal.character |= (0x01 << g_signal.bit);
	g_signal.bit++;
	if (g_signal.bit == 8)
	{
		ft_printf("%c", g_signal.character);
		g_signal.bit = 0;
		g_signal.character = 0;
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
	ft_printf("PID : %d\n", pid);
	while (argc == 1)
	{
		signal(SIGUSR1, ft_btoa);
		signal(SIGUSR2, ft_btoa);
		pause ();
	}
	return (0);
}
