@paste at 0x028B3A
.thumb
lsl     r0,r0,#0x18	@r0 = effectiveness boolean
asr     r0,r0,#0x18	
cmp     r0,#0x1		@Make sure it's at least 1
bge     LoadStrength
NullMultiply:
mov     r0,#0x1
LoadStrength:
mov     r4,#0x14		@Loading strength
ldsb    r4,[r5,r4]
mov     r1,r5
add     r1,#0x5A		@Loading weapon Might
ldrh    r2,[r1]
mul     r2,r0
add     r0,r2,r4		@Adding Might and Strength
strh    r0,[r1]
pop     {r4-r6}
pop     {r0}
bx      r0
