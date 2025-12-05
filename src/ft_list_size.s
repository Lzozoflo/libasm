; typedef struct s_list
; {
; 	int		data;			//4
; 	struct s_list *next;	// 8
; } t_list


; extern void *ft_list_size(t_list *ptr);
;			   ft_list_size(rdi);

global ft_list_size
extern malloc;

section .text

	ft_list_size:
		push	rdi							; save 1st-arg
		mov		rdi, 16						; rdi = rax (len + 1)
		call	malloc	wrt ..plt			; malloc (rdi(len + 1))
		pop		rdi							; take the save of the 1st-arg
		mov		dword [rax], edi			; use 4 octet = data and data = value(edi(4 octet(int)))
		mov		qword [rax + 8], 0			; at octet 8 use 8 octet = next and next take 0
		ret									; return rax(the node)

