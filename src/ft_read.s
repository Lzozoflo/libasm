
; extern ssize_t read(int fd, void *buf, size_t count);
	global ft_read
	extern __errno_location

section .text

	ft_read:
		mov rax, 0					; rax was the nb in the tab syscall
		syscall						; call syscall nb(rax)
		cmp rax, 0
		jne error
		ret							; return rax(dest)

	error:
		neg rax
		mov rbx, rax
		call __errno_location
		mov [rax], rbx
		mov rax, -1
		ret
