@r2: weapon effectiveness pointer
@r4: weapon equipped by attacker
@r5: address of item struct
@r7: defender's data in memory


@This hack fits inline with the original routine at 0x16820!
.org 0x00000000
.thumb

push		{r4-r7,r14}
mov			r7,r1
ldr			r4,[r7]
cmp			r4,#0x0
beq			End_false		@If there is no defender, don't do anything
lsl			r0,r0,#0x18
lsr			r1,r0,#0x18
mov			r0,#0x24
mul			r0,r1
ldr     	r5,ItemTable 	@loads up address of item table
add     	r0,r0,r5
ldrb		r2,[r0,#0x9]
mov			r1,#0x40
and			r1,r2
cmp			r1,#0x0
bne		End_false			@If weapon is a protector it cannot be an effector
ldrh     	r2,[r0,#0x10]		@First halfword of effectiveness pointer
cmp			r2,#0x0
beq		End_false
ldrb		r4,[r0,#0x12]

Protect:
@check for item with "Delphi Shield" bit set

mov			r6,r2			@Attacker's effectiveness halfword
mov     	r2,#0x1E		@For cycling through defender's inventory
mov			r3,#0x40
Loop_2:
ldrb    	r1,[r7,r2]
cmp			r1,#0x0
beq			No_Protect		@Reached end of inventory without finding item that protects
mov			r0,#0x24
mul			r1,r0
add			r1,r1,r5
ldrb     	r0,[r1,#0x9]	@Ability byte 2 - checking for 0x40
and			r0,r3
cmp			r0,#0x0
bne		Protect_Apply
Loop_2_2:
add     	r2,#0x2
cmp     	r2,#0x26
ble     Loop_2
No_Protect:
b       Effectiveness_Check

Protect_Apply:
mov			r0,#0x10
ldrh		r0,[r1,r0]		@
bic			r6,r0			@Strips the protected bits from the effectiveness bitfield
b		Loop_2_2

Effectiveness_Check:
ldr			r1,[r7,#0x4]
add			r1,#0x50
ldrh		r1,[r1]
and			r1,r6
mov			r0,r4
cmp			r1,#0x0
bne			End

End_false:
mov     	r0,#0x0
End:
pop			{r4-r7}
pop			{r1}
bx			r1

.align 2
ItemTable:
.long 0x08BE222C
