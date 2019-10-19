global _start

_start:
	mov eax, 1	; sys_exit system call
	mov ebx, 81	; Register B
	mov ecx, 45	; Register C
	jmp .compare
.compare:
	cmp ebx, ecx
	jg .subtract_b	; If B is greater than C...
	jl .subtract_c	; If B is lesser than C...
	je .end		; If B equals C...
.subtract_b:
	sub ebx, ecx	; ... B -= C
	jmp .compare
.subtract_c:
	sub ecx, ebx	; ... C -= B
	jmp .compare
.end:
	int 0x80	; ... Interrupts execution

