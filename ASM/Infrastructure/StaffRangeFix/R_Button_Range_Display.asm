.thumb

@inserted inline at 168AC

@r0 = item id/uses

.equ origin, 0x168AC
.equ Get_Item_Range, . + 0x173A0 - origin
.equ Copy_Text_To_RAM, . + 0x12C60 - origin

push	{r4-r7,r14}
bl		Get_Item_Range
mov		r6,r0
mov		r7,#0			@flag for whether we need to manually write range, initialized to false
ldr		r0,=#0x1138		@3 spaces text id
cmp		r6,#0
beq		CopyText
cmp		r6,#0xFF
bne		CheckMagOver2
sub		r0,#1			@Total text id
b		CopyText
CheckMagOver2:
mov		r5,#0xF
and		r5,r6
cmp		r5,#0
bne		SetFlag
sub		r0,#9			@Mag/2 text id
b		CopyText
SetFlag:
mov		r7,#1
CopyText:
bl		Copy_Text_To_RAM
cmp		r7,#0
beq		GoBack
mov		r1,#0x20		@ascii for space
strb	r1,[r0]
strb	r1,[r0,#1]
strb	r1,[r0,#2]
strb	r1,[r0,#3]
lsr		r4,r6,#0x4		@r4 = min, r5 = max
cmp		r4,r5
bne		DifferentMinMax
@if number is same
cmp		r4,#10
blt		Label1
sub		r4,#10
mov		r1,#0x31
strb	r1,[r0,#3]
Label1:
add		r4,#0x30		@ascii numbers
strb	r4,[r0,#4]
mov		r1,#0
strb	r1,[r0,#5]
b		GoBack

DifferentMinMax:
cmp		r4,#10
blt		Label2
sub		r4,#10
mov		r1,#0x31
strb	r1,[r0]
Label2:
add		r4,#0x30
strb	r4,[r0,#1]
mov		r1,#0x7F		@ ~
strb	r1,[r0,#2]
cmp		r5,#10
blt		Label3
sub		r5,#10
mov		r1,#0x31
strb	r1,[r0,#3]
add		r5,#0x30
strb	r5,[r0,#4]
mov		r1,#0
strb	r1,[r0,#5]
b		GoBack
Label3:
add		r5,#0x30
strb	r5,[r0,#3]
mov		r1,#0
strb	r1,[r0,#4]

GoBack:
pop		{r4-r7}
pop		{r1}
bx		r1

.ltorg
