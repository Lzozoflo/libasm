; typedef struct s_list
; {
; 	void		*data;		//8
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void  ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
;			   ft_list_remove_if(rdi, rsi, rdx, rcx);
;																		  (*cmp)(list_ptr->data, list_other_ptr->data);

;																						 (*free_fct)(list_ptr->data);


global ft_list_remove_if
extern malloc;

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
		test	rcs,	rcs
		je		.done									; free_fct == NULL

	; Sauvegarde des registres callee-saved
		push	r15										; save r15 and pop at .done
		push	r14										; save r14 and pop at .done
		push	r13										; save r13 and pop at .done
		push	r12										; save r12 and pop at .done

		mov		r15,	rcx								; save free_fct ptr fonction
		mov		r14,	rdx								; save cmp ptr fonction




		.done:
			pop		r12				; callee-saved
			pop		r13				; callee-saved
			pop		r14				; callee-saved
			pop		r15				; callee-saved
			ret											; return

