# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdussert <jdussert@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/19 10:55:37 by jdussert          #+#    #+#              #
#    Updated: 2020/08/19 13:56:39 by jdussert         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_read
	section .text
extern __errno_location
ft_read : ;ssize_t ft_read(int fd, void *buf, size_t count);
	mov rax, 0
	syscall
	cmp rax, 0
	jl ft_error
	ret
ft_error :
	mov r8, rax
	call __errno_location
	neg r8
	mov [rax], r8
	mov rax, -1
	ret
