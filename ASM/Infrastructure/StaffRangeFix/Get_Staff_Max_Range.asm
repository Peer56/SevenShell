.thumb

@r0=char data, r1=item id

push	{r4-r5,r14}
mov		r4,r0
mov		r5,r1
mov		r0,r5
ldr		r3,=#0x80173A0		@get item range
mov		r14,r3
.short	0xF800
cmp		r0,#0xFF
beq		GoBack
mov		r1,#0xF
and		r0,r1
cmp		r0,#0
bne		GoBack
mov		r0,r4
ldr		r3,=#0x80184B4		@mag/2 range
mov		r14,r3
.short	0xF800
GoBack:
pop		{r4-r5}
pop		{r1}
bx		r1

.ltorg
 