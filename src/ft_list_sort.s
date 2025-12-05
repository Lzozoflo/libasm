; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8

; extern void ft_list_sort(t_list **begin_list, int (*cmp)())

;			   ft_list_sort(rdi, rsi);
;													(*cmp)(list_ptr->data, list_other_ptr->data);


global ft_list_sort
extern malloc;

section .text

	ft_list_sort:
			ret											; return

