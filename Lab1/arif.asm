	.model small
	.stack 100h
	.486
	.data 
		a	db 	
		b	db 	?
		c	db 	?
		d	db 	?
		e	db 	?
	.code
begin:	mov 	ax, @data
	mov	ds, ax
	
	movsx 	ax, a	
	movsx	bx, b
	add 	ax, bx	;a + b

	mov 	bx, ax
	imul	bx
	imul	bx	;(a + b)^3

	movsx	bx, a
	imul	bx, 3	;3 * a

	idiv	bx	;(a + b)^3 / (3 * a)

	push 	dx
	push 	ax

	movsx 	ax, d	
	imul 	d
	imul	d
	neg	ax	; -d^3

	movsx	cx, c
	imul	cx, 3	

	add	ax, cx	; c - d^3
	movsx	bx, a
	imul 	bx	; a * (c - d^3)
	
	movsx	cx, e
	imul	cx, cx
	imul	cx, 2	; 2 * c^2

	idiv	cx	; a * (c - d^3) / (2 * c^2)

	mov 	bx, ax

	cwd
	pop 	ax
	pop	dx
	cwde
	add	eax, ebx;(a + b)^3 / (3 * a) + a * (c - d^3) / (2 * c^2)

	
	mov 	ax, 4c00h
	int 	21h
	end 	begin