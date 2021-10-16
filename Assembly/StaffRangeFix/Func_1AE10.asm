.thumb

.equ origin, 0x1AE10
.equ Can_Use_Staff, . + 0x163D4 - origin
.equ Get_Item_Range, . + 0x173A0 - origin
.equ Get_Mag_Over_2_Range, . + 0x184B4 - origin

@r0 = char data ptr

push	{r4-r7,r14}
bl		GetAllStavesRange
cmp		r0,#0
beq		GoBack
mov		r4,r0
ldr		r0,=#0x202E3D8	@map dimensions
mov		r5,#0
ldsh	r5,[r0,r5]
sub		r5,#1			@x
mov		r6,#2
ldsh	r6,[r0,r6]
sub		r6,#1			@y
mov		r7,r5			@x again
Loop2:
ldr		r0,=#0x202E3E4	@movement map, can this square be moved to
ldr		r0,[r0]
lsl		r3,r6,#2
ldr		r0,[r0,r3]
ldrb	r0,[r0,r5]
cmp		r0,#0x78
bhi		NextSquare
ldr		r0,=#0x202E3DC	@unit map, is there a unit on this tile
ldr		r0,[r0]
ldr		r0,[r0,r3]
ldrb	r0,[r0,r5]
cmp		r0,#0
bne		NextSquare
ldr		r0,=#0x202E3F4	@alternate map, checks for magic seal
ldr		r0,[r0]
ldr		r0,[r0,r3]
ldrb	r0,[r0,r5]
cmp		r0,#0
bne		NextSquare
mov		r0,r5
mov		r1,r6
mov		r2,r4
ldr		r3, Fill_Range_Map
mov		r14,r3
.short	0xF800
NextSquare:
sub		r5,#1
cmp		r5,#0
bge		Loop2
mov		r5,r7
sub		r6,#1
cmp		r6,#0
bge		Loop2
GoBack:
pop		{r4-r7}
pop		{r0}
bx		r0

.ltorg

GetAllStavesRange:
@r0 = char data ptr
push	{r4-r7,r14}
mov		r7,r0
mov		r6,#0			@range
mov		r5,#0			@inventory counter
Loop1:
mov		r0,r7
add		r0,#0x1E
lsl		r1,r5,#1
add		r0,r1
ldrh	r4,[r0]
cmp		r4,#0
beq		RetMaxRange
mov		r0,r7
mov		r1,r4
bl		Can_Use_Staff
cmp		r0,#0
beq		NextItem
mov		r0,r4
bl		Get_Item_Range
cmp		r0,#0xFF
beq		NextItem		@if Total range, don't show green squares
mov		r1,#0xF
and		r0,r1
cmp		r0,#0			@0 = mag/2 staff
bne		CompareToCurrentMax
mov		r0,r7
bl		Get_Mag_Over_2_Range
CompareToCurrentMax:
cmp		r0,r6
ble		NextItem
mov		r6,r0
NextItem:
add		r5,#1
cmp		r5,#4
ble		Loop1
RetMaxRange:
mov		r0,r6
pop		{r4-r7}
pop		{r1}
bx		r1

.align
Fill_Range_Map:
@
