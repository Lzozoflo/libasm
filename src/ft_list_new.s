; typedef struct s_list
; {
; 	int		data;			// 4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8


; extern void *ft_list_new(int value);
;			   ft_list_new(edi);

global ft_list_new
extern malloc;

section .text

	ft_list_new:
		push	rdi										; save 1st-arg
		mov		rdi, 16									; rdi = rax (len + 1)
		call	malloc	wrt ..plt						; malloc (rdi(len + 1))
		pop		rdi										; take the save of the 1st-arg
		mov		dword [rax + OFFSET_DATA], edi			; use 4 octet = data and data = value(edi(4 octet(int)))
		mov		qword [rax + OFFSET_NEXT], 0			; at octet 8 use 8 octet = next and next take 0
		ret												; return rax(the node)

