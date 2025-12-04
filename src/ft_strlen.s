

global ft_strlen
section .text

	ft_strlen:
		xor		rax,	rax					; int i = 0  ; mov rax, 0
		; test	rdi,	rdi					; str == NULL
		; je		.done						; si avant je return (.done)
		jmp		.loop						; je vais dans la loop (.loop)
;---------------------------------------------------------------------
		.loop:
			test		byte	[rdi + rax], 0	; mets a jour les flags
			je		.done					; si [rdi + rax] == '\0'
			inc		rax						; rax++
			jmp		.loop					; go to
;---------------------------------------------------------------------
		.done:
			ret

