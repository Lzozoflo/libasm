

global ft_strlen
section .text

	ft_strlen:
		xor		rax,	rax					; int i = 0 (mov rax, 0)
		; test	rdi,	rdi					; mets a jour les flags
		; je		.done						; si rdi == NULL go to ".done"
		jmp		.loop						; go to ".loop"
;---------------------------------------------------------------------
		.loop:
			cmp		byte	[rdi + rax], 0	; mets a jour les flags
			je		.done					; si [rdi + rax] == '\0'
			inc		rax						; rax++
			jmp		.loop					; go to ".loop"
;---------------------------------------------------------------------
		.done:
			ret								; return rax(len)

