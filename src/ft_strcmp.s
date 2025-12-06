
; extern int ft_strcmp(const char *str1, const char *str2);
; 			 ft_strcmp(rdi, rsi)

global ft_strcmp
section .text

	ft_strcmp:
		jmp .loop						; go to ".loop"
;---------------------------------------------------------------------
		.loop:
			mov		al, [rdi]			; recup le char a *str1
			mov		r8b, [rsi]			; recup le char a *str2
			cmp		al, r8b				; update the flags
			jne		.not_same			; is cmp *str1 != *str2 go to ".not_same"
			test	al, al				; update the flags
			je		.done				; jmp si == '\0' ".done" (finish return 0)
			inc		rdi					; rdi++
			inc		rsi					; rsi++
			jmp		.loop				; go to ".loop"
;---------------------------------------------------------------------
			.not_same:
				sub al, r8b					; al = al - r8b (8 bits, overflow ignoré)
				movsx rax, al				; upgrade de registre (avec bit signer) (movzx pour non signer)
				ret							; return rax
;---------------------------------------------------------------------
			.done:
				xor rax, rax				; rax = 0
				ret							; return 0
