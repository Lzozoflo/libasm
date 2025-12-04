
; extern char *ft_strdup(const char *str);
;			   ft_strdup(rdi);
global ft_strdup
extern ft_strlen;
extern ft_strcpy;
extern malloc;

section .text

		ft_strdup:
			call ft_strlen					; mets rax a len de str
			inc rax							; len + 1 ('\0')
			mov rsi, rdi					; rsi = str(1st-arg of strdup)
			mov rdi, rax					; rdi = rax (len + 1)
			call malloc						; malloc (rdi(len + 1))
			mov rdi, rax					; ptr from malloc in the 1st-arg for ft_strcpy
			call ft_strcpy					; ft_strcpy(rdi(ptr-malloc), rsi(1st-arg str_dup))
			mov rax, rdi					; rax = dest
			ret								; return rax(dest)
