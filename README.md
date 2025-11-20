# libasm

; The data section is used for declaring initialized data or constants. This data does not change at runtime.
; You can declare various constant values, file names, or buffer size, etc., in this section.
section.data


; The bss section is used for declaring variables. The syntax for declaring bss section is −
section.bss


; The text section is used for keeping the actual code.
; This section must begin with the declaration global _start, which tells the kernel where the program execution begins.
section.text	 


wrt plt




## Argumente list

            |   64-bit  |   32-bit  |   16-bit  |   8-bit   |
            |  long&ptr |   int     |   short   |   char    |


    arg1    |   rdi     |   edi     |   di      | dil
    arg2    |   rsi     |   esi     |   si      | sil
    arg3    |   rdx     |   edx     |   dx      | dh:dl
    arg4    |   rcx     |   ecx     |   cx      | ch:cl
    arg5    |   r8      |   r8d     |   r8w     | r8b
    arg6    |   r9      |   r9d     |   r9w     | r9b


## Register usefull

preverved   |    rbx     |   ebx     |   bx      |   dh:bl


## Greatfull use instruction

xor rax, rax > mov rax, 0