

section .text
	global ft_strlen

		ft_strlen:
			xor     rax,    rax					; int i = 0
			; test	rdi,	rdi					; str == NULL
			; je		.done						; si avant je return (.done)
			jmp     .loop						; je vais dans la loop (.loop)


			.loop:
				cmp     byte    [rdi + rax], 0
				je      .done
				inc     rax
				jmp     .loop

			.done:
				ret

