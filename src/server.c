/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ayarmaya <ayarmaya@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/04 01:21:57 by ayarmaya          #+#    #+#             */
/*   Updated: 2024/04/12 21:40:28 by ayarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <unistd.h>
#include <stdio.h> // Pour printf, en remplacement de ft_printf si non disponible

#define BUFFER_SIZE 10000

static void	ft_btoa(int sig)
{
    static int	bit = 0;
    static int	c = 0;
    static char buffer[BUFFER_SIZE];
    static int	index = 0;

    if (sig == SIGUSR1)
        c |= (0x01 << bit);
    bit++;
    if (bit == 8)
    {
        buffer[index++] = c;
        if (c == '\0')  // Vérifie si le caractère reçu est '\0'
        {
            write(1, buffer, index - 1); // Affiche le buffer jusqu'au '\0' exclus
            index = 0;  // Réinitialise l'index pour un nouveau message
        }
        else if (index == BUFFER_SIZE)  // Cas de buffer plein sans rencontrer '\0'
        {
            write(1, buffer, BUFFER_SIZE);
            index = 0;
        }
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
    printf("PID : %d\n\n", pid);
    signal(SIGUSR1, ft_btoa);
    signal(SIGUSR2, ft_btoa);
    while (1)
        pause();
    return (0);
}
