
; extern char *ft_strcpy(const char *dest, const char *src);

; extern char *ft_strcpy(rdi, rsi);

global ft_strcpy
section .text

	ft_strcpy:
		xor		rax, rax
		jmp		.loop					; go to ".loop"
;---------------------------------------------------------------------
		.loop:
			mov		r8b, [rsi + rax]	; recup le char a src[i]
			mov		[rdi + rax], r8b	; cpy le char de src[i] dans dest
			test	r8b, r8b			; mets a jour les flag
			je		.done				; si == '\0' go to ".done"
			inc		rax					; rax++
			jmp		.loop				; go to ".loop"
;---------------------------------------------------------------------
		.done:
			mov rax, rdi				; rax = dest
			ret							; return rax(dest)
