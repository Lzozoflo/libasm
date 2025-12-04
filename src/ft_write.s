
; extern ssize_t write(int fd, const void *buf, size_t count);
global ft_write
section .text

	ft_write:
		mov rax, 1					; rax was the nb in the tab syscall
		syscall						; call syscall nb(rax)
		ret							; return rax(dest)
