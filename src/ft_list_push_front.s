; typedef struct s_list
; {
; 	void		*data;		//8
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
			push	rdi										; save 1st-arg
			push	rsi										; save 2st-arg
			mov		rdi, 16									; rdi = rax (len + 1)
			call	malloc	wrt ..plt						; malloc (rdi(len + 1))
			pop		rsi										; take the save of the 2nd-arg
			mov		qword [rax + OFFSET_DATA], rsi			; use 4 octet = data and data = value(edi(4 octet(int)))
			mov		qword [rax + OFFSET_NEXT], 0			; at octet 8 use 8 octet = next and next take NULL
			jmp		.push_front								; return rax(the node)

		.push_front:
			pop		rdi									; take the save of the 1st-arg
			mov		rdx, qword [rdi]					; void *ptr = *begin_list
			mov		qword [rax + OFFSET_NEXT], rdx		; rsi.next = rdi
			mov		[rdi], rax							; *rdi = data
			ret											; return rax(the node)




	; ft_list_push_front:
	; 	mov		rdx, qword [rdi]					; void *ptr = *begin_list
	; 	mov		qword [rsi + OFFSET_NEXT], rdx		; rsi.next = rdi
	; 	mov		[rdi], rsi							; *rdi = data
	; 	ret											; return rax(the node)

