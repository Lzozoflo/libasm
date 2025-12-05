; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8



; extern void *ft_list_size(t_list *ptr);
;			   ft_list_size(rdi);


global ft_list_size
extern malloc;

section .text

	ft_list_size:
		xor		rax,rax						; rax = 0






		ret									; return rax(the node)

