.thumb

@all staffs in the item/staff usability jump table come here

@Heal/Mend/Recover/Physic/Fortify
mov		r2,#0
b		StaffUsability
@Restore
mov		r2,#1
b		StaffUsability
@Silence
mov		r2,#2
b		StaffUsability
@Sleep
mov		r2,#3
b		StaffUsability
@Berserk
mov		r2,#4
b		StaffUsability
@Warp
mov		r2,#5
b		StaffUsability
@Rescue
mov		r2,#6
b		StaffUsability
@Torch's usability doesn't change, since it just checks if there's fog
@Hammerne
mov		r2,#7
b		StaffUsability
@Unlock
mov		r2,#8
b		UnlockUsability		@because it checks terrain rather than units while looking for appropriate targets, we call a different function
@Barrier
mov		r2,#9
b		StaffUsability

UnlockUsability:
ldr		r3,=#0x8023A1C
b		FillRange

StaffUsability:
ldr		r3,=#0x80239B0

FillRange:
ldr		r0,Create_Target_List
mov		r14,r0
mov		r0,r4
mov		r1,r5
.short	0xF800
ldr		r0,=#0x804B174
mov		r14,r0
.short	0xF800
cmp		r0,#0
beq		GoBack
mov		r0,#1
GoBack:
pop		{r4-r5}
pop		{r1}
bx		r1

.ltorg
Create_Target_List:
@
