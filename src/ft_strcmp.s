
; extern int ft_strcmp(const char *s1, const char *s2);
; 			 ft_strcmp(rdi, rsi)

global ft_strcmp
section .text

	ft_strcmp:
		jmp .loop						; je vais dans la loop (.loop)

		.loop:
			mov		al, [rdi]			; recupere le char dans la string au dereferancement *s1 s1[1]
			mov		r8b, [rsi]			; recupere le char dans la string au dereferancement
			cmp		al, r8b				; cmp les 2 octet et change les flag
			jne		.not_same			; is cmp 1 != 2 go to..
			test	al, al				; on regarde si == '\0' (que sur al pck si r8b etait pas un '\0' et al oui il serait sortie avant	)
			je		.done				; si == '\0' finish return 0
			inc		rdi					; rdi++
			inc		rsi					; rsi++
			jmp		.loop				; go to loop
;---------------------------------------------------------------------
		.not_same:
			sub al, r8b					; al = al - r8b (8 bits, overflow ignoré)
			movsx rax, al				; rangement de registre (avec bit signer)
			ret							; return cette meme value
;---------------------------------------------------------------------
		.done:
			xor rax, rax				; rax = 0
			ret							; return 0
