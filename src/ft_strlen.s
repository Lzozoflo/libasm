
		; test	rdi,	rdi					; update the flags
		; je		.done						; si rdi == NULL go to ".done"

;	extern int		ft_strlen	(char *s);
;	extern int		ft_strlen	(rdi);

global ft_strlen
section .text

	ft_strlen:
		xor		rax,	rax					; int i = 0 (mov rax, 0)
		jmp		.loop						; go to ".loop"
;---------------------------------------------------------------------
		.loop:
			cmp		byte	[rdi + rax], 0	; update the flags
			je		.done					; si [rdi + rax] == '\0'
			inc		rax						; rax++
			jmp		.loop					; go to ".loop"
;---------------------------------------------------------------------
		.done:
			ret								; return rax(len)

