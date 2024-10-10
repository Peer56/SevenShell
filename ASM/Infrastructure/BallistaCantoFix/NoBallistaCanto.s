.thumb

@called from 1CBA0

@Canto check
push    {r14}
ldr     r5,=0x3004690
ldr     r2, [r5]        @Getting unit data
ldr     r0, [r2]
ldr     r3, [r2,#0x4]
ldr     r0, [r0,#0x28]  @Unit abilities
ldr     r1, [r3,#0x28]  @Class abilities
orr     r0, r1
mov     r1, #0x21
lsl     r1, #0x6        @Canto and on ballista bits
and     r0, r1
cmp     r0, #0x0
pop     {r3}
bx      r3

.ltorg
.align
