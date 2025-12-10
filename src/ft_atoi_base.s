
;	extern int   ft_atoi_base(char *str, char *base);
;			   ft_atoi_base(rdi, rsi);

global ft_atoi_base

extern ft_strlen
section .text

	ft_atoi_base:
	;	check arguments
		test	rdi,	rdi
		je		.done									;	str == NULL

		test	rsi,	rsi
		je		.done									;	base == NULL

;--------------------------------------------------------------------
	.pushs:
	;	Sauvegarde des registres callee-saved
		push	r15										;	save r15 and pop at .done
		push	r14										;	save r14 and pop at .done
		push	r13										;	save r13 and pop at .done
		push	r12										;	save r12 and pop at .done

		mov		r15,	rdi								;	r15 = str
		mov		r14,	rsi								;	r14 = base
		mov		rdi,	rsi
		call	ft_strlen
		cmp		rax, 2
		jl		.badsize_same
		mov		rdi,	r14

;---------------------------------------------------------------------
		;	a b		;	rdi
		;	. b		;	rsi

		mov		r9b,	byte [rdi]						;	r9b = *base
		.loop_i:
			mov		rsi,	rdi							;	rsi = base
			inc		rsi									;	rsi++
			.loop_j:
				cmp		byte [rsi],	0
				je		.next_i
				cmp		r9b,	byte [rsi]					;	update the flags
				je		.badsize_same					;	if c(*base) == *basecopy
				inc		rsi								;
				jmp		.loop_j
		.next_i:
			inc		rdi
			mov		r9b,	byte [rdi]
			cmp		r9b, 0
			jne		.loop_i



;---------------------------------------------------------------------
		.atoi_base:										;	nothing yet
			mov	rax,	42
			jmp	.pops



;---------------------------------------------------------------------
		.badsize_same:
			xor		rax,	rax
;---------------------------------------------------------------------
		.pops:
			pop		r12									;	callee-saved
			pop		r13									;	callee-saved
			pop		r14									;	callee-saved
			pop		r15									;	callee-saved
		.done:
			ret											;	return

