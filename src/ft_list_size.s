; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list
%define OFFSET_DATA		0		; int data		start at offset 0
%define OFFSET_NEXT		8		; t_list *next	start at offset 8



; extern int ft_list_size(t_list *begin_list);
;			 ft_list_size(rdi);


global ft_list_size
extern malloc;

section .text

	ft_list_size:
		xor		rax,rax								; rax = 0
		jmp		.loop								; go to ".loop"
;---------------------------------------------------------------------
		.loop;
			test	rdi, rdi						; mets a jours les flags
			je		.done							; si rdi == NULL go to ".done"
			mov		rdi, qword [rdi + OFFSET_NEXT]	; rdi = rdi.next
			inc		rax								;
			jmp		.loop							; go to ".loop"
;---------------------------------------------------------------------
		.done:
			ret										; return rax(


