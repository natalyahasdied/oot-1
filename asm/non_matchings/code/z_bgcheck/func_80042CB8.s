.late_rodata
glabel D_80138FC8
    .float 0.00003051851
    
.text
glabel func_80042CB8
/* AB9E58 80042CB8 27BDFF98 */  addiu $sp, $sp, -0x68
/* AB9E5C 80042CBC AFBF002C */  sw    $ra, 0x2c($sp)
/* AB9E60 80042CC0 AFB00028 */  sw    $s0, 0x28($sp)
/* AB9E64 80042CC4 AFA40068 */  sw    $a0, 0x68($sp)
/* AB9E68 80042CC8 AFA5006C */  sw    $a1, 0x6c($sp)
/* AB9E6C 80042CCC AFA70074 */  sw    $a3, 0x74($sp)
/* AB9E70 80042CD0 94CE0002 */  lhu   $t6, 2($a2)
/* AB9E74 80042CD4 8CA80000 */  lw    $t0, ($a1)
/* AB9E78 80042CD8 00C08025 */  move  $s0, $a2
/* AB9E7C 80042CDC 31CF1FFF */  andi  $t7, $t6, 0x1fff
/* AB9E80 80042CE0 000FC080 */  sll   $t8, $t7, 2
/* AB9E84 80042CE4 8D090010 */  lw    $t1, 0x10($t0)
/* AB9E88 80042CE8 030FC023 */  subu  $t8, $t8, $t7
/* AB9E8C 80042CEC 0018C040 */  sll   $t8, $t8, 1
/* AB9E90 80042CF0 27A5005C */  addiu $a1, $sp, 0x5c
/* AB9E94 80042CF4 0C00E22A */  jal   T_BGCheck_Vec3sToVec3f
/* AB9E98 80042CF8 03092021 */   addu  $a0, $t8, $t1
/* AB9E9C 80042CFC 8FAD006C */  lw    $t5, 0x6c($sp)
/* AB9EA0 80042D00 960A0004 */  lhu   $t2, 4($s0)
/* AB9EA4 80042D04 27A50050 */  addiu $a1, $sp, 0x50
/* AB9EA8 80042D08 8DAE0000 */  lw    $t6, ($t5)
/* AB9EAC 80042D0C 314B1FFF */  andi  $t3, $t2, 0x1fff
/* AB9EB0 80042D10 000B6080 */  sll   $t4, $t3, 2
/* AB9EB4 80042D14 8DCF0010 */  lw    $t7, 0x10($t6)
/* AB9EB8 80042D18 018B6023 */  subu  $t4, $t4, $t3
/* AB9EBC 80042D1C 000C6040 */  sll   $t4, $t4, 1
/* AB9EC0 80042D20 0C00E22A */  jal   T_BGCheck_Vec3sToVec3f
/* AB9EC4 80042D24 018F2021 */   addu  $a0, $t4, $t7
/* AB9EC8 80042D28 8FB8006C */  lw    $t8, 0x6c($sp)
/* AB9ECC 80042D2C 96190006 */  lhu   $t9, 6($s0)
/* AB9ED0 80042D30 27A50044 */  addiu $a1, $sp, 0x44
/* AB9ED4 80042D34 8F090000 */  lw    $t1, ($t8)
/* AB9ED8 80042D38 00194080 */  sll   $t0, $t9, 2
/* AB9EDC 80042D3C 01194023 */  subu  $t0, $t0, $t9
/* AB9EE0 80042D40 8D2A0010 */  lw    $t2, 0x10($t1)
/* AB9EE4 80042D44 00084040 */  sll   $t0, $t0, 1
/* AB9EE8 80042D48 0C00E22A */  jal   T_BGCheck_Vec3sToVec3f
/* AB9EEC 80042D4C 010A2021 */   addu  $a0, $t0, $t2
/* AB9EF0 80042D50 3C028016 */  lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* AB9EF4 80042D54 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* AB9EF8 80042D58 27A5005C */  addiu $a1, $sp, 0x5c
/* AB9EFC 80042D5C 27A60050 */  addiu $a2, $sp, 0x50
/* AB9F00 80042D60 84430E88 */  lh    $v1, 0xe88($v0)
/* AB9F04 80042D64 27A70044 */  addiu $a3, $sp, 0x44
/* AB9F08 80042D68 50600056 */  beql  $v1, $zero, .L80042EC4
/* AB9F0C 80042D6C 8FAD0068 */   lw    $t5, 0x68($sp)
/* AB9F10 80042D70 860B0008 */  lh    $t3, 8($s0)
/* AB9F14 80042D74 860D000A */  lh    $t5, 0xa($s0)
/* AB9F18 80042D78 860E000C */  lh    $t6, 0xc($s0)
/* AB9F1C 80042D7C 448B2000 */  mtc1  $t3, $f4
/* AB9F20 80042D80 448D4000 */  mtc1  $t5, $f8
/* AB9F24 80042D84 3C018014 */  lui   $at, %hi(D_80138FC8)
/* AB9F28 80042D88 468021A0 */  cvt.s.w $f6, $f4
/* AB9F2C 80042D8C C42E8FC8 */  lwc1  $f14, %lo(D_80138FC8)($at)
/* AB9F30 80042D90 448E8000 */  mtc1  $t6, $f16
/* AB9F34 80042D94 C7A4005C */  lwc1  $f4, 0x5c($sp)
/* AB9F38 80042D98 468042A0 */  cvt.s.w $f10, $f8
/* AB9F3C 80042D9C 460E3002 */  mul.s $f0, $f6, $f14
/* AB9F40 80042DA0 44833000 */  mtc1  $v1, $f6
/* AB9F44 80042DA4 460E5082 */  mul.s $f2, $f10, $f14
/* AB9F48 80042DA8 468084A0 */  cvt.s.w $f18, $f16
/* AB9F4C 80042DAC 46803220 */  cvt.s.w $f8, $f6
/* AB9F50 80042DB0 460E9302 */  mul.s $f12, $f18, $f14
/* AB9F54 80042DB4 C7B20060 */  lwc1  $f18, 0x60($sp)
/* AB9F58 80042DB8 46004282 */  mul.s $f10, $f8, $f0
/* AB9F5C 80042DBC 460A2400 */  add.s $f16, $f4, $f10
/* AB9F60 80042DC0 E7B0005C */  swc1  $f16, 0x5c($sp)
/* AB9F64 80042DC4 844C0E88 */  lh    $t4, 0xe88($v0)
/* AB9F68 80042DC8 C7B00064 */  lwc1  $f16, 0x64($sp)
/* AB9F6C 80042DCC 448C3000 */  mtc1  $t4, $f6
/* AB9F70 80042DD0 00000000 */  nop   
/* AB9F74 80042DD4 46803220 */  cvt.s.w $f8, $f6
/* AB9F78 80042DD8 46024102 */  mul.s $f4, $f8, $f2
/* AB9F7C 80042DDC 46049280 */  add.s $f10, $f18, $f4
/* AB9F80 80042DE0 E7AA0060 */  swc1  $f10, 0x60($sp)
/* AB9F84 80042DE4 844F0E88 */  lh    $t7, 0xe88($v0)
/* AB9F88 80042DE8 C7AA0050 */  lwc1  $f10, 0x50($sp)
/* AB9F8C 80042DEC 448F3000 */  mtc1  $t7, $f6
/* AB9F90 80042DF0 00000000 */  nop   
/* AB9F94 80042DF4 46803220 */  cvt.s.w $f8, $f6
/* AB9F98 80042DF8 460C4482 */  mul.s $f18, $f8, $f12
/* AB9F9C 80042DFC 46128100 */  add.s $f4, $f16, $f18
/* AB9FA0 80042E00 E7A40064 */  swc1  $f4, 0x64($sp)
/* AB9FA4 80042E04 84590E88 */  lh    $t9, 0xe88($v0)
/* AB9FA8 80042E08 C7A40054 */  lwc1  $f4, 0x54($sp)
/* AB9FAC 80042E0C 44993000 */  mtc1  $t9, $f6
/* AB9FB0 80042E10 00000000 */  nop   
/* AB9FB4 80042E14 46803220 */  cvt.s.w $f8, $f6
/* AB9FB8 80042E18 46004402 */  mul.s $f16, $f8, $f0
/* AB9FBC 80042E1C 46105480 */  add.s $f18, $f10, $f16
/* AB9FC0 80042E20 E7B20050 */  swc1  $f18, 0x50($sp)
/* AB9FC4 80042E24 84580E88 */  lh    $t8, 0xe88($v0)
/* AB9FC8 80042E28 C7B20058 */  lwc1  $f18, 0x58($sp)
/* AB9FCC 80042E2C 44983000 */  mtc1  $t8, $f6
/* AB9FD0 80042E30 00000000 */  nop   
/* AB9FD4 80042E34 46803220 */  cvt.s.w $f8, $f6
/* AB9FD8 80042E38 46024282 */  mul.s $f10, $f8, $f2
/* AB9FDC 80042E3C 460A2400 */  add.s $f16, $f4, $f10
/* AB9FE0 80042E40 E7B00054 */  swc1  $f16, 0x54($sp)
/* AB9FE4 80042E44 84490E88 */  lh    $t1, 0xe88($v0)
/* AB9FE8 80042E48 C7B00044 */  lwc1  $f16, 0x44($sp)
/* AB9FEC 80042E4C 44893000 */  mtc1  $t1, $f6
/* AB9FF0 80042E50 00000000 */  nop   
/* AB9FF4 80042E54 46803220 */  cvt.s.w $f8, $f6
/* AB9FF8 80042E58 460C4102 */  mul.s $f4, $f8, $f12
/* AB9FFC 80042E5C 46049280 */  add.s $f10, $f18, $f4
/* ABA000 80042E60 E7AA0058 */  swc1  $f10, 0x58($sp)
/* ABA004 80042E64 84480E88 */  lh    $t0, 0xe88($v0)
/* ABA008 80042E68 C7AA0048 */  lwc1  $f10, 0x48($sp)
/* ABA00C 80042E6C 44883000 */  mtc1  $t0, $f6
/* ABA010 80042E70 00000000 */  nop   
/* ABA014 80042E74 46803220 */  cvt.s.w $f8, $f6
/* ABA018 80042E78 46004482 */  mul.s $f18, $f8, $f0
/* ABA01C 80042E7C 46128100 */  add.s $f4, $f16, $f18
/* ABA020 80042E80 E7A40044 */  swc1  $f4, 0x44($sp)
/* ABA024 80042E84 844A0E88 */  lh    $t2, 0xe88($v0)
/* ABA028 80042E88 C7A4004C */  lwc1  $f4, 0x4c($sp)
/* ABA02C 80042E8C 448A3000 */  mtc1  $t2, $f6
/* ABA030 80042E90 00000000 */  nop   
/* ABA034 80042E94 46803220 */  cvt.s.w $f8, $f6
/* ABA038 80042E98 46024402 */  mul.s $f16, $f8, $f2
/* ABA03C 80042E9C 46105480 */  add.s $f18, $f10, $f16
/* ABA040 80042EA0 E7B20048 */  swc1  $f18, 0x48($sp)
/* ABA044 80042EA4 844B0E88 */  lh    $t3, 0xe88($v0)
/* ABA048 80042EA8 448B3000 */  mtc1  $t3, $f6
/* ABA04C 80042EAC 00000000 */  nop   
/* ABA050 80042EB0 46803220 */  cvt.s.w $f8, $f6
/* ABA054 80042EB4 460C4282 */  mul.s $f10, $f8, $f12
/* ABA058 80042EB8 460A2400 */  add.s $f16, $f4, $f10
/* ABA05C 80042EBC E7B0004C */  swc1  $f16, 0x4c($sp)
/* ABA060 80042EC0 8FAD0068 */  lw    $t5, 0x68($sp)
.L80042EC4:
/* ABA064 80042EC4 93AE0077 */  lbu   $t6, 0x77($sp)
/* ABA068 80042EC8 93AC007B */  lbu   $t4, 0x7b($sp)
/* ABA06C 80042ECC 93AF007F */  lbu   $t7, 0x7f($sp)
/* ABA070 80042ED0 8DA40000 */  lw    $a0, ($t5)
/* ABA074 80042ED4 AFAE0010 */  sw    $t6, 0x10($sp)
/* ABA078 80042ED8 AFAC0014 */  sw    $t4, 0x14($sp)
/* ABA07C 80042EDC 0C016CAB */  jal   func_8005B2AC
/* ABA080 80042EE0 AFAF0018 */   sw    $t7, 0x18($sp)
/* ABA084 80042EE4 8FBF002C */  lw    $ra, 0x2c($sp)
/* ABA088 80042EE8 8FB00028 */  lw    $s0, 0x28($sp)
/* ABA08C 80042EEC 27BD0068 */  addiu $sp, $sp, 0x68
/* ABA090 80042EF0 03E00008 */  jr    $ra
/* ABA094 80042EF4 00000000 */   nop   

