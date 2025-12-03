# Instructions Assembleur x86 — Référence Rapide

Ce document liste les instructions assembleur x86 courantes, avec une ligne d'exemple pour illustrer leur utilisation.

---

## Instructions Générales (Base)

### MOV — Copier une valeur
```asm
mov rax, rbx    ; copie le contenu de RBX dans RAX
```

### ADD — Additionner
```asm
add rax, 5      ; rax = rax + 5
```

### SUB — Soustraire
```asm
sub rax, rbx    ; rax = rax - rbx
```

### MUL — Multiplication non signée
```asm
mul rbx         ; RDX:RAX = RAX * RBX (non signé)
```

### IMUL — Multiplication signée
```asm
imul rax, rbx   ; rax = rax * rbx (signé)
```

### DIV — Division non signée
```asm
div rbx         ; RAX = quotient, RDX = reste (non signé)
```

### IDIV — Division signée
```asm
idiv rbx        ; division signée
```

### INC — Incrémenter
```asm
inc rax         ; rax = rax + 1
```

### DEC — Décrémenter
```asm
dec rbx         ; rbx = rbx - 1
```

### CMP — Comparer
```asm
cmp <value1>, <value2>    ; met à jour les flags selon rax - rbx
```

### TEST — Tester (AND logique)
```asm

0 AND 0 = 0
0 AND 1 = 0
1 AND 0 = 0
1 AND 1 = 1

test rax, rax   ; fait un AND mais sans asigner une valeur en mettant à jour les flags, souvent pour tester si rax == 0
```

### NEG — Négatif
```asm
neg rax         ; rax = -rax
```

### NOT — Complément binaire
```asm
not rbx         ; inverse tous les bits
```

### XOR — OU exclusif
```asm

0 XOR 0 = 0
0 XOR 1 = 1
1 XOR 0 = 1
1 XOR 1 = 0

xor rax, rax    ; met rax à 0

```
### AND — ET logique
```asm

0 AND 0 = 0
0 AND 1 = 0
1 AND 0 = 0
1 AND 1 = 1

and rbx, 0xFF   ; masque les bits de rbx
```

### OR — OU logique
```asm
or rax, 1       ; rax |= 1
```


### SHL / SAL — Décalage à gauche
```asm
shl rax, 1      ; rax <<= 1
```

### SHR — Décalage logique à droite
```asm
shr rax, 1      ; décalage logique
```

### SAR — Décalage arithmétique à droite
```asm
sar rax, 1      ; conserve le bit de signe
```

### ROL — Rotation à gauche
```asm
rol rax, 1      ; rotation des bits
```

### ROR — Rotation à droite
```asm
ror rbx, 1
```

### RCL — Rotation à gauche avec Carry
```asm
rcl rax, 1      ; rotation incluant CF
```

### RCR — Rotation à droite avec Carry
```asm
rcr rax, 1
```

---


# Instructions de Contrôle de Flux

### JMP — Saut inconditionnel
```asm
jmp label       ; saute vers label
```

## Saut si strictement ...

### JE / JZ — Effectue un saut si <value1> == <value2>
```asm
je equal_case   ; saute si dernier cmp a donné égal
```

### JNE / JNZ — Effectue un saut si <value1> != <value2>
```asm
jne not_equal
```

### JG / JNLE — Effectue un saut si <value1> > <value2>
```asm
jg greater
```

### JL / JNGE —  Effectue un saut si <value1> < <value2>
```asm
jl lower
```

## Saut si strictement ou égal ...

### JGE / JNL — Effectue un saut si <value1> >= <value2>
```asm
jge greater_equal
```

### JLE / JNG — Effectue un saut si <value1> <= <value2>
```asm
jle lower_equal
```



### JC — Saut si Carry = 1
```asm
jc carry_case
```

### JNC — Saut si Carry = 0
```asm
jnc no_carry
```

### JO — Saut si Overflow = 1
```asm
jo overflow_case
```

### JNO — Saut si pas de Overflow
```asm
jno safe_case
```

### JS — Saut si Signe = 1
```asm
js negative
```

### JNS — Saut si Signe = 0
```asm
jns positive
```

### CALL — Appeler une fonction
```asm
call my_func    ; push adresse retour + saut
```

### RET — Retour fonction
```asm
ret             ; pop adresse retour
```

### LOOP — Saut avec décrémentation ECX
```asm
loop loop_label
```

### LOOPE / LOOPZ — Saut si égal + ECX--
```asm
loope loop_if_equal
```

### LOOPNE / LOOPNZ — Saut si différent + ECX--
```asm
loopne loop_if_not_equal
```

---

## Instructions de Pile

### PUSH — Empiler
```asm
push rax        ; place rax sur la pile
```

### POP — Dépiler
```asm
pop rbx         ; récupère le sommet dans rbx
```

### PUSHA — Empiler tous les registres
```asm
pusha           ; sauvegarde eax, ecx, edx, ebx, esp, ebp, esi, edi
```

### POPA — Dépiler tous les registres
```asm
popa
```

### PUSHF — Empiler les flags
```asm
pushf
```

### POPF — Dépiler les flags
```asm
popf
```

