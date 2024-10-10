@negative stat bar handler

.thumb
.org 0

@coming from 807f800, we need to return to 807f820
cmp r0, #0
beq End
blt NegBar
@original routine goes here
mov r0,r9
add r0,#2
mov r1,r10
add r5,r1,r0
ldr r4,[sp, #0x2C]

Loop1:
mov r0,r8
lsl r1,r6,#0x3
mov r2,r5
ldr r3,GreenPalette
mov lr,r3
.short 0xf800
add r5,#1
sub r4,#1
cmp r4,#0
bne Loop1
b End

NegBar:
neg r0,r0
mov r4,r0
mov r0,r9
add r0,#2
mov r1,r10
add r5,r1,r0
sub r5,r4

Loop2:
mov r0,r8
lsl r1,r6,#0x3
mov r2,r5
bl RedPalette
add r5,#1
sub r4,#1
cmp r4,#0
bne Loop2

End:
ldr r0, Return
bx r0

.align
GreenPalette:
.long 0x807f75c @0x8086a24 {FE8U}
Return:
.long 0x807f821

RedPalette:
push {r4}
add r3,r1,r2
add r3,r0
mov r4,#8
strb r4,[r3]
lsl r1,#1
add r1,r2
add r0,r1
mov r1,#7
strb r1,[r0]
pop {r4}
bx lr
