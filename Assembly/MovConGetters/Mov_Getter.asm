.thumb
.org 0x0

@r0=char data ptr
push	{r14}
ldrb	r1,[r0,#0xB]
cmp		r1,#0x3F
ble		GetMov
mov		r1,#0x41
ldrb	r1,[r0,r1]		@AI byte 4
mov		r2,#0x20
tst		r1,r2
beq		GetMov
mov		r0,#0x0
b		GoBack
GetMov:
ldr		r1,[r0,#0x4]
ldrb	r1,[r1,#0x12]	@class mov
mov		r2,#0x1D
ldsb	r0,[r0,r2]
add		r0,r1
GoBack:
pop		{r1}
bx		r1
