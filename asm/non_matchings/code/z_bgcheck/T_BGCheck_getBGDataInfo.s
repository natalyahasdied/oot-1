.rdata
glabel D_801388F4
    .asciz "\x1B[43;30m"
    .balign 4

glabel D_80138900
    .asciz "T_BGCheck_getBGDataInfo():そのbg_actor_indexは使われておりません。index=%d\n"
    .balign 4
# bg_actor_index is unused.

glabel D_8013894C
    .asciz "\x1B[m"
    .balign 4
    
.text
glabel T_BGCheck_getBGDataInfo
/* AB3664 8003C4C4 27BDFFE8 */  addiu $sp, $sp, -0x18
/* AB3668 8003C4C8 24010032 */  li    $at, 50
/* AB366C 8003C4CC 14A10003 */  bne   $a1, $at, .L8003C4DC
/* AB3670 8003C4D0 AFBF0014 */   sw    $ra, 0x14($sp)
/* AB3674 8003C4D4 1000001D */  b     .L8003C54C
/* AB3678 8003C4D8 8C820000 */   lw    $v0, ($a0)
.L8003C4DC:
/* AB367C 8003C4DC 04A00003 */  bltz  $a1, .L8003C4EC
/* AB3680 8003C4E0 28A10033 */   slti  $at, $a1, 0x33
/* AB3684 8003C4E4 14200003 */  bnez  $at, .L8003C4F4
/* AB3688 8003C4E8 00057040 */   sll   $t6, $a1, 1
.L8003C4EC:
/* AB368C 8003C4EC 10000017 */  b     .L8003C54C
/* AB3690 8003C4F0 00001025 */   move  $v0, $zero
.L8003C4F4:
/* AB3694 8003C4F4 008E7821 */  addu  $t7, $a0, $t6
/* AB3698 8003C4F8 95F813DC */  lhu   $t8, 0x13dc($t7)
/* AB369C 8003C4FC 00054080 */  sll   $t0, $a1, 2
/* AB36A0 8003C500 01054023 */  subu  $t0, $t0, $a1
/* AB36A4 8003C504 33190001 */  andi  $t9, $t8, 1
/* AB36A8 8003C508 1720000C */  bnez  $t9, .L8003C53C
/* AB36AC 8003C50C 000840C0 */   sll   $t0, $t0, 3
/* AB36B0 8003C510 3C048014 */  lui   $a0, %hi(D_801388F4) # $a0, 0x8014
/* AB36B4 8003C514 0C00084C */  jal   osSyncPrintf
/* AB36B8 8003C518 248488F4 */   addiu $a0, %lo(D_801388F4) # addiu $a0, $a0, -0x770c
/* AB36BC 8003C51C 3C048014 */  lui   $a0, %hi(D_80138900) # $a0, 0x8014
/* AB36C0 8003C520 0C00084C */  jal   osSyncPrintf
/* AB36C4 8003C524 24848900 */   addiu $a0, %lo(D_80138900) # addiu $a0, $a0, -0x7700
/* AB36C8 8003C528 3C048014 */  lui   $a0, %hi(D_8013894C) # $a0, 0x8014
/* AB36CC 8003C52C 0C00084C */  jal   osSyncPrintf
/* AB36D0 8003C530 2484894C */   addiu $a0, %lo(D_8013894C) # addiu $a0, $a0, -0x76b4
/* AB36D4 8003C534 10000005 */  b     .L8003C54C
/* AB36D8 8003C538 00001025 */   move  $v0, $zero
.L8003C53C:
/* AB36DC 8003C53C 01054021 */  addu  $t0, $t0, $a1
/* AB36E0 8003C540 00084080 */  sll   $t0, $t0, 2
/* AB36E4 8003C544 00884821 */  addu  $t1, $a0, $t0
/* AB36E8 8003C548 8D220058 */  lw    $v0, 0x58($t1)
.L8003C54C:
/* AB36EC 8003C54C 8FBF0014 */  lw    $ra, 0x14($sp)
/* AB36F0 8003C550 27BD0018 */  addiu $sp, $sp, 0x18
/* AB36F4 8003C554 03E00008 */  jr    $ra
/* AB36F8 8003C558 00000000 */   nop   

