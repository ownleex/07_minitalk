/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printptr.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ayarmaya <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/04 19:13:43 by ayarmaya          #+#    #+#             */
/*   Updated: 2023/12/19 14:07:36 by ayarmaya         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_printptr(void *ptr)
{
	unsigned long long	addr;
	int					ret;

	ret = 0;
	addr = (unsigned long long)ptr;
	if (addr == 0)
		ret += ft_printstr("(nil)");
	else
	{
		ret += ft_printstr("0x");
		ret += ft_printhex(addr, 'x');
	}
	return (ret);
}
