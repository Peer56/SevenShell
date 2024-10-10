.thumb

.equ origin, 0x16F10
.equ Is_Staff_Usable_Now, . + 0x26CD0 - origin
.equ Get_Item_Range, . + 0x173A0 - origin
.equ Get_Mag_Over_2_Range, . + 0x184B4 - origin

@r0 = char data ptr, r1 = inventory slot, or -1 for all items

push	{r4-r7,r14}
mov		r5,r0
mov		r6,#0			@range
cmp		r1,#0
blt		AllStaves
lsl		r0,r1,#1
mov		r4,r5
add		r4,#0x1E
ldrh	r4,[r4,r0]		@item
mov		r0,r5
mov		r1,r4
bl		GetStaffMaxRange
mov		r6,r0
b		GoBack

AllStaves:
mov		r7,#0			@inventory counter
ItemLoop:
lsl		r4,r7,#1
add		r4,#0x1E
ldrh	r4,[r5,r4]
cmp		r4,#0
beq		GoBack
mov		r0,r5
mov		r1,r4
bl		GetStaffMaxRange
cmp		r0,r6
blt		NextItem
mov		r6,r0
NextItem:
add		r7,#1
cmp		r7,#4
ble		ItemLoop
GoBack:
mov		r0,r6
pop		{r4-r7}
pop		{r1}
bx		r1

GetStaffMaxRange:
@r0= char data, r1=item
push	{r4-r5,r14}
mov		r4,r0
mov		r5,r1
bl		Is_Staff_Usable_Now
cmp		r0,#0
beq		RetZero
mov		r0,r5
bl		Get_Item_Range
cmp		r0,#0xFF
beq		RetZero
mov		r1,#0xF
and		r0,r1
cmp		r0,#0
bne		RetRange
mov		r0,r4
bl		Get_Mag_Over_2_Range
b		RetRange
RetZero:
mov		r0,#0
RetRange:
pop		{r4-r5}
pop		{r1}
bx		r1
