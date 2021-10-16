.thumb

@r0 = unit data ptr, r1 = max range

push	{r14}
mov		r2,r1
ldrb	r1,[r0,#0x11]
ldrb	r0,[r0,#0x10]
ldr		r3,Fill_Range_Map
mov		r14,r3
.short	0xF800
pop		{r0}
bx		r0

.align
Fill_Range_Map:
@
