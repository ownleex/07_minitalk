/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/10 21:59:48 by ayarmaya          #+#    #+#             */
/*   Updated: 2024/04/10 23:27:48 by ayarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"
#include <cstddef>

static void print_character(int sig, siginfo_t *info, void *context)
{
    static int  bit = 0;
    static char character = 0;

    (void)context;
    if (sig == SIGUSR1)
        character |= (1 << bit);
    bit++;
    if (bit == 8)
    {
        ft_printf("%c", character);
        bit = 0;
        character = 0;
        kill(info->si_pid, SIGUSR2); // Envoyer la confirmation au client
    }
}

int main(void)
{
    struct sigaction sa;

    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = print_character;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGUSR1, &sa, NULL);
    sigaction(SIGUSR2, &sa, NULL);

    ft_printf("PID du serveur: %d\n", getpid());
    while (1)
        pause();
    return (0);
}
