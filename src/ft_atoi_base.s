
;	extern int   ft_atoi_base(char *str, char *base);
;			   ft_atoi_base(rdi, rsi);

global ft_atoi_base

extern ft_strlen

section .text

	ft_atoi_base:
		xor		rax,	rax
	;	check arguments
		test	rdi,	rdi
		je		.done									;	str == NULL

		test	rsi,	rsi
		je		.done									;	base == NULL

;--------------------------------------------------------------------
	.pushs:
	;	Sauvegarde des registres callee-saved
		push	r15										;	save r15 and pop at .pops
		push	r14										;	save r14 and pop at .pops
		push	r13										;	save r13 and pop at .pops
		push	r12										;	save r12 and pop at .pops

		mov		r15,	rdi								;	r15 = str
		mov		r14,	rsi								;	r14 = base
		mov		rdi,	rsi
		call	ft_strlen								;	baseLen
		cmp		rax, 2									;	update flags
		jl		.badsize_same							;	check baseLen >= 2
		mov		rdi,	r14
		mov		r9b,	byte [rsi]						;	r9b = *base

;---------------------------------------------------------------------
		;	check '+' '-' 'whitespace character'
		.checkCharBase:
		cmp		r9b,		43							;	'+'
		je		.badsize_same
		cmp		r9b,		45							;	'-'
		je		.badsize_same
		cmp		r9b,		32							;	' '      space
		je		.badsize_same
		cmp		r9b,		9							;	'\t'     horizontal tab
		je		.badsize_same
		cmp		r9b,		10							;	'\n'     newline
		je		.badsize_same
		cmp		r9b,		11							;	'\v'     vertical tab
		je		.badsize_same
		cmp		r9b,		12							;	'\f'     form feed
		je		.badsize_same
		cmp		r9b,		13							;	'\r'     carriage return
		je		.badsize_same
		inc		rsi
		mov		r9b,	byte [rsi]						;	r9b = *base
		test	r9b,	r9b
		jne		.checkCharBase

;---------------------------------------------------------------------
		mov		rdi,	r14
		;	check_duplicate character
		mov		r9b,	byte [rdi]						;	r9b = *base
		.loop_check_duplicate_i:
			mov		rsi,	rdi							;	rsi = base
			inc		rsi									;	rsi++
			.loop_check_duplicate_j:
				cmp		byte [rsi],	0					;	update the flags
				je		.next_i							;	if c == '/0'
				cmp		r9b,	byte [rsi]				;	update the flags
				je		.badsize_same					;	if c(*base) == *basecopy
				inc		rsi								;
				jmp		.loop_check_duplicate_j
		.next_i:
			inc		rdi
			mov		r9b,	byte [rdi]
			cmp		r9b, 0
			jne		.loop_check_duplicate_i

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

