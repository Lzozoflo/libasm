
; extern char *ft_strcpy(const char *s1, const char *s2);

section .text
	global ft_strcpy

		ft_strcpy:
			xor		rax, rax
			jmp		.loop					; je vais dans la loop (.loop)

			.loop:
				mov		bl, [rsi + rax]		; recupere le char dans src
				test	bl, bl				; mets a jour les flag
				je		.done				; si == '\0' finish return 0
				mov		[rdi + rax], bl		; cpy le char de src dans dest
				inc		rax					; rax++
				jmp		.loop				; go to loop
;---------------------------------------------------------------------
			.done:
				mov rax, rdi				; rax = dest
				ret							; return rax(dest)
