.thumb

@all staffs in the item/staff target jump table come here

@Heal/Mend/Recover/Physic (Fortify is handled elsewhere)
mov		r2,#0
b		StaffTarget
@Restore
mov		r2,#1
b		StaffTarget
@Silence
mov		r2,#2
b		StaffTarget
@Sleep
mov		r2,#3
b		StaffTarget
@Berserk
mov		r2,#4
b		StaffTarget
@Warp
mov		r2,#5
b		StaffTarget
@Rescue
mov		r2,#6
b		StaffTarget
@Torch is also handled elsewhere
@Hammerne
mov		r2,#7
b		StaffTarget
@Unlock
mov		r2,#8
b		UnlockTarget		@because it checks terrain rather than units while looking for appropriate targets, we call a different function
@Barrier
mov		r2,#9
b		StaffTarget

UnlockTarget:
ldr		r3,=#0x8023A1C
b		FillRange

StaffTarget:
ldr		r3,=#0x80239B0

FillRange:
push	{r14}
ldr		r0,Create_Target_List
mov		r14,r0
mov		r0,r5
mov		r1,r4
.short	0xF800
pop		{r0}
bx		r0

.ltorg
Create_Target_List:
@
