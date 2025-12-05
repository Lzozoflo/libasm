; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list


; extern void *ft_list_size(t_list *ptr);
;			   ft_list_size(rdi);

section .rodata
	PI_value: dq 3.1415926535

global ft_list_size
extern malloc;

section .text

	ft_list_size:
		xor		rax,rax						; rax = 0






		ret									; return rax(the node)

