; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void  ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
;			   ft_list_remove_if(rdi, rsi);
;																		  (*cmp)(list_ptr->data, list_other_ptr->data);

;																						 (*free_fct)(list_ptr->data);


global ft_list_remove_if
extern malloc;

section .text

	ft_list_remove_if:
			ret											; return

