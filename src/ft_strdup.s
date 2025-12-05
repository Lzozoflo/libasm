
; extern char *ft_strdup(const char *str);
;			   ft_strdup(rdi);

global ft_strdup
extern ft_strlen;
extern ft_strcpy;
extern malloc;

section .text

	ft_strdup:

		mov		rsi, rdi					; ptr from malloc in the 1st-arg for ft_strcpy
		; push	rdi							; save 1st-arg
		call	ft_strlen					; mets rax a len de str
		inc		rax							; len + 1 ('\0')
		mov		rdi, rax					; rdi = rax (len + 1)
		call	malloc	wrt ..plt			; malloc (rdi(len + 1))
		; pop		rsi							; take the save of the 1st-arg
		mov		rdi, rax					; ptr from malloc in the 1st-arg for ft_strcpy
		call	ft_strcpy					; ft_strcpy(rdi(ptr-malloc), rsi(1st-arg strdup))
		ret									; return rax(dest)

