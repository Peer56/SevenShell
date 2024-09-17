.thumb

@r0=char data ptr, r1=item id/uses, r2 = index for target checking thingy, r3 = function that does that target checking thingy

push	{r4-r7,r14}
mov		r4,r0
mov		r5,r1
mov		r6,r2
mov		r7,r3
ldr		r0,=#0x2033E40
str		r4,[r0]
ldr		r0,=#0x202E3E8		@range map
ldr		r0,[r0]
mov		r1,#0
ldr		r3,=#0x80190AC		@clear range map
mov		r14,r3
.short	0xF800		
ldrb	r0,[r4,#0x10]
ldrb	r1,[r4,#0x11]
ldr		r3,=#0x804ACE4		@stores coordinates and clears target list, I thik
mov		r14,r3
.short	0xF800
mov		r0,r4
mov		r1,r5
ldr		r3,Get_Staff_Max_Range
mov		r14,r3
.short	0xF800
mov		r2,r0
ldr		r0,=#0x801A2D4		@fills in the range map
mov		r14,r0
ldrb	r0,[r4,#0x10]
ldrb	r1,[r4,#0x11]
mov		r3,#1
.short	0xF800
ldr		r0,=#0x801A2D4		@fills in the range map
mov		r14,r0
ldrb	r0,[r4,#0x10]
ldrb	r1,[r4,#0x11]
mov		r2,#0
mvn		r3,r2
.short	0xF800
ldr		r0,Target_Functions_Table
lsl		r1,r6,#2
ldr		r0,[r0,r1]
mov		r14,r7
.short	0xF800
pop		{r4-r7}
pop		{r0}
bx		r0

.ltorg
.equ Target_Functions_Table, Get_Staff_Max_Range + 4
Get_Staff_Max_Range:
@
