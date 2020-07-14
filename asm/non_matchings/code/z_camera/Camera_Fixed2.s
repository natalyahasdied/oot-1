.late_rodata
glabel D_8013A180
    .float 0.01

glabel D_8013A184
    .float 0.1

glabel D_8013A188
    .float 0.1

glabel D_8013A18C
    .float 0.01

.text
glabel Camera_Fixed2
/* AC6B78 8004F9D8 27BDFF70 */  addiu $sp, $sp, -0x90
/* AC6B7C 8004F9DC AFB0001C */  sw    $s0, 0x1c($sp)
/* AC6B80 8004F9E0 00808025 */  move  $s0, $a0
/* AC6B84 8004F9E4 AFBF0024 */  sw    $ra, 0x24($sp)
/* AC6B88 8004F9E8 AFB10020 */  sw    $s1, 0x20($sp)
/* AC6B8C 8004F9EC 0C00B721 */  jal   Player_GetCameraYOffset
/* AC6B90 8004F9F0 8C840090 */   lw    $a0, 0x90($a0)
/* AC6B94 8004F9F4 E7A00054 */  swc1  $f0, 0x54($sp)
/* AC6B98 8004F9F8 8602015E */  lh    $v0, 0x15e($s0)
/* AC6B9C 8004F9FC 2401000A */  li    $at, 10
/* AC6BA0 8004FA00 3C0C8016 */  lui   $t4, %hi(gGameInfo) # $t4, 0x8016
/* AC6BA4 8004FA04 10400008 */  beqz  $v0, .L8004FA28
/* AC6BA8 8004FA08 00000000 */   nop
/* AC6BAC 8004FA0C 10410006 */  beq   $v0, $at, .L8004FA28
/* AC6BB0 8004FA10 24010014 */   li    $at, 20
/* AC6BB4 8004FA14 10410004 */  beq   $v0, $at, .L8004FA28
/* AC6BB8 8004FA18 3C0E8016 */   lui   $t6, %hi(gGameInfo) # $t6, 0x8016
/* AC6BBC 8004FA1C 8DCEFA90 */  lw    $t6, %lo(gGameInfo)($t6)
/* AC6BC0 8004FA20 85CF0314 */  lh    $t7, 0x314($t6)
/* AC6BC4 8004FA24 11E0005A */  beqz  $t7, .L8004FB90
.L8004FA28:
/* AC6BC8 8004FA28 3C018014 */   lui   $at, %hi(D_8013A180)
/* AC6BCC 8004FA2C C42EA180 */  lwc1  $f14, %lo(D_8013A180)($at)
/* AC6BD0 8004FA30 3C013F80 */  li    $at, 0x3F800000 # 0.000000
/* AC6BD4 8004FA34 44814000 */  mtc1  $at, $f8
/* AC6BD8 8004FA38 3C014288 */  li    $at, 0x42880000 # 0.000000
/* AC6BDC 8004FA3C 44818000 */  mtc1  $at, $f16
/* AC6BE0 8004FA40 8D8CFA90 */  lw    $t4, %lo(gGameInfo)($t4)
/* AC6BE4 8004FA44 86180142 */  lh    $t8, 0x142($s0)
/* AC6BE8 8004FA48 46008483 */  div.s $f18, $f16, $f0
/* AC6BEC 8004FA4C 858D01F0 */  lh    $t5, 0x1f0($t4)
/* AC6BF0 8004FA50 3C088012 */  lui   $t0, %hi(sCameraSettings)
/* AC6BF4 8004FA54 0018C8C0 */  sll   $t9, $t8, 3
/* AC6BF8 8004FA58 448D2000 */  mtc1  $t5, $f4
/* AC6BFC 8004FA5C 86090144 */  lh    $t1, 0x144($s0)
/* AC6C00 8004FA60 01194021 */  addu  $t0, $t0, $t9
/* AC6C04 8004FA64 468021A0 */  cvt.s.w $f6, $f4
/* AC6C08 8004FA68 8D08D068 */  lw    $t0, %lo(sCameraSettings+4)($t0)
/* AC6C0C 8004FA6C 000950C0 */  sll   $t2, $t1, 3
/* AC6C10 8004FA70 3C0142C8 */  li    $at, 0x42C80000 # 0.000000
/* AC6C14 8004FA74 010A5821 */  addu  $t3, $t0, $t2
/* AC6C18 8004FA78 8D620004 */  lw    $v0, 4($t3)
/* AC6C1C 8004FA7C 26110014 */  addiu $s1, $s0, 0x14
/* AC6C20 8004FA80 02002025 */  move  $a0, $s0
/* AC6C24 8004FA84 844E0000 */  lh    $t6, ($v0)
/* AC6C28 8004FA88 24420010 */  addiu $v0, $v0, 0x10
/* AC6C2C 8004FA8C 460E3082 */  mul.s $f2, $f6, $f14
/* AC6C30 8004FA90 448E3000 */  mtc1  $t6, $f6
/* AC6C34 8004FA94 46024280 */  add.s $f10, $f8, $f2
/* AC6C38 8004FA98 46121102 */  mul.s $f4, $f2, $f18
/* AC6C3C 8004FA9C 46803220 */  cvt.s.w $f8, $f6
/* AC6C40 8004FAA0 46045301 */  sub.s $f12, $f10, $f4
/* AC6C44 8004FAA4 460E4402 */  mul.s $f16, $f8, $f14
/* AC6C48 8004FAA8 00000000 */  nop
/* AC6C4C 8004FAAC 46008482 */  mul.s $f18, $f16, $f0
/* AC6C50 8004FAB0 00000000 */  nop
/* AC6C54 8004FAB4 460C9282 */  mul.s $f10, $f18, $f12
/* AC6C58 8004FAB8 E60A0000 */  swc1  $f10, ($s0)
/* AC6C5C 8004FABC 844FFFF4 */  lh    $t7, -0xc($v0)
/* AC6C60 8004FAC0 448F2000 */  mtc1  $t7, $f4
/* AC6C64 8004FAC4 00000000 */  nop
/* AC6C68 8004FAC8 468021A0 */  cvt.s.w $f6, $f4
/* AC6C6C 8004FACC 460E3202 */  mul.s $f8, $f6, $f14
/* AC6C70 8004FAD0 E6080004 */  swc1  $f8, 4($s0)
/* AC6C74 8004FAD4 8458FFF8 */  lh    $t8, -8($v0)
/* AC6C78 8004FAD8 44988000 */  mtc1  $t8, $f16
/* AC6C7C 8004FADC 00000000 */  nop
/* AC6C80 8004FAE0 468084A0 */  cvt.s.w $f18, $f16
/* AC6C84 8004FAE4 44818000 */  mtc1  $at, $f16
/* AC6C88 8004FAE8 460E9282 */  mul.s $f10, $f18, $f14
/* AC6C8C 8004FAEC E60A0008 */  swc1  $f10, 8($s0)
/* AC6C90 8004FAF0 8459FFFC */  lh    $t9, -4($v0)
/* AC6C94 8004FAF4 44992000 */  mtc1  $t9, $f4
/* AC6C98 8004FAF8 00000000 */  nop
/* AC6C9C 8004FAFC 468021A0 */  cvt.s.w $f6, $f4
/* AC6CA0 8004FB00 E606000C */  swc1  $f6, 0xc($s0)
/* AC6CA4 8004FB04 C608000C */  lwc1  $f8, 0xc($s0)
/* AC6CA8 8004FB08 84490000 */  lh    $t1, ($v0)
/* AC6CAC 8004FB0C 46104482 */  mul.s $f18, $f8, $f16
/* AC6CB0 8004FB10 A6090010 */  sh    $t1, 0x10($s0)
/* AC6CB4 8004FB14 4600928D */  trunc.w.s $f10, $f18
/* AC6CB8 8004FB18 440A5000 */  mfc1  $t2, $f10
/* AC6CBC 8004FB1C 0C0111DB */  jal   func_8004476C
/* AC6CC0 8004FB20 A62A000C */   sh    $t2, 0xc($s1)
/* AC6CC4 8004FB24 1040000B */  beqz  $v0, .L8004FB54
/* AC6CC8 8004FB28 00402825 */   move  $a1, $v0
/* AC6CCC 8004FB2C 02202025 */  move  $a0, $s1
/* AC6CD0 8004FB30 0C010EF1 */  jal   func_80043BC4
/* AC6CD4 8004FB34 AFA20064 */   sw    $v0, 0x64($sp)
/* AC6CD8 8004FB38 8FA50064 */  lw    $a1, 0x64($sp)
/* AC6CDC 8004FB3C 2401FFFF */  li    $at, -1
/* AC6CE0 8004FB40 84A3000C */  lh    $v1, 0xc($a1)
/* AC6CE4 8004FB44 5061000A */  beql  $v1, $at, .L8004FB70
/* AC6CE8 8004FB48 8622000C */   lh    $v0, 0xc($s1)
/* AC6CEC 8004FB4C 10000007 */  b     .L8004FB6C
/* AC6CF0 8004FB50 A623000C */   sh    $v1, 0xc($s1)
.L8004FB54:
/* AC6CF4 8004FB54 8E0C005C */  lw    $t4, 0x5c($s0)
/* AC6CF8 8004FB58 AE2C0000 */  sw    $t4, ($s1)
/* AC6CFC 8004FB5C 8E0B0060 */  lw    $t3, 0x60($s0)
/* AC6D00 8004FB60 AE2B0004 */  sw    $t3, 4($s1)
/* AC6D04 8004FB64 8E0C0064 */  lw    $t4, 0x64($s0)
/* AC6D08 8004FB68 AE2C0008 */  sw    $t4, 8($s1)
.L8004FB6C:
/* AC6D0C 8004FB6C 8622000C */  lh    $v0, 0xc($s1)
.L8004FB70:
/* AC6D10 8004FB70 28410169 */  slti  $at, $v0, 0x169
/* AC6D14 8004FB74 10200006 */  beqz  $at, .L8004FB90
/* AC6D18 8004FB78 00026880 */   sll   $t5, $v0, 2
/* AC6D1C 8004FB7C 01A26823 */  subu  $t5, $t5, $v0
/* AC6D20 8004FB80 000D68C0 */  sll   $t5, $t5, 3
/* AC6D24 8004FB84 01A26821 */  addu  $t5, $t5, $v0
/* AC6D28 8004FB88 000D6880 */  sll   $t5, $t5, 2
/* AC6D2C 8004FB8C A62D000C */  sh    $t5, 0xc($s1)
.L8004FB90:
/* AC6D30 8004FB90 3C0F8016 */  lui   $t7, %hi(gGameInfo)
/* AC6D34 8004FB94 8DEFFA90 */  lw    $t7, %lo(gGameInfo)($t7)
/* AC6D38 8004FB98 260E005C */  addiu $t6, $s0, 0x5c
/* AC6D3C 8004FB9C AFAE003C */  sw    $t6, 0x3c($sp)
/* AC6D40 8004FBA0 85F80314 */  lh    $t8, 0x314($t7)
/* AC6D44 8004FBA4 26110014 */  addiu $s1, $s0, 0x14
/* AC6D48 8004FBA8 53000004 */  beql  $t8, $zero, .L8004FBBC
/* AC6D4C 8004FBAC 44801000 */   mtc1  $zero, $f2
/* AC6D50 8004FBB0 0C011495 */  jal   Camera_CopyPREGToModeValues
/* AC6D54 8004FBB4 02002025 */   move  $a0, $s0
/* AC6D58 8004FBB8 44801000 */  mtc1  $zero, $f2
.L8004FBBC:
/* AC6D5C 8004FBBC 86190010 */  lh    $t9, 0x10($s0)
/* AC6D60 8004FBC0 3C018012 */  lui   $at, %hi(D_8011D3A0) # $at, 0x8012
/* AC6D64 8004FBC4 E7A2006C */  swc1  $f2, 0x6c($sp)
/* AC6D68 8004FBC8 AC39D3A0 */  sw    $t9, %lo(D_8011D3A0)($at)
/* AC6D6C 8004FBCC C6040000 */  lwc1  $f4, ($s0)
/* AC6D70 8004FBD0 C7A60054 */  lwc1  $f6, 0x54($sp)
/* AC6D74 8004FBD4 E7A20074 */  swc1  $f2, 0x74($sp)
/* AC6D78 8004FBD8 3C018014 */  lui   $at, %hi(D_8013A184)
/* AC6D7C 8004FBDC 46062200 */  add.s $f8, $f4, $f6
/* AC6D80 8004FBE0 C430A184 */  lwc1  $f16, %lo(D_8013A184)($at)
/* AC6D84 8004FBE4 27A4006C */  addiu $a0, $sp, 0x6c
/* AC6D88 8004FBE8 260500E4 */  addiu $a1, $s0, 0xe4
/* AC6D8C 8004FBEC E7A80070 */  swc1  $f8, 0x70($sp)
/* AC6D90 8004FBF0 C6000008 */  lwc1  $f0, 8($s0)
/* AC6D94 8004FBF4 E7B00010 */  swc1  $f16, 0x10($sp)
/* AC6D98 8004FBF8 44060000 */  mfc1  $a2, $f0
/* AC6D9C 8004FBFC 44070000 */  mfc1  $a3, $f0
/* AC6DA0 8004FC00 0C010E8F */  jal   func_80043A3C
/* AC6DA4 8004FC04 00000000 */   nop
/* AC6DA8 8004FC08 26030094 */  addiu $v1, $s0, 0x94
/* AC6DAC 8004FC0C C4720000 */  lwc1  $f18, ($v1)
/* AC6DB0 8004FC10 C60A00E4 */  lwc1  $f10, 0xe4($s0)
/* AC6DB4 8004FC14 02002025 */  move  $a0, $s0
/* AC6DB8 8004FC18 460A9100 */  add.s $f4, $f18, $f10
/* AC6DBC 8004FC1C E7A40078 */  swc1  $f4, 0x78($sp)
/* AC6DC0 8004FC20 C60800E8 */  lwc1  $f8, 0xe8($s0)
/* AC6DC4 8004FC24 C4660004 */  lwc1  $f6, 4($v1)
/* AC6DC8 8004FC28 46083400 */  add.s $f16, $f6, $f8
/* AC6DCC 8004FC2C E7B0007C */  swc1  $f16, 0x7c($sp)
/* AC6DD0 8004FC30 C60A00EC */  lwc1  $f10, 0xec($s0)
/* AC6DD4 8004FC34 C4720008 */  lwc1  $f18, 8($v1)
/* AC6DD8 8004FC38 460A9100 */  add.s $f4, $f18, $f10
/* AC6DDC 8004FC3C E7A40080 */  swc1  $f4, 0x80($sp)
/* AC6DE0 8004FC40 8602015E */  lh    $v0, 0x15e($s0)
/* AC6DE4 8004FC44 14400024 */  bnez  $v0, .L8004FCD8
/* AC6DE8 8004FC48 24490001 */   addiu $t1, $v0, 1
/* AC6DEC 8004FC4C A609015E */  sh    $t1, 0x15e($s0)
/* AC6DF0 8004FC50 0C010ED8 */  jal   func_80043B60
/* AC6DF4 8004FC54 AFA30030 */   sw    $v1, 0x30($sp)
/* AC6DF8 8004FC58 86080010 */  lh    $t0, 0x10($s0)
/* AC6DFC 8004FC5C 8FA30030 */  lw    $v1, 0x30($sp)
/* AC6E00 8004FC60 310A0001 */  andi  $t2, $t0, 1
/* AC6E04 8004FC64 5540001D */  bnezl $t2, .L8004FCDC
/* AC6E08 8004FC68 C6000008 */   lwc1  $f0, 8($s0)
/* AC6E0C 8004FC6C 8E2C0000 */  lw    $t4, ($s1)
/* AC6E10 8004FC70 27A20040 */  addiu $v0, $sp, 0x40
/* AC6E14 8004FC74 27A90078 */  addiu $t1, $sp, 0x78
/* AC6E18 8004FC78 AC4C0000 */  sw    $t4, ($v0)
/* AC6E1C 8004FC7C 8E2B0004 */  lw    $t3, 4($s1)
/* AC6E20 8004FC80 8C4E0000 */  lw    $t6, ($v0)
/* AC6E24 8004FC84 AC4B0004 */  sw    $t3, 4($v0)
/* AC6E28 8004FC88 8E2C0008 */  lw    $t4, 8($s1)
/* AC6E2C 8004FC8C AC4C0008 */  sw    $t4, 8($v0)
/* AC6E30 8004FC90 AE0E0074 */  sw    $t6, 0x74($s0)
/* AC6E34 8004FC94 8C4D0004 */  lw    $t5, 4($v0)
/* AC6E38 8004FC98 AE0D0078 */  sw    $t5, 0x78($s0)
/* AC6E3C 8004FC9C 8C4E0008 */  lw    $t6, 8($v0)
/* AC6E40 8004FCA0 AE0E007C */  sw    $t6, 0x7c($s0)
/* AC6E44 8004FCA4 8C590000 */  lw    $t9, ($v0)
/* AC6E48 8004FCA8 8FAF003C */  lw    $t7, 0x3c($sp)
/* AC6E4C 8004FCAC ADF90000 */  sw    $t9, ($t7)
/* AC6E50 8004FCB0 8C580004 */  lw    $t8, 4($v0)
/* AC6E54 8004FCB4 ADF80004 */  sw    $t8, 4($t7)
/* AC6E58 8004FCB8 8C590008 */  lw    $t9, 8($v0)
/* AC6E5C 8004FCBC ADF90008 */  sw    $t9, 8($t7)
/* AC6E60 8004FCC0 8D2A0000 */  lw    $t2, ($t1)
/* AC6E64 8004FCC4 AE0A0050 */  sw    $t2, 0x50($s0)
/* AC6E68 8004FCC8 8D280004 */  lw    $t0, 4($t1)
/* AC6E6C 8004FCCC AE080054 */  sw    $t0, 0x54($s0)
/* AC6E70 8004FCD0 8D2A0008 */  lw    $t2, 8($t1)
/* AC6E74 8004FCD4 AE0A0058 */  sw    $t2, 0x58($s0)
.L8004FCD8:
/* AC6E78 8004FCD8 C6000008 */  lwc1  $f0, 8($s0)
.L8004FCDC:
/* AC6E7C 8004FCDC 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AC6E80 8004FCE0 44813000 */  mtc1  $at, $f6
/* AC6E84 8004FCE4 26050050 */  addiu $a1, $s0, 0x50
/* AC6E88 8004FCE8 260B0074 */  addiu $t3, $s0, 0x74
/* AC6E8C 8004FCEC 44060000 */  mfc1  $a2, $f0
/* AC6E90 8004FCF0 44070000 */  mfc1  $a3, $f0
/* AC6E94 8004FCF4 AFAB0034 */  sw    $t3, 0x34($sp)
/* AC6E98 8004FCF8 AFA50038 */  sw    $a1, 0x38($sp)
/* AC6E9C 8004FCFC AFA30030 */  sw    $v1, 0x30($sp)
/* AC6EA0 8004FD00 27A40078 */  addiu $a0, $sp, 0x78
/* AC6EA4 8004FD04 0C010E8F */  jal   func_80043A3C
/* AC6EA8 8004FD08 E7A60010 */   swc1  $f6, 0x10($sp)
/* AC6EAC 8004FD0C C6000004 */  lwc1  $f0, 4($s0)
/* AC6EB0 8004FD10 3C018014 */  lui   $at, %hi(D_8013A188)
/* AC6EB4 8004FD14 C428A188 */  lwc1  $f8, %lo(D_8013A188)($at)
/* AC6EB8 8004FD18 44060000 */  mfc1  $a2, $f0
/* AC6EBC 8004FD1C 44070000 */  mfc1  $a3, $f0
/* AC6EC0 8004FD20 02202025 */  move  $a0, $s1
/* AC6EC4 8004FD24 8FA50034 */  lw    $a1, 0x34($sp)
/* AC6EC8 8004FD28 0C010E8F */  jal   func_80043A3C
/* AC6ECC 8004FD2C E7A80010 */   swc1  $f8, 0x10($sp)
/* AC6ED0 8004FD30 8FAD0034 */  lw    $t5, 0x34($sp)
/* AC6ED4 8004FD34 8FAC003C */  lw    $t4, 0x3c($sp)
/* AC6ED8 8004FD38 8DAF0000 */  lw    $t7, ($t5)
/* AC6EDC 8004FD3C AD8F0000 */  sw    $t7, ($t4)
/* AC6EE0 8004FD40 8DAE0004 */  lw    $t6, 4($t5)
/* AC6EE4 8004FD44 AD8E0004 */  sw    $t6, 4($t4)
/* AC6EE8 8004FD48 8DAF0008 */  lw    $t7, 8($t5)
/* AC6EEC 8004FD4C AD8F0008 */  sw    $t7, 8($t4)
/* AC6EF0 8004FD50 8FA5003C */  lw    $a1, 0x3c($sp)
/* AC6EF4 8004FD54 0C01EFE4 */  jal   OLib_Vec3fDist
/* AC6EF8 8004FD58 8FA40038 */   lw    $a0, 0x38($sp)
/* AC6EFC 8004FD5C 44808000 */  mtc1  $zero, $f16
/* AC6F00 8004FD60 E60000DC */  swc1  $f0, 0xdc($s0)
/* AC6F04 8004FD64 A600015A */  sh    $zero, 0x15a($s0)
/* AC6F08 8004FD68 E61000D8 */  swc1  $f16, 0xd8($s0)
/* AC6F0C 8004FD6C 8638000C */  lh    $t8, 0xc($s1)
/* AC6F10 8004FD70 3C018014 */  lui   $at, %hi(D_8013A18C)
/* AC6F14 8004FD74 C424A18C */  lwc1  $f4, %lo(D_8013A18C)($at)
/* AC6F18 8004FD78 44989000 */  mtc1  $t8, $f18
/* AC6F1C 8004FD7C 02002025 */  move  $a0, $s0
/* AC6F20 8004FD80 3C053F80 */  lui   $a1, 0x3f80
/* AC6F24 8004FD84 468092A0 */  cvt.s.w $f10, $f18
/* AC6F28 8004FD88 46045182 */  mul.s $f6, $f10, $f4
/* AC6F2C 8004FD8C 0C011429 */  jal   func_800450A4
/* AC6F30 8004FD90 E60600FC */   swc1  $f6, 0xfc($s0)
/* AC6F34 8004FD94 8FA30030 */  lw    $v1, 0x30($sp)
/* AC6F38 8004FD98 E6000100 */  swc1  $f0, 0x100($s0)
/* AC6F3C 8004FD9C C6080050 */  lwc1  $f8, 0x50($s0)
/* AC6F40 8004FDA0 C4700000 */  lwc1  $f16, ($v1)
/* AC6F44 8004FDA4 C60A0054 */  lwc1  $f10, 0x54($s0)
/* AC6F48 8004FDA8 24020001 */  li    $v0, 1
/* AC6F4C 8004FDAC 46104481 */  sub.s $f18, $f8, $f16
/* AC6F50 8004FDB0 C6080058 */  lwc1  $f8, 0x58($s0)
/* AC6F54 8004FDB4 E61200E4 */  swc1  $f18, 0xe4($s0)
/* AC6F58 8004FDB8 C4640004 */  lwc1  $f4, 4($v1)
/* AC6F5C 8004FDBC 46045181 */  sub.s $f6, $f10, $f4
/* AC6F60 8004FDC0 E60600E8 */  swc1  $f6, 0xe8($s0)
/* AC6F64 8004FDC4 C4700008 */  lwc1  $f16, 8($v1)
/* AC6F68 8004FDC8 46104481 */  sub.s $f18, $f8, $f16
/* AC6F6C 8004FDCC E61200EC */  swc1  $f18, 0xec($s0)
/* AC6F70 8004FDD0 8FBF0024 */  lw    $ra, 0x24($sp)
/* AC6F74 8004FDD4 8FB10020 */  lw    $s1, 0x20($sp)
/* AC6F78 8004FDD8 8FB0001C */  lw    $s0, 0x1c($sp)
/* AC6F7C 8004FDDC 03E00008 */  jr    $ra
/* AC6F80 8004FDE0 27BD0090 */   addiu $sp, $sp, 0x90
