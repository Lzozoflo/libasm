# Register

[Extracted from some obscure documentation](http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html)
[Extracted from some obscure documentation](https://math.hws.edu/eck/cs220/f22/registers.html)

x86 registers do not have an intrinsic role imposed by the architecture.
Their “traditional” usage comes mainly from conventions and historical habits, rather than from any hardware constraint.

## dereferance de N octet default 8
```
	- word    [register] ; 2  octets
	- dword   [register] ; 4  octets
	- qword   [register] ; 8  octets
	- tword   [register] ; 10 octets
	- oword   [register] ; 16 octets
	- yword   [register] ; 32 octets
	- zword   [register] ; 64 octets

```
## type of register

| #              | Register  | Lower dword | Lower word | Lower byte |
| :----:         | :----:    | :----:      | :----:     | :----:     |
| Return value   | rax       | eax         | ax         | al         |
| callee-saved   | rbx       | ebx         | bx         | bl         |
| 1st arg        | rdi       | edi         | di         | dil        |
| 2nd arg        | rsi       | esi         | si         | sil        |
| 3rd arg        | rdx       | edx         | dx         | dl         |
| 4th arg        | rcx       | ecx         | cx         | cl         |
| callee-saved   | rbp       | ebp         | bp         | bpl        |
| stack pointer* | rsp       | esp         | sp         | spl        |
| 5th arg        | r8        | r8d         | r8w        | r8b        |
| 6th arg        | r9        | r9d         | r9w        | r9b        |
| tmp            | r10       | r10d        | r10w       | r10b       |
| tmp            | r11       | r11d        | r11w       | r11b       |
| callee-saved   | r12       | r12d        | r12w       | r12b       |
| callee-saved   | r13       | r13d        | r13w       | r13b       |
| callee-saved   | r14       | r14d        | r14w       | r14b       |
| callee-saved   | r15       | r15d        | r15w       | r15b       |

stack pointer*: there is the next param
