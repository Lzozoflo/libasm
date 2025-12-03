
; extern ssize_t read(int fd, void *buf, size_t count);
global ft_read
section .text

		ft_read:
			mov rax, 0					; rax was the nb in the tab syscall
			syscall						; call syscall nb(rax)
			ret							; return rax(dest)
