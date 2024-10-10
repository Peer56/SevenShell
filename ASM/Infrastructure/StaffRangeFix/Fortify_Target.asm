.thumb

@called at 2C834

@r0 = char data ptr, r4 = action struct ptr

push	{r14}
ldrb	r1,[r4,#0x12]		@slot id
lsl		r1,#1
add		r1,#0x1E
ldrh	r1,[r0,r1]
mov		r2,#0
ldr		r3,Create_Target_List
mov		r14,r3
ldr		r3,=#0x80239B0
.short	0xF800
pop		{r0}
bx		r0

.ltorg
Create_Target_List:
@
