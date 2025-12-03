

global ft_strlen
section .text

		ft_strlen:
			xor		rax,	rax					; int i = 0
			test	rdi,	rdi					; str == NULL
			je		.done						; si avant je return (.done)
			jmp		.loop						; je vais dans la loop (.loop)
;---------------------------------------------------------------------
			.loop:
				cmp		byte	[rdi + rax], 0	;  cmp [rdi + rax], '\0' mets a jour les flag
				je		.done					; si [rdi + rax] == '\0'
				inc		rax						; rax++
				jmp		.loop					; go to
;---------------------------------------------------------------------
			.done:
				ret

