# libasm

## section .data
; The data section is used for declaring initialized data or constants. This data does not change at runtime.
; You can declare various constant values, file names, or buffer size, etc., in this section.


## section .bss
; The bss section is used for declaring variables. The syntax for declaring bss section is −


## section .text
; The text section is used for keeping the actual code.
; This section must begin with the declaration global _start, which tells the kernel where the program execution begins.





## Argumente list

|      #        |   64-bit & long ptr |   32-bit & int  |   16-bit & short |   8-bit & char  |
| :----:        | :----:              | :----:          | :----:           | :----:          |
| Return value  |   rax               |   eax           |   ax             | al              |
|    arg1       |   rdi               |   edi           |   di             | dil             |
|    arg2       |   rsi               |   esi           |   si             | sil             |
|    arg3       |   rdx               |   edx           |   dx             | dh:dl           |
|    arg4       |   rcx               |   ecx           |   cx             | ch:cl           |
|    arg5       |   r8                |   r8d           |   r8w            | r8b             |
|    arg6       |   r9                |   r9d           |   r9w            | r9b             |
| stack pointer | rsp                 |   esp           |   sp             | spl             |



## Greatfull use instruction

```
xor rax, rax > mov rax, 0
test rsi, rsi > cmp rsi, 0
```

## Utile

### Linux
```
	https://www.tutorialspoint.com/assembly_programming/index.htm
	https://en.wikipedia.org/wiki/X86_calling_conventions
	https://courses.cs.washington.edu/courses/cse378/10au/sections/Section1_recap.pdf
	https://pageperso.lis-lab.fr/~alexis.nasr/Ens/Compilation/cm07_intel_x86.pdf
```

### Windown
```
    https://asm.developpez.com/manuels/manuel-goasm/
```



#### saved for later

wrt plt
