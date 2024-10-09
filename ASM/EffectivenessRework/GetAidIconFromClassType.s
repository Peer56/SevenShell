.thumb

push {r1}
ldr r0,[r6,#0xC]
ldr r1,[r0,#0x4]
mov r0,#0x50
ldrh r1,[r1,r0]

mov r0,#0x1 @ horse type
and r0,r1
cmp r0,#0x0
beq Dragon
mov r0,#0xA4 @ horse icon ID
b End

Dragon:
mov r0,#0x2 @ dragon type
and r0,r1
cmp r0,#0x0
beq Flier
mov r0,#0xA5 @ dragon icon ID
b End

Flier:
mov r0,#0x4 @ flier type
and r0,r1
cmp r0,#0x0
beq Armor
mov r0,#0xA6 @ flier icon ID
b End

Armor:
mov r0,#0x8 @ armor type
and r0,r1
cmp r0,#0x0
beq Sword
mov r0,#0xA7 @ armor icon ID
b End

Sword:
mov r0,#0x10 @ sword type
and r0,r1
cmp r0,#0x0
beq Magic
mov r0,#0xA8 @ sword icon ID
b End

Magic:
mov r0,#0x20 @ magic type
and r0,r1
cmp r0,#0x0
beq Infantry
mov r0,#0xA9 @ magic icon ID
b End

Infantry:
mov r0,#0x40 @ infantry type
and r0,r1
cmp r0,#0x0
bne TypeEnd
mov r0,#0x0
neg r0,r0 @ don't know why we need this whole part but it's in vanilla
b End

TypeEnd:
mov r0,#0xA9 @ infantry icon ID

End:
pop {r1}
bx r14
