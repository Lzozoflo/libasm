
;	extern int   ft_atoi_base(char *str, char *base);
;			   ft_atoi_base(rdi, rsi);

global ft_atoi_base

extern ft_strlen

section .text

	ft_atoi_base:
		xor		rax,	rax
	;	check arguments
		test	rdi,	rdi
		je		.done											;	str == NULL

		test	rsi,	rsi
		je		.done											;	base == NULL

;--------------------------------------------------------------------
	.pushs:
		;	Sauvegarde des registres callee-saved
		push	r15												;	save r15 and pop at .pops
		push	r14												;	save r14 and pop at .pops
		push	r13												;	save r13 and pop at .pops
		push	r12												;	save r12 and pop at .pops

		mov		r15,	rdi										;	r15 = str
		mov		r14,	rsi										;	r14 = base
		mov		rdi,	rsi
		call	ft_strlen										;	baseLen
		cmp		rax, 2											;	update flags
		jl		.error							        		;	si baseLen < 2 base_size
		mov		r13, rax										;	r13 = baseLen
		mov		rdi,	r14
		mov		r9b,	byte [rsi]								;	r9b = *base

;---------------------------------------------------------------------
		;	check '+' '-' 'whitespace character'
		.check_char_base:
			cmp		r9b,		43								;	'+'
			je		.error
			cmp		r9b,		45								;	'-'
			je		.error
			cmp		r9b,		32								;	' '      space
			je		.error
			cmp		r9b,		9								;	'\t'     horizontal tab
			je		.error
			cmp		r9b,		10								;	'\n'     newline
			je		.error
			cmp		r9b,		11								;	'\v'     vertical tab
			je		.error
			cmp		r9b,		12								;	'\f'     form feed
			je		.error
			cmp		r9b,		13								;	'\r'     carriage return
			je		.error
			inc		rsi
			mov		r9b,	byte [rsi]							;	r9b = *base
			test	r9b,	r9b
			jne		.check_char_base

;---------------------------------------------------------------------
			mov		rdi,	r14
			;	check_duplicate character
			mov		r9b,	byte [rdi]							;	r9b = *base
			.loop_check_duplicate_i:
				mov		rsi,	rdi								;	rsi = base
				inc		rsi										;	rsi++
				.loop_check_duplicate_j:
					cmp		byte [rsi],	0						;	update the flags
					je		.next_check_duplicate_i				;	if c == '/0'
					cmp		r9b,	byte [rsi]					;	update the flags
					je		.error								;	if c(*base) == *basecopy
					inc		rsi								;
					jmp		.loop_check_duplicate_j
			.next_check_duplicate_i:
				inc		rdi
				mov		r9b,	byte [rdi]
				test	r9b,	r9b
				jne		.loop_check_duplicate_i

;---------------------------------------------------------------------
			mov		rdi,	r15									;	r15 = str

			;	skip the white space character in str
			.skip_white_space
				mov		r9b,	byte [rdi]						;	r9b = *str
				inc		rdi
				cmp		r9b,		32							;	' '      space
				je		.skip_white_space
				cmp		r9b,		9							;	'\t'     horizontal tab
				je		.skip_white_space
				cmp		r9b,		10							;	'\n'     newline
				je		.skip_white_space
				cmp		r9b,		11							;	'\v'     vertical tab
				je		.skip_white_space
				cmp		r9b,		12							;	'\f'     form feed
				je		.skip_white_space
				cmp		r9b,		13							;	'\r'     carriage return
				je		.skip_white_space
			


			;	save the final sign
			mov		rax, 1
			jmp .is_neg

			.positiv:
				mov 	rax, 1
				jmp 	.is_neg_next
			.neg:
				neg 	rax
				
			.is_neg_next
				mov		r9b,	byte [rdi]						;	r9b = *str
				inc		rdi

			.is_neg:
				cmp		r9b,		43							;	'+'
				je		.positiv
				cmp		r9b,		45							;	'-'
				je		.neg
				
				cmp		r9b,		32							;	' '      space
				je		.error
				cmp		r9b,		9							;	'\t'     horizontal tab
				je		.error
				cmp		r9b,		10							;	'\n'     newline
				je		.error
				cmp		r9b,		11							;	'\v'     vertical tab
				je		.error
				cmp		r9b,		12							;	'\f'     form feed
				je		.error
				cmp		r9b,		13							;	'\r'     carriage return
				je		.error

			mov 	r12, rax									; 	r12 = sign 1/-1

;---------------------------------------------------------------------

			dec		rdi
			mov 	r15,	rdi									;	r15 = str(after white space and sign)
			mov		r9b,	byte [rdi]							;	r9b = *str
			.loop_c_str_in_base_i:
				mov		rsi,	r14								;	r14 = base

				.loop_str_is_base_j:
					cmp		byte [rsi],	0						;	update the flags
					je		.next_c_str_in_base_i				;	if c == '/0'
					
					cmp		r9b,	byte [rsi]					;	update the flags

					jne		.c_in_str_is_not_base				;	if c(*str) != base[i]
					mov		rax, 24								;	c(*str) is base[i]

					jmp		.next_c_str_in_base_i				;	next

				.c_in_str_is_not_base
					inc		rsi									;	base++
					jmp		.loop_str_is_base_j

			.next_c_str_in_base_i:
				cmp		rax, 	24								; 	if rax != 1 -> c(*str) != base[all index]
				jne		.error									; 	error ret 0
				xor 	rax, 	rax
				inc		rdi										;	str++
				mov		r9b,	byte [rdi]
				test	r9b,	r9b
				jne		.loop_c_str_in_base_i					;  if str != '/0'


;---------------------------------------------------------------------

			mov		rdi,	r15									;	r15 = str(after white space and sign)
			mov		rsi,	r14									;	r14 = base

			mov 	r14, 	0
			mov		r9b,	byte [rdi]							;	r9b = *str(after white space and sign)
			.get_nb_base:
				mov 	rax, 	0
			.get_nb_base_loop:
				cmp		r9b,	byte [rsi + rax]				;
				je		.atoi_base
				inc 	rax
				jmp		.get_nb_base_loop

;---------------------------------------------------------------------
			.atoi_base:											;	nothing yet
				imul 	r14,  	r13 							; 	res = (res * lenBase) +  nb_from_base
				add 	r14, 	rax 							; 	res = (res * lenBase) +  nb_from_base
				inc 	rdi
				mov		r9b,	byte [rdi]						;	r9b = *str(after white space and sign)
				test 	r9b, 	r9b
				jne		.get_nb_base

			.end_atoi_base:
				mov rax, r14
				imul rax, r12 									; 	res = res * sign  
				jmp .pops

;---------------------------------------------------------------------
			.error:
				xor		rax,	rax
;---------------------------------------------------------------------
			.pops:
				pop		r12										;	callee-saved
				pop		r13										;	callee-saved
				pop		r14										;	callee-saved
				pop		r15										;	callee-saved
			.done:
				ret												;	return
