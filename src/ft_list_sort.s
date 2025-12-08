; typedef struct s_list
; {
; 	void		*data;		// 8
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void ft_list_sort(t_list **begin_list, int (*cmp)())

;			   ft_list_sort(rdi, rsi);
;													(*cmp)(list_ptr->data, list_other_ptr->data);


global ft_list_sort
extern ft_list_size;
section .text

	ft_list_sort:

	; Vérification arguments
		test	rsi,	rsi								; update the flags
		je		.done									; cmp == NULL
		test	rdi,	rdi								; update the flags
		je		.done									; begin_list == NULL
		mov		rax,	[rdi]							; rax = *begin_list
		test	rax,	rax								; update the flags
		je		.done									; *begin_list == NULL

	; Sauvegarde des registres callee-saved
		push	r15										; save r15 and pop at .done 	used as: fonction ptr
		mov		r15,	rsi								; save cmp ptr fonction
		push	r14										; save r14 and pop at .done 	used as: t_list **prev
		push	r13										; save r13 and pop at .done 	used as: int     size
		push	rdi										; save begin_list
		mov		rdi,	rax								; take size
		call	ft_list_size							; get list_size
		mov		r13,	rax								; take size
		jmp		.loop									; go to ".loop"

		;  r15 used as: used as: fonction ptr
		;  r14 used as: used as: t_list **prev
		;  r13 used as: used as: int     size

;---------------------------------------------------------------------
			.loop:
				pop		rdi
				push	rdi
				mov		rdi,	[rdi]						; rdi = *begin_list
				xor		r14,	r14							; "t_list **" -> "t_list *"
				dec		r13
				test	r13, r13
				je		.done

;---------------------------------------------------------------------
				.loop2:
					mov		r9,		rdi
					mov		r10,	[rdi + OFFSET_NEXT]
					test	r10,	r10							; update the flags
					je		.loop								; if ->next == NULL next loop
					mov		rdi,	qword [r9 + OFFSET_DATA]	; rdi = r9.data
					mov		rsi,	qword [r10 + OFFSET_DATA]	; r10 = r9.next
					call	r15									; call cmp
					cmp		rax, 0								; update the flags
					jg		.swap								; return value cmp <= 0 go to cor
					test	r14, r14							; update the flags
					jne		.next								; si r14 != NULL go to ".next"
					pop		r14
					push	r14
					jmp		.next								; go to ".next"

;---------------------------------------------------------------------
				.head_swap:										; take the head on r14
					pop		r14
					push	r14

;---------------------------------------------------------------------
				.swap:
					test	r14, r14							; update the flags
					je		.head_swap							; si r14 != NULL go to ".head_swap"
					mov		[r14],	r10							; it was the addr of the ptr next (&(node.next))
					mov		rdi,	qword [r10 + OFFSET_NEXT]	; tmp = node.next
					mov		qword [r10 + OFFSET_NEXT],	r9		; node.next = othernode
					mov		qword [r9 + OFFSET_NEXT],	rdi		; othernode.next = tmp

;---------------------------------------------------------------------
				.next:
					mov		rdi,	[r14]
					lea		r14,	[rdi + OFFSET_NEXT]
					mov		rdi,	[rdi + OFFSET_NEXT]
					jmp		.loop2

;---------------------------------------------------------------------
			.done:
				pop		rdi				; callee-saved
				pop		r13				; callee-saved
				pop		r14				; callee-saved
				pop		r15				; callee-saved
				ret											; return
