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

		test	rdi,	rdi								; update the flags
		je		.done									; begin_list == NULL

		mov		rax,	[rdi]							; rax = *begin_list
		test	rax,	rax								; update the flags
		je		.done									; *begin_list == NULL

		test	rsi,	rsi								; update the flags
		je		.done									; cmp == NULL

		push	rbx										; save rbx and pop at .done
		push	rbp										; save rbp and pop at .done
		push	r12										; save r12 and pop at .done
		push	rdi										; save begin_list
		mov		rbx,	rsi								; save cmp function in rbx
		mov		rdi,	[rdi]							; rdi = *begin_list
		call	ft_list_size							; get list_size
		mov		r11,	rax								; r11 = list_size
		jmp		.loop									; go to ".loop"

; 		; stack **begin_list -> rbx
; 		; rbx = cmp
; 		; r9 = *begin_list
; 		; used -> r10 = *begin_list.next
; 		; r11 = list_size

; ;---------------------------------------------------------------------
			.loop:
				pop		rcx
				mov		r9,		[rcx]						; r9 = *begin_list
				dec		r11									; until list_size != 0
				cmp		r11, 0								; update the flags
				push	rcx
				jg		.loop2_head_part					; go to ".loop2"
				jmp		.done

;---------------------------------------------------------------------
;							head part
;---------------------------------------------------------------------
				.loop2_head_part:
					mov		rdi,	qword [r9 + OFFSET_DATA]	; rdi = r9.data
					mov		r10,	qword [r9 + OFFSET_NEXT]	; r10 = r9.next
					mov		rsi,	qword [r10 + OFFSET_DATA]	; rsi = r10.data
					call	rbx									; call cmp
					cmp		rax, 0								; update the flags
					jg		.swap_head							; return value cmp > 0 go to swap
					jmp		.loop2_cor

;---------------------------------------------------------------------
				.swap_head:
					mov		[rcx],	r10							; change head
					mov		r8, [r10 + OFFSET_NEXT]				; tmp = a
					mov		[r10 + OFFSET_NEXT], r9				; a = b
					mov		[r9 + OFFSET_NEXT], r8				; b = tmp
					mov		r8, r9								; tmp = a
					mov		r9, r10								; a = b
					mov		r10, r8								; b = tmp
					mov		rcx, r9								; save the prev node after .next
					jmp		.next								; continue the list
				; before * -> r9 -> r10 -> ?
				; after * -> r10 -> r9 -> ?

;---------------------------------------------------------------------
;							core
;---------------------------------------------------------------------
				.loop2_cor:
					mov		rdi,	qword [r9 + OFFSET_DATA]	; rdi = r9.data
					mov		r10,	qword [r9 + OFFSET_NEXT]	; r10 = r9.next
					mov		rsi,	qword [r10 + OFFSET_DATA]	; rsi = r10.data
					call	rbx									; call cmp
					cmp		rax, 0								; update the flags
					jg		.swap								; return value cmp > 0 go to swap
					jmp		.next								; continue the list

;---------------------------------------------------------------------
				.swap:
					mov		qword [rcx + OFFSET_NEXT], r10		; prev node.next = node
					mov		r8, [r10 + OFFSET_NEXT]				; tmp = a
					mov		[r10 + OFFSET_NEXT], r9				; a = b
					mov		[r9 + OFFSET_NEXT], r8				; b = tmp
					mov		r8, r9								; tmp = a
					mov		r9, r10								; a = b
					mov		r10, r8								; b = tmp
					jmp		.next

;---------------------------------------------------------------------
				.next:
					mov		rcx, r9								; save the prev node after .next
					mov		r9,		qword [r9 + OFFSET_NEXT]	; r9 = r9.next
					cmp		qword [r9 + OFFSET_NEXT], 0			; update the flags
					je		.loop								; r9.next != NULL (loop)
					jmp		.loop2_cor								; go to ".loop2" until r9.next == NULL

;---------------------------------------------------------------------
			.done:
				pop	rdi										; rdi = save begin_list
				pop	r12										; r12 = save r12
				pop	rbp										; rbp = save rbp
				pop	rbx										; rdx = save rdx
				ret											; return
