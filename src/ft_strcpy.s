

; extern char *ft_strcpy(const char *s1, const char *s2);

section .text
	global ft_strcpy

		ft_strcpy:
			jmp .loop						; je vais dans la loop (.loop)

			.loop:
				mov		[rdi], [rsi]		; cpy le char de src dans dest
				test	[rsi], [rsi]		; mets a jour les flag
				je		.done				; si == '\0' finish return 0
				inc		rdi					; rdi++
				inc		rsi					; rsi++
				jmp		.loop				; go to loop
;---------------------------------------------------------------------
			.done:
				mov rax, rdi				; rax = dest
				ret							; return 0
