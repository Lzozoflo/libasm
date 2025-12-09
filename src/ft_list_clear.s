; typedef struct s_list
; {
; 	void		*data;		//8
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void  ft_list_clear(t_list *begin_list);
;			   ft_list_clear(rdi, rsi, rdx, rcx);

;																		  (*cmp)(list_ptr->data, data_ref)
;																						 (*free_fct)(list_ptr->data);


global ft_list_clear

extern free;

section .text

	ft_list_clear:
	; Vérification arguments
		test	rdi,	rdi
		je		.done									; begin_list == NULL

	; Sauvegarde des registres callee-saved
		push	r15										; save r15 and pop at .done

		mov		r15, rdi

;---------------------------------------------------------------------
		.content;
			mov		rdi,	[r15 + OFFSET_DATA]
			test	rdi,	rdi
			je		.node
			call	free

;---------------------------------------------------------------------
		.node;
			mov		rdi, r15
			mov		r15, [r15 + OFFSET_NEXT]
			call	free
			test	r15, r15
			je		.done
			jmp		.content

;---------------------------------------------------------------------
		.done:
			pop		r15									; callee-saved
			ret											; return

