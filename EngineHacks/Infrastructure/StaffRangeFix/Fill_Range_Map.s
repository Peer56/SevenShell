.thumb

@r0 = x, r1 = y, r2 = max

push	{r4-r5,r14}
mov		r4,r0
mov		r5,r1
ldr		r3,=#0x801A2D4
mov		r14,r3
mov		r3,#1
.short	0xF800
mov		r0,r4
mov		r1,r5
mov		r2,#0
ldr		r3,=#0x801A2D4
mov		r14,r3
mov		r3,#1
neg		r3,r3
.short	0xF800
pop		{r4-r5}
pop		{r0}
bx		r0

.ltorg
