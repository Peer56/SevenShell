@paste at 0x02AB08
.thumb
lsl     r0,r0,#0x18	@r0 = effectiveness boolean
asr     r5,r0,#0x18	
cmp     r5,#0x1		@Make sure it's at least 1
bge     LoadStrength
NullMultiply:
mov     r5,#0x1
LoadStrength:	
mov     r4,#0x14		@Loading strength
ldsb    r4,[r6,r4]
mov     r1,r6
add     r1,#0x5A		@Loading weapon Might
ldrh    r2,[r1]
mul     r2,r5
add     r5,r2,r4		@Adding Might and Strength
strh    r5,[r1]			@Using r5 here to maintain compatability with Slayer checks
mov		r0,#0x48
ldrb	r0,[r6,r0]
cmp		r0,#0xB5		@Stone check
bne		End
mov		r0,#0x0
strh	r0,[r1]			@If Stone is equipped, Might is zero
End:
pop     {r4-r6}
pop     {r0}
bx      r0
