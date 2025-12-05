; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void ft_list_push_front(t_list **begin_list, void *data);
;			   ft_list_push_front(rdi, rsi);


global ft_list_push_front
extern malloc;

section .text

	ft_list_push_front:
		mov		rdx, qword [rsi]					; value of the ptr
		mov		qword [rdi + OFFSET_NEXT], rdx		;
		mov		[rdi], rsi
		ret									; return rax(the node)

