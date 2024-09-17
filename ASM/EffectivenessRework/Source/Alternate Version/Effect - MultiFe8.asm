@r2: weapon effectiveness pointer
@r4: weapon equipped by attacker
@r5: address of item struct
@r7: defender's data in memory


@This hack fits inline with the original routine at 0x18620!
.org 0x00000000
.thumb

push		{r4-r7,r14}
mov			r7,r1
ldr			r4,[r7]
cmp			r4,#0x0
beq			End_false		@If there is no defender, don't do anything
lsl			r0, r0, #0x18
lsr			r1, r0, #0x13 @ (byte)r0 * 32
lsr			r0, r0, #0x16 @ (byte)r0 * 4
add			r0, r0, r1
ldr     	r5,ItemTable 	@loads up address of item table
add     	r0,r0,r5
ldrb		r2,[r0,#0x9]
mov			r1,#0x40
and			r1,r2
cmp			r1,#0x0
bne		End_false			@If weapon is a protector it cannot be an effector
ldr     	r2,[r0,#0x10]	@Effectiveness list pointer
cmp			r2,#0x0
beq		End_false
ldr			r1,[r7,#0x4]
add			r1,#0x50
ldrh		r1,[r1]			@Loading defender's class type

Protect:
@check for item with "Delphi Shield" bit set
mov			r3,#0x40
mov     	r6,#0x1E		@For cycling through defender's inventory
Loop_2:
ldrb    	r4,[r7,r6]
cmp			r4,#0x0
beq			No_Protect		@Reached end of inventory
lsl			r0,r4,#0x5		@(byte)r0 * 32
lsl			r4,r4,#0x2		@(byte)r0 * 4
add			r4,r4,r0
add			r4,r4,r5
ldrb     	r0,[r4,#0x9]	@Ability byte 2 - checking for 0x40
and			r0,r3
cmp			r0,#0x0
beq		Loop_2_2
Protect_Apply:
ldr			r0,[r4,#0x10]		@
ldrh		r0,[r0]
bic			r1,r0			@Strips the protected bits from the defender's class type
b		Loop_2_2
Loop_2_2:
add     	r6,#0x2
cmp     	r6,#0x26
ble     Loop_2
No_Protect:
mov			r6,r1

Effectiveness_Check:		@Loop through all effectivenesses of the item looking for a match with defender
mov			r4,#0x0			@Initialize effectiveness multiplier
Effect_Loop_Start:
ldrh		r3,[r2]			@Item's class type
cmp			r3,#0x0
beq			End
and			r3,r6			@Masking with defender's class type
cmp			r3,#0x0
beq			Effect_Loop_End
ldrb		r0,[r2,#0x2]
cmp			r0,r4
blt			Effect_Loop_End
mov			r4,r0
Effect_Loop_End:
add			r2,#0x4
b			Effect_Loop_Start


End_false:
mov			r4,#0x0
End:
mov			r0,r4
pop			{r4-r7}
pop			{r1}
bx			r1

.align 2
ItemTable:
.long 0x08809B10
