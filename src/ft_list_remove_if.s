; typedef struct s_list
; {
; 	void		*data;		//8
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void  ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
;			   ft_list_remove_if(rdi, rsi, rdx, rcx);

;																		  (*cmp)(list_ptr->data, data_ref)
;																						 (*free_fct)(list_ptr->data);


global ft_list_remove_if
extern free;

section .text

	ft_list_remove_if:
	; Vérification arguments
		test	rdi,	rdi
		je		.done									; begin_list == NULL
		mov		rax,	[rdi]							; rax = *begin_list
		test	rax,	rax
		je		.done									; *begin_list == NULL
		test	rsi,	rsi
		je		.done									; data_ref == NULL
		test	rdx,	rdx
		je		.done									; cmp == NULL
		test	rcx,	rcx
		je		.done									; free_fct == NULL

	; Sauvegarde des registres callee-saved
		push	r15										; save r15 and pop at .done
		push	r14										; save r14 and pop at .done
		push	r13										; save r13 and pop at .done
		push	r12										; save r12 and pop at .done

		mov		r15,	rcx								; save free_fct ptr fonction
		mov		r14,	rdx								; save cmp ptr fonction
		push	rsi										; save void *data_ref
		mov		r13,	rdi
		mov		rdx,	[r13]

;---------------------------------------------------------------------
		.checkhead:
			; cmp
			mov		rdi,	[rdx + OFFSET_DATA]			; rdi = prev.data
			pop		rsi									; rsi = data_ref
			push	rsi
			call	r14									; call cmp(list_ptr->data, data_ref)
			test	rax,	rax
			jne		.nexthead							; rax != 0 go to ".nexthead" to loop

			; free
			mov		rdx,	[r13]						; rdx = node
			mov		rdi,	[rdx + OFFSET_DATA]			; rdi = node.data
			call	r15									; call free_fct(node.data)

			mov		rdi,	[r13]						; rdx = node
			mov		rdx,	[rdi + OFFSET_NEXT]			; rdi = node.next
			mov		[r13],	rdx							; r13 = node.next

			call	free								; call free()
			mov		rdx,	[r13]						; rdx = nodehead
			jmp		.checkhead

;---------------------------------------------------------------------
		.loop:
			mov		rdi,	[rdx + OFFSET_DATA]			; rdi = prev.data
			pop		rsi									; rsi = data_ref
			push	rsi
			call	r14									; call cmp(list_ptr->data, data_ref)
			test	rax,	rax
			jne		.next								; si rax != 0 go to ".next"

;---------------------------------------------------------------------
		.remove:
			mov		r12,	[r13 + OFFSET_NEXT]			; r12 = node to delete
			mov		rdi,	[r12 + OFFSET_DATA]			; content of the node
			call	r15									; call free_fct(rdx.data)

			mov		rdi,	r12							; rdi = node to delete
			mov		r12,	[r12 + OFFSET_NEXT]			; r13 = node to delete .next
			mov		[r13 + OFFSET_NEXT],	r12			; r13 = rdx.next
			call	free								; call free(rdx)
			test	r12,	r12
			je		.done
			mov		rdx,	[r13 + OFFSET_NEXT]
			jmp		.loop


;---------------------------------------------------------------------
		.nexthead:
			mov		r13,	[r13]
			mov		rdx,	[r13 + OFFSET_NEXT]
			test	rdx,	rdx
			je		.done								; r13.next == NULL go to ".done"
			jmp		.loop

;---------------------------------------------------------------------
		.next:
			mov		r13,	[r13 + OFFSET_NEXT]
			test	r13,	r13
			je		.done								; r13.next == NULL go to ".done"
			mov		rdx,	[r13 + OFFSET_NEXT]			; rdx = node
			jmp		.loop

;---------------------------------------------------------------------
		.done:
			pop		rsi				; clear
			pop		r12				; callee-saved
			pop		r13				; callee-saved
			pop		r14				; callee-saved
			pop		r15				; callee-saved
			ret											; return

