.rdata
glabel D_80138E90
    .asciz "\x1B[32m"
    .balign 4

glabel D_80138E98
    .asciz "DynaPolyInfo_setup():削除 index=%d\n"
    .balign 4
# Deleted index=%d

glabel D_80138EBC
    .asciz "\x1B[m"
    .balign 4

glabel D_80138EC0
    .asciz "\x1B[32m"
    .balign 4

glabel D_80138EC8
    .asciz "DynaPolyInfo_setup():削除 index=%d\n"
    .balign 4
# Deleted index=%d

glabel D_80138EEC
    .asciz "\x1B[m"
    .balign 4
    
.text
glabel DynaPolyInfo_setup
/* AB6B24 8003F984 27BDFF98 */  addiu $sp, $sp, -0x68
/* AB6B28 8003F988 AFB50034 */  sw    $s5, 0x34($sp)
/* AB6B2C 8003F98C 0080A825 */  move  $s5, $a0
/* AB6B30 8003F990 AFBF0044 */  sw    $ra, 0x44($sp)
/* AB6B34 8003F994 AFB40030 */  sw    $s4, 0x30($sp)
/* AB6B38 8003F998 00A0A025 */  move  $s4, $a1
/* AB6B3C 8003F99C AFBE0040 */  sw    $fp, 0x40($sp)
/* AB6B40 8003F9A0 AFB7003C */  sw    $s7, 0x3c($sp)
/* AB6B44 8003F9A4 AFB60038 */  sw    $s6, 0x38($sp)
/* AB6B48 8003F9A8 AFB3002C */  sw    $s3, 0x2c($sp)
/* AB6B4C 8003F9AC AFB20028 */  sw    $s2, 0x28($sp)
/* AB6B50 8003F9B0 AFB10024 */  sw    $s1, 0x24($sp)
/* AB6B54 8003F9B4 AFB00020 */  sw    $s0, 0x20($sp)
/* AB6B58 8003F9B8 0C00E21C */  jal   func_80038870
/* AB6B5C 8003F9BC 24A413F8 */   addiu $a0, $a1, 0x13f8
/* AB6B60 8003F9C0 00008025 */  move  $s0, $zero
/* AB6B64 8003F9C4 2691000C */  addiu $s1, $s4, 0xc
.L8003F9C8:
/* AB6B68 8003F9C8 0C00F9A2 */  jal   func_8003E688
/* AB6B6C 8003F9CC 02202025 */   move  $a0, $s1
/* AB6B70 8003F9D0 26100064 */  addiu $s0, $s0, 0x64
/* AB6B74 8003F9D4 2A011388 */  slti  $at, $s0, 0x1388
/* AB6B78 8003F9D8 1420FFFB */  bnez  $at, .L8003F9C8
/* AB6B7C 8003F9DC 26310064 */   addiu $s1, $s1, 0x64
/* AB6B80 8003F9E0 3C1E8014 */  lui   $fp, %hi(D_80138EBC) # $fp, 0x8014
/* AB6B84 8003F9E4 3C178014 */  lui   $s7, %hi(D_80138E98) # $s7, 0x8014
/* AB6B88 8003F9E8 3C168014 */  lui   $s6, %hi(D_80138E90) # $s6, 0x8014
/* AB6B8C 8003F9EC 26D68E90 */  addiu $s6, %lo(D_80138E90) # addiu $s6, $s6, -0x7170
/* AB6B90 8003F9F0 26F78E98 */  addiu $s7, %lo(D_80138E98) # addiu $s7, $s7, -0x7168
/* AB6B94 8003F9F4 27DE8EBC */  addiu $fp, %lo(D_80138EBC) # addiu $fp, $fp, -0x7144
/* AB6B98 8003F9F8 00009025 */  move  $s2, $zero
/* AB6B9C 8003F9FC 02808825 */  move  $s1, $s4
/* AB6BA0 8003FA00 02808025 */  move  $s0, $s4
.L8003FA04:
/* AB6BA4 8003FA04 960E138C */  lhu   $t6, 0x138c($s0)
/* AB6BA8 8003FA08 02C02025 */  move  $a0, $s6
/* AB6BAC 8003FA0C 31CF0002 */  andi  $t7, $t6, 2
/* AB6BB0 8003FA10 51E00010 */  beql  $t7, $zero, .L8003FA54
/* AB6BB4 8003FA14 8E220004 */   lw    $v0, 4($s1)
/* AB6BB8 8003FA18 0C00084C */  jal   osSyncPrintf
/* AB6BBC 8003FA1C 26330004 */   addiu $s3, $s1, 4
/* AB6BC0 8003FA20 02E02025 */  move  $a0, $s7
/* AB6BC4 8003FA24 0C00084C */  jal   osSyncPrintf
/* AB6BC8 8003FA28 02402825 */   move  $a1, $s2
/* AB6BCC 8003FA2C 0C00084C */  jal   osSyncPrintf
/* AB6BD0 8003FA30 03C02025 */   move  $a0, $fp
/* AB6BD4 8003FA34 A600138C */  sh    $zero, 0x138c($s0)
/* AB6BD8 8003FA38 02A02025 */  move  $a0, $s5
/* AB6BDC 8003FA3C 0C00F9BB */  jal   func_8003E6EC
/* AB6BE0 8003FA40 02602825 */   move  $a1, $s3
/* AB6BE4 8003FA44 92980000 */  lbu   $t8, ($s4)
/* AB6BE8 8003FA48 37190001 */  ori   $t9, $t8, 1
/* AB6BEC 8003FA4C A2990000 */  sb    $t9, ($s4)
/* AB6BF0 8003FA50 8E220004 */  lw    $v0, 4($s1)
.L8003FA54:
/* AB6BF4 8003FA54 5040001D */  beql  $v0, $zero, .L8003FACC
/* AB6BF8 8003FA58 26520001 */   addiu $s2, $s2, 1
/* AB6BFC 8003FA5C 8C480130 */  lw    $t0, 0x130($v0)
/* AB6C00 8003FA60 3C048014 */  lui   $a0, %hi(D_80138EC0) # $a0, 0x8014
/* AB6C04 8003FA64 24848EC0 */  addiu $a0, %lo(D_80138EC0) # addiu $a0, $a0, -0x7140
/* AB6C08 8003FA68 55000018 */  bnezl $t0, .L8003FACC
/* AB6C0C 8003FA6C 26520001 */   addiu $s2, $s2, 1
/* AB6C10 8003FA70 0C00084C */  jal   osSyncPrintf
/* AB6C14 8003FA74 26B307C0 */   addiu $s3, $s5, 0x7c0
/* AB6C18 8003FA78 3C048014 */  lui   $a0, %hi(D_80138EC8) # $a0, 0x8014
/* AB6C1C 8003FA7C 24848EC8 */  addiu $a0, %lo(D_80138EC8) # addiu $a0, $a0, -0x7138
/* AB6C20 8003FA80 0C00084C */  jal   osSyncPrintf
/* AB6C24 8003FA84 02402825 */   move  $a1, $s2
/* AB6C28 8003FA88 3C048014 */  lui   $a0, %hi(D_80138EEC) # $a0, 0x8014
/* AB6C2C 8003FA8C 0C00084C */  jal   osSyncPrintf
/* AB6C30 8003FA90 24848EEC */   addiu $a0, %lo(D_80138EEC) # addiu $a0, $a0, -0x7114
/* AB6C34 8003FA94 02602025 */  move  $a0, $s3
/* AB6C38 8003FA98 0C00FAE1 */  jal   DynaPolyInfo_GetActor
/* AB6C3C 8003FA9C 02402825 */   move  $a1, $s2
/* AB6C40 8003FAA0 10400024 */  beqz  $v0, .L8003FB34
/* AB6C44 8003FAA4 2409FFFF */   li    $t1, -1
/* AB6C48 8003FAA8 AC49014C */  sw    $t1, 0x14c($v0)
/* AB6C4C 8003FAAC A600138C */  sh    $zero, 0x138c($s0)
/* AB6C50 8003FAB0 02A02025 */  move  $a0, $s5
/* AB6C54 8003FAB4 0C00F9BB */  jal   func_8003E6EC
/* AB6C58 8003FAB8 26250004 */   addiu $a1, $s1, 4
/* AB6C5C 8003FABC 928A0000 */  lbu   $t2, ($s4)
/* AB6C60 8003FAC0 354B0001 */  ori   $t3, $t2, 1
/* AB6C64 8003FAC4 A28B0000 */  sb    $t3, ($s4)
/* AB6C68 8003FAC8 26520001 */  addiu $s2, $s2, 1
.L8003FACC:
/* AB6C6C 8003FACC 2A410032 */  slti  $at, $s2, 0x32
/* AB6C70 8003FAD0 26310064 */  addiu $s1, $s1, 0x64
/* AB6C74 8003FAD4 1420FFCB */  bnez  $at, .L8003FA04
/* AB6C78 8003FAD8 26100002 */   addiu $s0, $s0, 2
/* AB6C7C 8003FADC AFA00060 */  sw    $zero, 0x60($sp)
/* AB6C80 8003FAE0 AFA0005C */  sw    $zero, 0x5c($sp)
/* AB6C84 8003FAE4 00009025 */  move  $s2, $zero
/* AB6C88 8003FAE8 02808025 */  move  $s0, $s4
/* AB6C8C 8003FAEC 24160032 */  li    $s6, 50
/* AB6C90 8003FAF0 27B3005C */  addiu $s3, $sp, 0x5c
/* AB6C94 8003FAF4 27B10060 */  addiu $s1, $sp, 0x60
.L8003FAF8:
/* AB6C98 8003FAF8 960C138C */  lhu   $t4, 0x138c($s0)
/* AB6C9C 8003FAFC 02A02025 */  move  $a0, $s5
/* AB6CA0 8003FB00 02802825 */  move  $a1, $s4
/* AB6CA4 8003FB04 318D0001 */  andi  $t5, $t4, 1
/* AB6CA8 8003FB08 11A00004 */  beqz  $t5, .L8003FB1C
/* AB6CAC 8003FB0C 02403025 */   move  $a2, $s2
/* AB6CB0 8003FB10 02203825 */  move  $a3, $s1
/* AB6CB4 8003FB14 0C00FBA0 */  jal   DynaPolyInfo_expandSRT
/* AB6CB8 8003FB18 AFB30010 */   sw    $s3, 0x10($sp)
.L8003FB1C:
/* AB6CBC 8003FB1C 26520001 */  addiu $s2, $s2, 1
/* AB6CC0 8003FB20 1656FFF5 */  bne   $s2, $s6, .L8003FAF8
/* AB6CC4 8003FB24 26100002 */   addiu $s0, $s0, 2
/* AB6CC8 8003FB28 928E0000 */  lbu   $t6, ($s4)
/* AB6CCC 8003FB2C 31CFFFFE */  andi  $t7, $t6, 0xfffe
/* AB6CD0 8003FB30 A28F0000 */  sb    $t7, ($s4)
.L8003FB34:
/* AB6CD4 8003FB34 8FBF0044 */  lw    $ra, 0x44($sp)
/* AB6CD8 8003FB38 8FB00020 */  lw    $s0, 0x20($sp)
/* AB6CDC 8003FB3C 8FB10024 */  lw    $s1, 0x24($sp)
/* AB6CE0 8003FB40 8FB20028 */  lw    $s2, 0x28($sp)
/* AB6CE4 8003FB44 8FB3002C */  lw    $s3, 0x2c($sp)
/* AB6CE8 8003FB48 8FB40030 */  lw    $s4, 0x30($sp)
/* AB6CEC 8003FB4C 8FB50034 */  lw    $s5, 0x34($sp)
/* AB6CF0 8003FB50 8FB60038 */  lw    $s6, 0x38($sp)
/* AB6CF4 8003FB54 8FB7003C */  lw    $s7, 0x3c($sp)
/* AB6CF8 8003FB58 8FBE0040 */  lw    $fp, 0x40($sp)
/* AB6CFC 8003FB5C 03E00008 */  jr    $ra
/* AB6D00 8003FB60 27BD0068 */   addiu $sp, $sp, 0x68
