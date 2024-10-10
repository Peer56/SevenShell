    .thumb
    .syntax unified

    @ hook at fe7u:08021AF0
    @ using jumpToHack

    .global GenericFaceFixHook
    .type   GenericFaceFixHook, function

GenericFaceFixHook:
    ldr  r4, =gActiveUnit @ replaced
    ldr  r0, [r4, #0]     @ replaced
    ldr  r3, =GetUnitFid  @ replaced
    bl   .Lcall_via_r3    @ replaced

    cmp  r0, #0
    beq  .Lskip_face

    ldr  r3, =0x08021AF9
    bx   r3

.Lskip_face:
    ldr  r3, =0x08021B11
.Lcall_via_r3:
    bx   r3
