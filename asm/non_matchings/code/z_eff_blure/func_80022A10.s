.rdata
glabel D_801353B8
    .asciz "ブラ─表示:頂点確保できず。強制終了\n"
    # EUC-JP: ブラ─表示:頂点確保できず。強制終了 | Blue display: Vertex cannot be secured. forced termination
    .balign 4

glabel D_801353E0
    .asciz "../z_eff_blure.c"
    .balign 4

glabel D_801353F4
    .asciz "ブラ─表示:頂点テーブル確保できず\n"
    # EUC-JP:  ブラ─表示:頂点テーブル確保できず | Bra display: Vertex table could not be secured
    .balign 4

glabel D_80135418
    .asciz "../z_eff_blure.c"
    .balign 4

.text
glabel func_80022A10
/* A99BB0 80022A10 27BDFF68 */  addiu $sp, $sp, -0x98
/* A99BB4 80022A14 AFBF004C */  sw    $ra, 0x4c($sp)
/* A99BB8 80022A18 AFBE0048 */  sw    $fp, 0x48($sp)
/* A99BBC 80022A1C AFB70044 */  sw    $s7, 0x44($sp)
/* A99BC0 80022A20 AFB60040 */  sw    $s6, 0x40($sp)
/* A99BC4 80022A24 AFB5003C */  sw    $s5, 0x3c($sp)
/* A99BC8 80022A28 AFB40038 */  sw    $s4, 0x38($sp)
/* A99BCC 80022A2C AFB30034 */  sw    $s3, 0x34($sp)
/* A99BD0 80022A30 AFB20030 */  sw    $s2, 0x30($sp)
/* A99BD4 80022A34 AFB1002C */  sw    $s1, 0x2c($sp)
/* A99BD8 80022A38 AFB00028 */  sw    $s0, 0x28($sp)
/* A99BDC 80022A3C AFA5009C */  sw    $a1, 0x9c($sp)
/* A99BE0 80022A40 9082019E */  lbu   $v0, 0x19e($a0)
/* A99BE4 80022A44 0080A025 */  move  $s4, $a0
/* A99BE8 80022A48 0080B025 */  move  $s6, $a0
/* A99BEC 80022A4C 28410002 */  slti  $at, $v0, 2
/* A99BF0 80022A50 14200127 */  bnez  $at, .L80022EF0
/* A99BF4 80022A54 0002B880 */   sll   $s7, $v0, 2
/* A99BF8 80022A58 00A02025 */  move  $a0, $a1
/* A99BFC 80022A5C 0C031A73 */  jal   Graph_Alloc
/* A99C00 80022A60 00172900 */   sll   $a1, $s7, 4
/* A99C04 80022A64 14400006 */  bnez  $v0, .L80022A80
/* A99C08 80022A68 0040A825 */   move  $s5, $v0
/* A99C0C 80022A6C 3C048013 */  lui   $a0, %hi(D_801353B8) # $a0, 0x8013
/* A99C10 80022A70 0C00084C */  jal   osSyncPrintf
/* A99C14 80022A74 248453B8 */   addiu $a0, %lo(D_801353B8) # addiu $a0, $a0, 0x53b8
/* A99C18 80022A78 1000011E */  b     .L80022EF4
/* A99C1C 80022A7C 8FBF004C */   lw    $ra, 0x4c($sp)
.L80022A80:
/* A99C20 80022A80 3C0E8011 */  lui   $t6, %hi(D_8011578C) # $t6, 0x8011
/* A99C24 80022A84 25CE578C */  addiu $t6, %lo(D_8011578C) # addiu $t6, $t6, 0x578c
/* A99C28 80022A88 89D80000 */  lwl   $t8, ($t6)
/* A99C2C 80022A8C 99D80003 */  lwr   $t8, 3($t6)
/* A99C30 80022A90 3C198011 */  lui   $t9, %hi(D_8011579C) # $t9, 0x8011
/* A99C34 80022A94 2739579C */  addiu $t9, %lo(D_8011579C) # addiu $t9, $t9, 0x579c
/* A99C38 80022A98 A8580000 */  swl   $t8, ($v0)
/* A99C3C 80022A9C B8580003 */  swr   $t8, 3($v0)
/* A99C40 80022AA0 89CF0004 */  lwl   $t7, 4($t6)
/* A99C44 80022AA4 99CF0007 */  lwr   $t7, 7($t6)
/* A99C48 80022AA8 00401825 */  move  $v1, $v0
/* A99C4C 80022AAC 3C0B8011 */  lui   $t3, %hi(D_801157AC) # $t3, 0x8011
/* A99C50 80022AB0 A84F0004 */  swl   $t7, 4($v0)
/* A99C54 80022AB4 B84F0007 */  swr   $t7, 7($v0)
/* A99C58 80022AB8 89D80008 */  lwl   $t8, 8($t6)
/* A99C5C 80022ABC 99D8000B */  lwr   $t8, 0xb($t6)
/* A99C60 80022AC0 256B57AC */  addiu $t3, %lo(D_801157AC) # addiu $t3, $t3, 0x57ac
/* A99C64 80022AC4 24630040 */  addiu $v1, $v1, 0x40
/* A99C68 80022AC8 A8580008 */  swl   $t8, 8($v0)
/* A99C6C 80022ACC B858000B */  swr   $t8, 0xb($v0)
/* A99C70 80022AD0 89CF000C */  lwl   $t7, 0xc($t6)
/* A99C74 80022AD4 99CF000F */  lwr   $t7, 0xf($t6)
/* A99C78 80022AD8 3C0E8011 */  lui   $t6, %hi(D_801157BC) # $t6, 0x8011
/* A99C7C 80022ADC 25CE57BC */  addiu $t6, %lo(D_801157BC) # addiu $t6, $t6, 0x57bc
/* A99C80 80022AE0 A84F000C */  swl   $t7, 0xc($v0)
/* A99C84 80022AE4 B84F000F */  swr   $t7, 0xf($v0)
/* A99C88 80022AE8 8B2A0000 */  lwl   $t2, ($t9)
/* A99C8C 80022AEC 9B2A0003 */  lwr   $t2, 3($t9)
/* A99C90 80022AF0 24080018 */  li    $t0, 24
/* A99C94 80022AF4 2410FFFE */  li    $s0, -2
/* A99C98 80022AF8 A86AFFD0 */  swl   $t2, -0x30($v1)
/* A99C9C 80022AFC B86AFFD3 */  swr   $t2, -0x2d($v1)
/* A99CA0 80022B00 8B290004 */  lwl   $t1, 4($t9)
/* A99CA4 80022B04 9B290007 */  lwr   $t1, 7($t9)
/* A99CA8 80022B08 2412FFFF */  li    $s2, -1
/* A99CAC 80022B0C 02809825 */  move  $s3, $s4
/* A99CB0 80022B10 A869FFD4 */  swl   $t1, -0x2c($v1)
/* A99CB4 80022B14 B869FFD7 */  swr   $t1, -0x29($v1)
/* A99CB8 80022B18 8B2A0008 */  lwl   $t2, 8($t9)
/* A99CBC 80022B1C 9B2A000B */  lwr   $t2, 0xb($t9)
/* A99CC0 80022B20 A86AFFD8 */  swl   $t2, -0x28($v1)
/* A99CC4 80022B24 B86AFFDB */  swr   $t2, -0x25($v1)
/* A99CC8 80022B28 8B29000C */  lwl   $t1, 0xc($t9)
/* A99CCC 80022B2C 9B29000F */  lwr   $t1, 0xf($t9)
/* A99CD0 80022B30 A869FFDC */  swl   $t1, -0x24($v1)
/* A99CD4 80022B34 B869FFDF */  swr   $t1, -0x21($v1)
/* A99CD8 80022B38 896D0000 */  lwl   $t5, ($t3)
/* A99CDC 80022B3C 996D0003 */  lwr   $t5, 3($t3)
/* A99CE0 80022B40 A86DFFE0 */  swl   $t5, -0x20($v1)
/* A99CE4 80022B44 B86DFFE3 */  swr   $t5, -0x1d($v1)
/* A99CE8 80022B48 896C0004 */  lwl   $t4, 4($t3)
/* A99CEC 80022B4C 996C0007 */  lwr   $t4, 7($t3)
/* A99CF0 80022B50 A86CFFE4 */  swl   $t4, -0x1c($v1)
/* A99CF4 80022B54 B86CFFE7 */  swr   $t4, -0x19($v1)
/* A99CF8 80022B58 896D0008 */  lwl   $t5, 8($t3)
/* A99CFC 80022B5C 996D000B */  lwr   $t5, 0xb($t3)
/* A99D00 80022B60 A86DFFE8 */  swl   $t5, -0x18($v1)
/* A99D04 80022B64 B86DFFEB */  swr   $t5, -0x15($v1)
/* A99D08 80022B68 896C000C */  lwl   $t4, 0xc($t3)
/* A99D0C 80022B6C 996C000F */  lwr   $t4, 0xf($t3)
/* A99D10 80022B70 A86CFFEC */  swl   $t4, -0x14($v1)
/* A99D14 80022B74 B86CFFEF */  swr   $t4, -0x11($v1)
/* A99D18 80022B78 89D80000 */  lwl   $t8, ($t6)
/* A99D1C 80022B7C 99D80003 */  lwr   $t8, 3($t6)
/* A99D20 80022B80 A878FFF0 */  swl   $t8, -0x10($v1)
/* A99D24 80022B84 B878FFF3 */  swr   $t8, -0xd($v1)
/* A99D28 80022B88 89CF0004 */  lwl   $t7, 4($t6)
/* A99D2C 80022B8C 99CF0007 */  lwr   $t7, 7($t6)
/* A99D30 80022B90 A86FFFF4 */  swl   $t7, -0xc($v1)
/* A99D34 80022B94 B86FFFF7 */  swr   $t7, -9($v1)
/* A99D38 80022B98 89D80008 */  lwl   $t8, 8($t6)
/* A99D3C 80022B9C 99D8000B */  lwr   $t8, 0xb($t6)
/* A99D40 80022BA0 A878FFF8 */  swl   $t8, -8($v1)
/* A99D44 80022BA4 B878FFFB */  swr   $t8, -5($v1)
/* A99D48 80022BA8 89CF000C */  lwl   $t7, 0xc($t6)
/* A99D4C 80022BAC 99CF000F */  lwr   $t7, 0xf($t6)
/* A99D50 80022BB0 A86FFFFC */  swl   $t7, -4($v1)
/* A99D54 80022BB4 B86FFFFF */  swr   $t7, -1($v1)
/* A99D58 80022BB8 9284019E */  lbu   $a0, 0x19e($s4)
/* A99D5C 80022BBC 28810002 */  slti  $at, $a0, 2
/* A99D60 80022BC0 1420005C */  bnez  $at, .L80022D34
/* A99D64 80022BC4 00801025 */   move  $v0, $a0
/* A99D68 80022BC8 00880019 */  multu $a0, $t0
/* A99D6C 80022BCC 3C048011 */  lui   $a0, %hi(D_801157DC) # $a0, 0x8011
/* A99D70 80022BD0 3C068011 */  lui   $a2, %hi(D_801157FC) # $a2, 0x8011
/* A99D74 80022BD4 3C058011 */  lui   $a1, %hi(D_801157EC) # $a1, 0x8011
/* A99D78 80022BD8 24A557EC */  addiu $a1, %lo(D_801157EC) # addiu $a1, $a1, 0x57ec
/* A99D7C 80022BDC 24C657FC */  addiu $a2, %lo(D_801157FC) # addiu $a2, $a2, 0x57fc
/* A99D80 80022BE0 248457DC */  addiu $a0, %lo(D_801157DC) # addiu $a0, $a0, 0x57dc
/* A99D84 80022BE4 02803825 */  move  $a3, $s4
/* A99D88 80022BE8 0000C812 */  mflo  $t9
/* A99D8C 80022BEC 02994821 */  addu  $t1, $s4, $t9
/* A99D90 80022BF0 252AFFD0 */  addiu $t2, $t1, -0x30
/* A99D94 80022BF4 028A082B */  sltu  $at, $s4, $t2
/* A99D98 80022BF8 1020004E */  beqz  $at, .L80022D34
/* A99D9C 80022BFC 00000000 */   nop   
/* A99DA0 80022C00 3C028011 */  lui   $v0, %hi(D_801157CC) # 0.000000
/* A99DA4 80022C04 244257CC */  addiu $v0, %lo(D_801157CC) # addiu $v0, $v0, 0x57cc
/* A99DA8 80022C08 884C0000 */  lwl   $t4, ($v0)
.L80022C0C:
/* A99DAC 80022C0C 984C0003 */  lwr   $t4, 3($v0)
/* A99DB0 80022C10 24E70018 */  addiu $a3, $a3, 0x18
/* A99DB4 80022C14 24630040 */  addiu $v1, $v1, 0x40
/* A99DB8 80022C18 A86CFFC0 */  swl   $t4, -0x40($v1)
/* A99DBC 80022C1C B86CFFC3 */  swr   $t4, -0x3d($v1)
/* A99DC0 80022C20 884B0004 */  lwl   $t3, 4($v0)
/* A99DC4 80022C24 984B0007 */  lwr   $t3, 7($v0)
/* A99DC8 80022C28 A86BFFC4 */  swl   $t3, -0x3c($v1)
/* A99DCC 80022C2C B86BFFC7 */  swr   $t3, -0x39($v1)
/* A99DD0 80022C30 884C0008 */  lwl   $t4, 8($v0)
/* A99DD4 80022C34 984C000B */  lwr   $t4, 0xb($v0)
/* A99DD8 80022C38 A86CFFC8 */  swl   $t4, -0x38($v1)
/* A99DDC 80022C3C B86CFFCB */  swr   $t4, -0x35($v1)
/* A99DE0 80022C40 884B000C */  lwl   $t3, 0xc($v0)
/* A99DE4 80022C44 984B000F */  lwr   $t3, 0xf($v0)
/* A99DE8 80022C48 A86BFFCC */  swl   $t3, -0x34($v1)
/* A99DEC 80022C4C B86BFFCF */  swr   $t3, -0x31($v1)
/* A99DF0 80022C50 888E0000 */  lwl   $t6, ($a0)
/* A99DF4 80022C54 988E0003 */  lwr   $t6, 3($a0)
/* A99DF8 80022C58 A86EFFD0 */  swl   $t6, -0x30($v1)
/* A99DFC 80022C5C B86EFFD3 */  swr   $t6, -0x2d($v1)
/* A99E00 80022C60 888D0004 */  lwl   $t5, 4($a0)
/* A99E04 80022C64 988D0007 */  lwr   $t5, 7($a0)
/* A99E08 80022C68 A86DFFD4 */  swl   $t5, -0x2c($v1)
/* A99E0C 80022C6C B86DFFD7 */  swr   $t5, -0x29($v1)
/* A99E10 80022C70 888E0008 */  lwl   $t6, 8($a0)
/* A99E14 80022C74 988E000B */  lwr   $t6, 0xb($a0)
/* A99E18 80022C78 A86EFFD8 */  swl   $t6, -0x28($v1)
/* A99E1C 80022C7C B86EFFDB */  swr   $t6, -0x25($v1)
/* A99E20 80022C80 888D000C */  lwl   $t5, 0xc($a0)
/* A99E24 80022C84 988D000F */  lwr   $t5, 0xf($a0)
/* A99E28 80022C88 A86DFFDC */  swl   $t5, -0x24($v1)
/* A99E2C 80022C8C B86DFFDF */  swr   $t5, -0x21($v1)
/* A99E30 80022C90 88B80000 */  lwl   $t8, ($a1)
/* A99E34 80022C94 98B80003 */  lwr   $t8, 3($a1)
/* A99E38 80022C98 A878FFE0 */  swl   $t8, -0x20($v1)
/* A99E3C 80022C9C B878FFE3 */  swr   $t8, -0x1d($v1)
/* A99E40 80022CA0 88AF0004 */  lwl   $t7, 4($a1)
/* A99E44 80022CA4 98AF0007 */  lwr   $t7, 7($a1)
/* A99E48 80022CA8 A86FFFE4 */  swl   $t7, -0x1c($v1)
/* A99E4C 80022CAC B86FFFE7 */  swr   $t7, -0x19($v1)
/* A99E50 80022CB0 88B80008 */  lwl   $t8, 8($a1)
/* A99E54 80022CB4 98B8000B */  lwr   $t8, 0xb($a1)
/* A99E58 80022CB8 A878FFE8 */  swl   $t8, -0x18($v1)
/* A99E5C 80022CBC B878FFEB */  swr   $t8, -0x15($v1)
/* A99E60 80022CC0 88AF000C */  lwl   $t7, 0xc($a1)
/* A99E64 80022CC4 98AF000F */  lwr   $t7, 0xf($a1)
/* A99E68 80022CC8 A86FFFEC */  swl   $t7, -0x14($v1)
/* A99E6C 80022CCC B86FFFEF */  swr   $t7, -0x11($v1)
/* A99E70 80022CD0 88C90000 */  lwl   $t1, ($a2)
/* A99E74 80022CD4 98C90003 */  lwr   $t1, 3($a2)
/* A99E78 80022CD8 A869FFF0 */  swl   $t1, -0x10($v1)
/* A99E7C 80022CDC B869FFF3 */  swr   $t1, -0xd($v1)
/* A99E80 80022CE0 88D90004 */  lwl   $t9, 4($a2)
/* A99E84 80022CE4 98D90007 */  lwr   $t9, 7($a2)
/* A99E88 80022CE8 A879FFF4 */  swl   $t9, -0xc($v1)
/* A99E8C 80022CEC B879FFF7 */  swr   $t9, -9($v1)
/* A99E90 80022CF0 88C90008 */  lwl   $t1, 8($a2)
/* A99E94 80022CF4 98C9000B */  lwr   $t1, 0xb($a2)
/* A99E98 80022CF8 A869FFF8 */  swl   $t1, -8($v1)
/* A99E9C 80022CFC B869FFFB */  swr   $t1, -5($v1)
/* A99EA0 80022D00 88D9000C */  lwl   $t9, 0xc($a2)
/* A99EA4 80022D04 98D9000F */  lwr   $t9, 0xf($a2)
/* A99EA8 80022D08 A879FFFC */  swl   $t9, -4($v1)
/* A99EAC 80022D0C B879FFFF */  swr   $t9, -1($v1)
/* A99EB0 80022D10 92CA019E */  lbu   $t2, 0x19e($s6)
/* A99EB4 80022D14 01480019 */  multu $t2, $t0
/* A99EB8 80022D18 00005812 */  mflo  $t3
/* A99EBC 80022D1C 02CB6021 */  addu  $t4, $s6, $t3
/* A99EC0 80022D20 258DFFD0 */  addiu $t5, $t4, -0x30
/* A99EC4 80022D24 00ED082B */  sltu  $at, $a3, $t5
/* A99EC8 80022D28 5420FFB8 */  bnezl $at, .L80022C0C
/* A99ECC 80022D2C 884C0000 */   lwl   $t4, ($v0)
/* A99ED0 80022D30 9282019E */  lbu   $v0, 0x19e($s4)
.L80022D34:
/* A99ED4 80022D34 1840006A */  blez  $v0, .L80022EE0
/* A99ED8 80022D38 00008825 */   move  $s1, $zero
/* A99EDC 80022D3C 27BE0074 */  addiu $fp, $sp, 0x74
.L80022D40:
/* A99EE0 80022D40 8E6E0004 */  lw    $t6, 4($s3)
/* A99EE4 80022D44 928F019F */  lbu   $t7, 0x19f($s4)
/* A99EE8 80022D48 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* A99EEC 80022D4C 448E2000 */  mtc1  $t6, $f4
/* A99EF0 80022D50 448F4000 */  mtc1  $t7, $f8
/* A99EF4 80022D54 468021A0 */  cvt.s.w $f6, $f4
/* A99EF8 80022D58 05E10004 */  bgez  $t7, .L80022D6C
/* A99EFC 80022D5C 468042A0 */   cvt.s.w $f10, $f8
/* A99F00 80022D60 44818000 */  mtc1  $at, $f16
/* A99F04 80022D64 00000000 */  nop   
/* A99F08 80022D68 46105280 */  add.s $f10, $f10, $f16
.L80022D6C:
/* A99F0C 80022D6C 460A3003 */  div.s $f0, $f6, $f10
/* A99F10 80022D70 27B8006C */  addiu $t8, $sp, 0x6c
/* A99F14 80022D74 27B90064 */  addiu $t9, $sp, 0x64
/* A99F18 80022D78 27A90060 */  addiu $t1, $sp, 0x60
/* A99F1C 80022D7C AFA90018 */  sw    $t1, 0x18($sp)
/* A99F20 80022D80 AFB90014 */  sw    $t9, 0x14($sp)
/* A99F24 80022D84 AFB80010 */  sw    $t8, 0x10($sp)
/* A99F28 80022D88 02802025 */  move  $a0, $s4
/* A99F2C 80022D8C 02202825 */  move  $a1, $s1
/* A99F30 80022D90 03C03825 */  move  $a3, $fp
/* A99F34 80022D94 44060000 */  mfc1  $a2, $f0
/* A99F38 80022D98 0C008294 */  jal   func_80020A50
/* A99F3C 80022D9C 00000000 */   nop   
/* A99F40 80022DA0 06000011 */  bltz  $s0, .L80022DE8
/* A99F44 80022DA4 26310001 */   addiu $s1, $s1, 1
/* A99F48 80022DA8 87AB0074 */  lh    $t3, 0x74($sp)
/* A99F4C 80022DAC 00105100 */  sll   $t2, $s0, 4
/* A99F50 80022DB0 02AA1021 */  addu  $v0, $s5, $t2
/* A99F54 80022DB4 A44B0000 */  sh    $t3, ($v0)
/* A99F58 80022DB8 87AC0076 */  lh    $t4, 0x76($sp)
/* A99F5C 80022DBC A44C0002 */  sh    $t4, 2($v0)
/* A99F60 80022DC0 87AD0078 */  lh    $t5, 0x78($sp)
/* A99F64 80022DC4 A44D0004 */  sh    $t5, 4($v0)
/* A99F68 80022DC8 93AE0064 */  lbu   $t6, 0x64($sp)
/* A99F6C 80022DCC A04E000C */  sb    $t6, 0xc($v0)
/* A99F70 80022DD0 93AF0065 */  lbu   $t7, 0x65($sp)
/* A99F74 80022DD4 A04F000D */  sb    $t7, 0xd($v0)
/* A99F78 80022DD8 93B80066 */  lbu   $t8, 0x66($sp)
/* A99F7C 80022DDC A058000E */  sb    $t8, 0xe($v0)
/* A99F80 80022DE0 93B90067 */  lbu   $t9, 0x67($sp)
/* A99F84 80022DE4 A059000F */  sb    $t9, 0xf($v0)
.L80022DE8:
/* A99F88 80022DE8 06400011 */  bltz  $s2, .L80022E30
/* A99F8C 80022DEC 02401825 */   move  $v1, $s2
/* A99F90 80022DF0 87AA006C */  lh    $t2, 0x6c($sp)
/* A99F94 80022DF4 00034900 */  sll   $t1, $v1, 4
/* A99F98 80022DF8 02A91021 */  addu  $v0, $s5, $t1
/* A99F9C 80022DFC A44A0000 */  sh    $t2, ($v0)
/* A99FA0 80022E00 87AB006E */  lh    $t3, 0x6e($sp)
/* A99FA4 80022E04 A44B0002 */  sh    $t3, 2($v0)
/* A99FA8 80022E08 87AC0070 */  lh    $t4, 0x70($sp)
/* A99FAC 80022E0C A44C0004 */  sh    $t4, 4($v0)
/* A99FB0 80022E10 93AD0060 */  lbu   $t5, 0x60($sp)
/* A99FB4 80022E14 A04D000C */  sb    $t5, 0xc($v0)
/* A99FB8 80022E18 93AE0061 */  lbu   $t6, 0x61($sp)
/* A99FBC 80022E1C A04E000D */  sb    $t6, 0xd($v0)
/* A99FC0 80022E20 93AF0062 */  lbu   $t7, 0x62($sp)
/* A99FC4 80022E24 A04F000E */  sb    $t7, 0xe($v0)
/* A99FC8 80022E28 93B80063 */  lbu   $t8, 0x63($sp)
/* A99FCC 80022E2C A058000F */  sb    $t8, 0xf($v0)
.L80022E30:
/* A99FD0 80022E30 24630001 */  addiu $v1, $v1, 1
/* A99FD4 80022E34 02E3082A */  slt   $at, $s7, $v1
/* A99FD8 80022E38 14200010 */  bnez  $at, .L80022E7C
/* A99FDC 80022E3C 87A90074 */   lh    $t1, 0x74($sp)
/* A99FE0 80022E40 0003C900 */  sll   $t9, $v1, 4
/* A99FE4 80022E44 02B91021 */  addu  $v0, $s5, $t9
/* A99FE8 80022E48 A4490000 */  sh    $t1, ($v0)
/* A99FEC 80022E4C 87AA0076 */  lh    $t2, 0x76($sp)
/* A99FF0 80022E50 A44A0002 */  sh    $t2, 2($v0)
/* A99FF4 80022E54 87AB0078 */  lh    $t3, 0x78($sp)
/* A99FF8 80022E58 A44B0004 */  sh    $t3, 4($v0)
/* A99FFC 80022E5C 93AC0064 */  lbu   $t4, 0x64($sp)
/* A9A000 80022E60 A04C000C */  sb    $t4, 0xc($v0)
/* A9A004 80022E64 93AD0065 */  lbu   $t5, 0x65($sp)
/* A9A008 80022E68 A04D000D */  sb    $t5, 0xd($v0)
/* A9A00C 80022E6C 93AE0066 */  lbu   $t6, 0x66($sp)
/* A9A010 80022E70 A04E000E */  sb    $t6, 0xe($v0)
/* A9A014 80022E74 93AF0067 */  lbu   $t7, 0x67($sp)
/* A9A018 80022E78 A04F000F */  sb    $t7, 0xf($v0)
.L80022E7C:
/* A9A01C 80022E7C 24630001 */  addiu $v1, $v1, 1
/* A9A020 80022E80 02E3082A */  slt   $at, $s7, $v1
/* A9A024 80022E84 14200010 */  bnez  $at, .L80022EC8
/* A9A028 80022E88 87B9006C */   lh    $t9, 0x6c($sp)
/* A9A02C 80022E8C 0003C100 */  sll   $t8, $v1, 4
/* A9A030 80022E90 02B81021 */  addu  $v0, $s5, $t8
/* A9A034 80022E94 A4590000 */  sh    $t9, ($v0)
/* A9A038 80022E98 87A9006E */  lh    $t1, 0x6e($sp)
/* A9A03C 80022E9C A4490002 */  sh    $t1, 2($v0)
/* A9A040 80022EA0 87AA0070 */  lh    $t2, 0x70($sp)
/* A9A044 80022EA4 A44A0004 */  sh    $t2, 4($v0)
/* A9A048 80022EA8 93AB0060 */  lbu   $t3, 0x60($sp)
/* A9A04C 80022EAC A04B000C */  sb    $t3, 0xc($v0)
/* A9A050 80022EB0 93AC0061 */  lbu   $t4, 0x61($sp)
/* A9A054 80022EB4 A04C000D */  sb    $t4, 0xd($v0)
/* A9A058 80022EB8 93AD0062 */  lbu   $t5, 0x62($sp)
/* A9A05C 80022EBC A04D000E */  sb    $t5, 0xe($v0)
/* A9A060 80022EC0 93AE0063 */  lbu   $t6, 0x63($sp)
/* A9A064 80022EC4 A04E000F */  sb    $t6, 0xf($v0)
.L80022EC8:
/* A9A068 80022EC8 92CF019E */  lbu   $t7, 0x19e($s6)
/* A9A06C 80022ECC 26100004 */  addiu $s0, $s0, 4
/* A9A070 80022ED0 26520004 */  addiu $s2, $s2, 4
/* A9A074 80022ED4 022F082A */  slt   $at, $s1, $t7
/* A9A078 80022ED8 1420FF99 */  bnez  $at, .L80022D40
/* A9A07C 80022EDC 26730018 */   addiu $s3, $s3, 0x18
.L80022EE0:
/* A9A080 80022EE0 8FA4009C */  lw    $a0, 0x9c($sp)
/* A9A084 80022EE4 02802825 */  move  $a1, $s4
/* A9A088 80022EE8 0C00893D */  jal   func_800224F4
/* A9A08C 80022EEC 02A03025 */   move  $a2, $s5
.L80022EF0:
/* A9A090 80022EF0 8FBF004C */  lw    $ra, 0x4c($sp)
.L80022EF4:
/* A9A094 80022EF4 8FB00028 */  lw    $s0, 0x28($sp)
/* A9A098 80022EF8 8FB1002C */  lw    $s1, 0x2c($sp)
/* A9A09C 80022EFC 8FB20030 */  lw    $s2, 0x30($sp)
/* A9A0A0 80022F00 8FB30034 */  lw    $s3, 0x34($sp)
/* A9A0A4 80022F04 8FB40038 */  lw    $s4, 0x38($sp)
/* A9A0A8 80022F08 8FB5003C */  lw    $s5, 0x3c($sp)
/* A9A0AC 80022F0C 8FB60040 */  lw    $s6, 0x40($sp)
/* A9A0B0 80022F10 8FB70044 */  lw    $s7, 0x44($sp)
/* A9A0B4 80022F14 8FBE0048 */  lw    $fp, 0x48($sp)
/* A9A0B8 80022F18 03E00008 */  jr    $ra
/* A9A0BC 80022F1C 27BD0098 */   addiu $sp, $sp, 0x98

/* A9A0C0 80022F20 27BDFF60 */  addiu $sp, $sp, -0xa0
/* A9A0C4 80022F24 AFB60034 */  sw    $s6, 0x34($sp)
/* A9A0C8 80022F28 AFB20024 */  sw    $s2, 0x24($sp)
/* A9A0CC 80022F2C 00809025 */  move  $s2, $a0
/* A9A0D0 80022F30 AFBF003C */  sw    $ra, 0x3c($sp)
/* A9A0D4 80022F34 AFB70038 */  sw    $s7, 0x38($sp)
/* A9A0D8 80022F38 0080B025 */  move  $s6, $a0
/* A9A0DC 80022F3C 3C068013 */  lui   $a2, %hi(D_801353E0) # $a2, 0x8013
/* A9A0E0 80022F40 00A0B825 */  move  $s7, $a1
/* A9A0E4 80022F44 AFB50030 */  sw    $s5, 0x30($sp)
/* A9A0E8 80022F48 AFB4002C */  sw    $s4, 0x2c($sp)
/* A9A0EC 80022F4C AFB30028 */  sw    $s3, 0x28($sp)
/* A9A0F0 80022F50 AFB10020 */  sw    $s1, 0x20($sp)
/* A9A0F4 80022F54 AFB0001C */  sw    $s0, 0x1c($sp)
/* A9A0F8 80022F58 F7B40010 */  sdc1  $f20, 0x10($sp)
/* A9A0FC 80022F5C 24C653E0 */  addiu $a2, %lo(D_801353E0) # addiu $a2, $a2, 0x53e0
/* A9A100 80022F60 27A40074 */  addiu $a0, $sp, 0x74
/* A9A104 80022F64 0C031AB1 */  jal   func_800C6AC4
/* A9A108 80022F68 2407063C */   li    $a3, 1596
/* A9A10C 80022F6C 8EE602D0 */  lw    $a2, 0x2d0($s7)
/* A9A110 80022F70 3C0FDA38 */  lui   $t7, (0xDA380003 >> 16) # lui $t7, 0xda38
/* A9A114 80022F74 3C188013 */  lui   $t8, %hi(gMtxClear) # $t8, 0x8013
/* A9A118 80022F78 24CE0008 */  addiu $t6, $a2, 8
/* A9A11C 80022F7C AEEE02D0 */  sw    $t6, 0x2d0($s7)
/* A9A120 80022F80 2718DB20 */  addiu $t8, %lo(gMtxClear) # addiu $t8, $t8, -0x24e0
/* A9A124 80022F84 35EF0003 */  ori   $t7, (0xDA380003 & 0xFFFF) # ori $t7, $t7, 3
/* A9A128 80022F88 ACCF0000 */  sw    $t7, ($a2)
/* A9A12C 80022F8C ACD80004 */  sw    $t8, 4($a2)
/* A9A130 80022F90 9259019E */  lbu   $t9, 0x19e($s2)
/* A9A134 80022F94 13200119 */  beqz  $t9, .L800233FC
/* A9A138 80022F98 00000000 */   nop   
/* A9A13C 80022F9C 964C0188 */  lhu   $t4, 0x188($s2)
/* A9A140 80022FA0 5580010B */  bnezl $t4, .L800233D0
/* A9A144 80022FA4 925801A1 */   lbu   $t8, 0x1a1($s2)
/* A9A148 80022FA8 0C0250BC */  jal   func_800942F0
/* A9A14C 80022FAC 02E02025 */   move  $a0, $s7
/* A9A150 80022FB0 8EE602D0 */  lw    $a2, 0x2d0($s7)
/* A9A154 80022FB4 3C0EE700 */  lui   $t6, 0xe700
/* A9A158 80022FB8 02E02025 */  move  $a0, $s7
/* A9A15C 80022FBC 24CD0008 */  addiu $t5, $a2, 8
/* A9A160 80022FC0 AEED02D0 */  sw    $t5, 0x2d0($s7)
/* A9A164 80022FC4 24050200 */  li    $a1, 512
/* A9A168 80022FC8 ACC00004 */  sw    $zero, 4($a2)
/* A9A16C 80022FCC 0C031A73 */  jal   Graph_Alloc
/* A9A170 80022FD0 ACCE0000 */   sw    $t6, ($a2)
/* A9A174 80022FD4 14400006 */  bnez  $v0, .L80022FF0
/* A9A178 80022FD8 AFA20098 */   sw    $v0, 0x98($sp)
/* A9A17C 80022FDC 3C048013 */  lui   $a0, %hi(D_801353F4)
/* A9A180 80022FE0 0C00084C */  jal   osSyncPrintf
/* A9A184 80022FE4 248453F4 */   addiu $a0, %lo(D_801353F4) # addiu $a0, $a0, 0x53f4
/* A9A188 80022FE8 10000104 */  b     .L800233FC
/* A9A18C 80022FEC 00000000 */   nop   
.L80022FF0:
/* A9A190 80022FF0 924F019E */  lbu   $t7, 0x19e($s2)
/* A9A194 80022FF4 00009825 */  move  $s3, $zero
/* A9A198 80022FF8 0000A025 */  move  $s4, $zero
/* A9A19C 80022FFC 19E000B2 */  blez  $t7, .L800232C8
/* A9A1A0 80023000 02408825 */   move  $s1, $s2
/* A9A1A4 80023004 24150001 */  li    $s5, 1
/* A9A1A8 80023008 8E380000 */  lw    $t8, ($s1)
.L8002300C:
/* A9A1AC 8002300C 8FAD0098 */  lw    $t5, 0x98($sp)
/* A9A1B0 80023010 56B800A7 */  bnel  $s5, $t8, .L800232B0
/* A9A1B4 80023014 92CF019E */   lbu   $t7, 0x19e($s6)
/* A9A1B8 80023018 8E390004 */  lw    $t9, 4($s1)
/* A9A1BC 8002301C 924C019F */  lbu   $t4, 0x19f($s2)
/* A9A1C0 80023020 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* A9A1C4 80023024 44992000 */  mtc1  $t9, $f4
/* A9A1C8 80023028 448C4000 */  mtc1  $t4, $f8
/* A9A1CC 8002302C 468021A0 */  cvt.s.w $f6, $f4
/* A9A1D0 80023030 05810004 */  bgez  $t4, .L80023044
/* A9A1D4 80023034 468042A0 */   cvt.s.w $f10, $f8
/* A9A1D8 80023038 44818000 */  mtc1  $at, $f16
/* A9A1DC 8002303C 00000000 */  nop   
/* A9A1E0 80023040 46105280 */  add.s $f10, $f10, $f16
.L80023044:
/* A9A1E4 80023044 8E420180 */  lw    $v0, 0x180($s2)
/* A9A1E8 80023048 00137100 */  sll   $t6, $s3, 4
/* A9A1EC 8002304C 460A3503 */  div.s $f20, $f6, $f10
/* A9A1F0 80023050 10400059 */  beqz  $v0, .L800231B8
/* A9A1F4 80023054 01AE8021 */   addu  $s0, $t5, $t6
/* A9A1F8 80023058 10550007 */  beq   $v0, $s5, .L80023078
/* A9A1FC 8002305C 24010002 */   li    $at, 2
/* A9A200 80023060 1041001B */  beq   $v0, $at, .L800230D0
/* A9A204 80023064 24010003 */   li    $at, 3
/* A9A208 80023068 50410030 */  beql  $v0, $at, .L8002312C
/* A9A20C 8002306C 3C013F00 */   lui   $at, 0x3f00
/* A9A210 80023070 10000052 */  b     .L800231BC
/* A9A214 80023074 862F0008 */   lh    $t7, 8($s1)
.L80023078:
/* A9A218 80023078 4406A000 */  mfc1  $a2, $f20
/* A9A21C 8002307C 86240008 */  lh    $a0, 8($s1)
/* A9A220 80023080 0C009F8D */  jal   func_80027E34
/* A9A224 80023084 8625000E */   lh    $a1, 0xe($s1)
/* A9A228 80023088 A6020000 */  sh    $v0, ($s0)
/* A9A22C 8002308C 4406A000 */  mfc1  $a2, $f20
/* A9A230 80023090 86250010 */  lh    $a1, 0x10($s1)
/* A9A234 80023094 0C009F8D */  jal   func_80027E34
/* A9A238 80023098 8624000A */   lh    $a0, 0xa($s1)
/* A9A23C 8002309C A6020002 */  sh    $v0, 2($s0)
/* A9A240 800230A0 4406A000 */  mfc1  $a2, $f20
/* A9A244 800230A4 86250012 */  lh    $a1, 0x12($s1)
/* A9A248 800230A8 0C009F8D */  jal   func_80027E34
/* A9A24C 800230AC 8624000C */   lh    $a0, 0xc($s1)
/* A9A250 800230B0 A6020004 */  sh    $v0, 4($s0)
/* A9A254 800230B4 862F000E */  lh    $t7, 0xe($s1)
/* A9A258 800230B8 A60F0010 */  sh    $t7, 0x10($s0)
/* A9A25C 800230BC 86380010 */  lh    $t8, 0x10($s1)
/* A9A260 800230C0 A6180012 */  sh    $t8, 0x12($s0)
/* A9A264 800230C4 86390012 */  lh    $t9, 0x12($s1)
/* A9A268 800230C8 10000047 */  b     .L800231E8
/* A9A26C 800230CC A6190014 */   sh    $t9, 0x14($s0)
.L800230D0:
/* A9A270 800230D0 862C0008 */  lh    $t4, 8($s1)
/* A9A274 800230D4 4406A000 */  mfc1  $a2, $f20
/* A9A278 800230D8 A60C0000 */  sh    $t4, ($s0)
/* A9A27C 800230DC 862D000A */  lh    $t5, 0xa($s1)
/* A9A280 800230E0 A60D0002 */  sh    $t5, 2($s0)
/* A9A284 800230E4 862E000C */  lh    $t6, 0xc($s1)
/* A9A288 800230E8 A60E0004 */  sh    $t6, 4($s0)
/* A9A28C 800230EC 86250008 */  lh    $a1, 8($s1)
/* A9A290 800230F0 0C009F8D */  jal   func_80027E34
/* A9A294 800230F4 8624000E */   lh    $a0, 0xe($s1)
/* A9A298 800230F8 A6020010 */  sh    $v0, 0x10($s0)
/* A9A29C 800230FC 4406A000 */  mfc1  $a2, $f20
/* A9A2A0 80023100 8625000A */  lh    $a1, 0xa($s1)
/* A9A2A4 80023104 0C009F8D */  jal   func_80027E34
/* A9A2A8 80023108 86240010 */   lh    $a0, 0x10($s1)
/* A9A2AC 8002310C A6020012 */  sh    $v0, 0x12($s0)
/* A9A2B0 80023110 4406A000 */  mfc1  $a2, $f20
/* A9A2B4 80023114 8625000C */  lh    $a1, 0xc($s1)
/* A9A2B8 80023118 0C009F8D */  jal   func_80027E34
/* A9A2BC 8002311C 86240012 */   lh    $a0, 0x12($s1)
/* A9A2C0 80023120 10000031 */  b     .L800231E8
/* A9A2C4 80023124 A6020014 */   sh    $v0, 0x14($s0)
/* A9A2C8 80023128 3C013F00 */  li    $at, 0x3F000000 # 0.000000
.L8002312C:
/* A9A2CC 8002312C 44819000 */  mtc1  $at, $f18
/* A9A2D0 80023130 86240008 */  lh    $a0, 8($s1)
/* A9A2D4 80023134 8625000E */  lh    $a1, 0xe($s1)
/* A9A2D8 80023138 4612A502 */  mul.s $f20, $f20, $f18
/* A9A2DC 8002313C 4406A000 */  mfc1  $a2, $f20
/* A9A2E0 80023140 0C009F8D */  jal   func_80027E34
/* A9A2E4 80023144 00000000 */   nop   
/* A9A2E8 80023148 A6020000 */  sh    $v0, ($s0)
/* A9A2EC 8002314C 4406A000 */  mfc1  $a2, $f20
/* A9A2F0 80023150 86250010 */  lh    $a1, 0x10($s1)
/* A9A2F4 80023154 0C009F8D */  jal   func_80027E34
/* A9A2F8 80023158 8624000A */   lh    $a0, 0xa($s1)
/* A9A2FC 8002315C A6020002 */  sh    $v0, 2($s0)
/* A9A300 80023160 4406A000 */  mfc1  $a2, $f20
/* A9A304 80023164 86250012 */  lh    $a1, 0x12($s1)
/* A9A308 80023168 0C009F8D */  jal   func_80027E34
/* A9A30C 8002316C 8624000C */   lh    $a0, 0xc($s1)
/* A9A310 80023170 A6020004 */  sh    $v0, 4($s0)
/* A9A314 80023174 4406A000 */  mfc1  $a2, $f20
/* A9A318 80023178 86250008 */  lh    $a1, 8($s1)
/* A9A31C 8002317C 0C009F8D */  jal   func_80027E34
/* A9A320 80023180 8624000E */   lh    $a0, 0xe($s1)
/* A9A324 80023184 A6020010 */  sh    $v0, 0x10($s0)
/* A9A328 80023188 4406A000 */  mfc1  $a2, $f20
/* A9A32C 8002318C 8625000A */  lh    $a1, 0xa($s1)
/* A9A330 80023190 0C009F8D */  jal   func_80027E34
/* A9A334 80023194 86240010 */   lh    $a0, 0x10($s1)
/* A9A338 80023198 A6020012 */  sh    $v0, 0x12($s0)
/* A9A33C 8002319C 4406A000 */  mfc1  $a2, $f20
/* A9A340 800231A0 8625000C */  lh    $a1, 0xc($s1)
/* A9A344 800231A4 0C009F8D */  jal   func_80027E34
/* A9A348 800231A8 86240012 */   lh    $a0, 0x12($s1)
/* A9A34C 800231AC A6020014 */  sh    $v0, 0x14($s0)
/* A9A350 800231B0 1000000D */  b     .L800231E8
/* A9A354 800231B4 4614A500 */   add.s $f20, $f20, $f20
.L800231B8:
/* A9A358 800231B8 862F0008 */  lh    $t7, 8($s1)
.L800231BC:
/* A9A35C 800231BC A60F0000 */  sh    $t7, ($s0)
/* A9A360 800231C0 8638000A */  lh    $t8, 0xa($s1)
/* A9A364 800231C4 A6180002 */  sh    $t8, 2($s0)
/* A9A368 800231C8 8639000C */  lh    $t9, 0xc($s1)
/* A9A36C 800231CC A6190004 */  sh    $t9, 4($s0)
/* A9A370 800231D0 862C000E */  lh    $t4, 0xe($s1)
/* A9A374 800231D4 A60C0010 */  sh    $t4, 0x10($s0)
/* A9A378 800231D8 862D0010 */  lh    $t5, 0x10($s1)
/* A9A37C 800231DC A60D0012 */  sh    $t5, 0x12($s0)
/* A9A380 800231E0 862E0012 */  lh    $t6, 0x12($s1)
/* A9A384 800231E4 A60E0014 */  sh    $t6, 0x14($s0)
.L800231E8:
/* A9A388 800231E8 A6000006 */  sh    $zero, 6($s0)
/* A9A38C 800231EC A6000008 */  sh    $zero, 8($s0)
/* A9A390 800231F0 A600000A */  sh    $zero, 0xa($s0)
/* A9A394 800231F4 4406A000 */  mfc1  $a2, $f20
/* A9A398 800231F8 92450196 */  lbu   $a1, 0x196($s2)
/* A9A39C 800231FC 0C009FA1 */  jal   func_80027E84
/* A9A3A0 80023200 9244018E */   lbu   $a0, 0x18e($s2)
/* A9A3A4 80023204 A202000C */  sb    $v0, 0xc($s0)
/* A9A3A8 80023208 4406A000 */  mfc1  $a2, $f20
/* A9A3AC 8002320C 92450197 */  lbu   $a1, 0x197($s2)
/* A9A3B0 80023210 0C009FA1 */  jal   func_80027E84
/* A9A3B4 80023214 9244018F */   lbu   $a0, 0x18f($s2)
/* A9A3B8 80023218 A202000D */  sb    $v0, 0xd($s0)
/* A9A3BC 8002321C 4406A000 */  mfc1  $a2, $f20
/* A9A3C0 80023220 92450198 */  lbu   $a1, 0x198($s2)
/* A9A3C4 80023224 0C009FA1 */  jal   func_80027E84
/* A9A3C8 80023228 92440190 */   lbu   $a0, 0x190($s2)
/* A9A3CC 8002322C A202000E */  sb    $v0, 0xe($s0)
/* A9A3D0 80023230 4406A000 */  mfc1  $a2, $f20
/* A9A3D4 80023234 92450199 */  lbu   $a1, 0x199($s2)
/* A9A3D8 80023238 0C009FA1 */  jal   func_80027E84
/* A9A3DC 8002323C 92440191 */   lbu   $a0, 0x191($s2)
/* A9A3E0 80023240 A202000F */  sb    $v0, 0xf($s0)
/* A9A3E4 80023244 A6000016 */  sh    $zero, 0x16($s0)
/* A9A3E8 80023248 A6000018 */  sh    $zero, 0x18($s0)
/* A9A3EC 8002324C A600001A */  sh    $zero, 0x1a($s0)
/* A9A3F0 80023250 4406A000 */  mfc1  $a2, $f20
/* A9A3F4 80023254 26730001 */  addiu $s3, $s3, 1
/* A9A3F8 80023258 26100010 */  addiu $s0, $s0, 0x10
/* A9A3FC 8002325C 9245019A */  lbu   $a1, 0x19a($s2)
/* A9A400 80023260 0C009FA1 */  jal   func_80027E84
/* A9A404 80023264 92440192 */   lbu   $a0, 0x192($s2)
/* A9A408 80023268 A202000C */  sb    $v0, 0xc($s0)
/* A9A40C 8002326C 4406A000 */  mfc1  $a2, $f20
/* A9A410 80023270 9245019B */  lbu   $a1, 0x19b($s2)
/* A9A414 80023274 0C009FA1 */  jal   func_80027E84
/* A9A418 80023278 92440193 */   lbu   $a0, 0x193($s2)
/* A9A41C 8002327C A202000D */  sb    $v0, 0xd($s0)
/* A9A420 80023280 4406A000 */  mfc1  $a2, $f20
/* A9A424 80023284 9245019C */  lbu   $a1, 0x19c($s2)
/* A9A428 80023288 0C009FA1 */  jal   func_80027E84
/* A9A42C 8002328C 92440194 */   lbu   $a0, 0x194($s2)
/* A9A430 80023290 A202000E */  sb    $v0, 0xe($s0)
/* A9A434 80023294 4406A000 */  mfc1  $a2, $f20
/* A9A438 80023298 9245019D */  lbu   $a1, 0x19d($s2)
/* A9A43C 8002329C 0C009FA1 */  jal   func_80027E84
/* A9A440 800232A0 92440195 */   lbu   $a0, 0x195($s2)
/* A9A444 800232A4 A202000F */  sb    $v0, 0xf($s0)
/* A9A448 800232A8 26730001 */  addiu $s3, $s3, 1
/* A9A44C 800232AC 92CF019E */  lbu   $t7, 0x19e($s6)
.L800232B0:
/* A9A450 800232B0 26940001 */  addiu $s4, $s4, 1
/* A9A454 800232B4 26310018 */  addiu $s1, $s1, 0x18
/* A9A458 800232B8 028F082A */  slt   $at, $s4, $t7
/* A9A45C 800232BC 5420FF53 */  bnezl $at, .L8002300C
/* A9A460 800232C0 8E380000 */   lw    $t8, ($s1)
/* A9A464 800232C4 00009825 */  move  $s3, $zero
.L800232C8:
/* A9A468 800232C8 8EE602D0 */  lw    $a2, 0x2d0($s7)
/* A9A46C 800232CC 3C190102 */  lui   $t9, (0x01020040 >> 16) # lui $t9, 0x102
/* A9A470 800232D0 37390040 */  ori   $t9, (0x01020040 & 0xFFFF) # ori $t9, $t9, 0x40
/* A9A474 800232D4 24D80008 */  addiu $t8, $a2, 8
/* A9A478 800232D8 AEF802D0 */  sw    $t8, 0x2d0($s7)
/* A9A47C 800232DC ACD90000 */  sw    $t9, ($a2)
/* A9A480 800232E0 8FAC0098 */  lw    $t4, 0x98($sp)
/* A9A484 800232E4 24150001 */  li    $s5, 1
/* A9A488 800232E8 00005025 */  move  $t2, $zero
/* A9A48C 800232EC ACCC0004 */  sw    $t4, 4($a2)
/* A9A490 800232F0 924D019E */  lbu   $t5, 0x19e($s2)
/* A9A494 800232F4 02408825 */  move  $s1, $s2
/* A9A498 800232F8 3C0B0700 */  lui   $t3, 0x700
/* A9A49C 800232FC 19A0003F */  blez  $t5, .L800233FC
/* A9A4A0 80023300 00000000 */   nop   
/* A9A4A4 80023304 8E2E0000 */  lw    $t6, ($s1)
.L80023308:
/* A9A4A8 80023308 26310018 */  addiu $s1, $s1, 0x18
/* A9A4AC 8002330C 15C00008 */  bnez  $t6, .L80023330
/* A9A4B0 80023310 00000000 */   nop   
/* A9A4B4 80023314 92C2019E */  lbu   $v0, 0x19e($s6)
/* A9A4B8 80023318 00005025 */  move  $t2, $zero
/* A9A4BC 8002331C 00027880 */  sll   $t7, $v0, 2
/* A9A4C0 80023320 01E27823 */  subu  $t7, $t7, $v0
/* A9A4C4 80023324 000F78C0 */  sll   $t7, $t7, 3
/* A9A4C8 80023328 10000023 */  b     .L800233B8
/* A9A4CC 8002332C 01F21821 */   addu  $v1, $t7, $s2
.L80023330:
/* A9A4D0 80023330 15400003 */  bnez  $t2, .L80023340
/* A9A4D4 80023334 00132840 */   sll   $a1, $s3, 1
/* A9A4D8 80023338 10000019 */  b     .L800233A0
/* A9A4DC 8002333C 02A05025 */   move  $t2, $s5
.L80023340:
/* A9A4E0 80023340 8EE602D0 */  lw    $a2, 0x2d0($s7)
/* A9A4E4 80023344 24A7FFFC */  addiu $a3, $a1, -4
/* A9A4E8 80023348 24A8FFFE */  addiu $t0, $a1, -2
/* A9A4EC 8002334C 311900FF */  andi  $t9, $t0, 0xff
/* A9A4F0 80023350 30E300FF */  andi  $v1, $a3, 0xff
/* A9A4F4 80023354 24A90002 */  addiu $t1, $a1, 2
/* A9A4F8 80023358 312400FF */  andi  $a0, $t1, 0xff
/* A9A4FC 8002335C 00031C00 */  sll   $v1, $v1, 0x10
/* A9A500 80023360 00196200 */  sll   $t4, $t9, 8
/* A9A504 80023364 24D80008 */  addiu $t8, $a2, 8
/* A9A508 80023368 AEF802D0 */  sw    $t8, 0x2d0($s7)
/* A9A50C 8002336C 006C6825 */  or    $t5, $v1, $t4
/* A9A510 80023370 01A47025 */  or    $t6, $t5, $a0
/* A9A514 80023374 0004C200 */  sll   $t8, $a0, 8
/* A9A518 80023378 0078C825 */  or    $t9, $v1, $t8
/* A9A51C 8002337C 30AC00FF */  andi  $t4, $a1, 0xff
/* A9A520 80023380 032C6825 */  or    $t5, $t9, $t4
/* A9A524 80023384 01CB7825 */  or    $t7, $t6, $t3
/* A9A528 80023388 ACCF0000 */  sw    $t7, ($a2)
/* A9A52C 8002338C ACCD0004 */  sw    $t5, 4($a2)
/* A9A530 80023390 924E01A0 */  lbu   $t6, 0x1a0($s2)
/* A9A534 80023394 56AE0003 */  bnel  $s5, $t6, .L800233A4
/* A9A538 80023398 92C2019E */   lbu   $v0, 0x19e($s6)
/* A9A53C 8002339C 00005025 */  move  $t2, $zero
.L800233A0:
/* A9A540 800233A0 92C2019E */  lbu   $v0, 0x19e($s6)
.L800233A4:
/* A9A544 800233A4 26730002 */  addiu $s3, $s3, 2
/* A9A548 800233A8 00027880 */  sll   $t7, $v0, 2
/* A9A54C 800233AC 01E27823 */  subu  $t7, $t7, $v0
/* A9A550 800233B0 000F78C0 */  sll   $t7, $t7, 3
/* A9A554 800233B4 01F21821 */  addu  $v1, $t7, $s2
.L800233B8:
/* A9A558 800233B8 0223082B */  sltu  $at, $s1, $v1
/* A9A55C 800233BC 5420FFD2 */  bnezl $at, .L80023308
/* A9A560 800233C0 8E2E0000 */   lw    $t6, ($s1)
/* A9A564 800233C4 1000000D */  b     .L800233FC
/* A9A568 800233C8 00000000 */   nop   
/* A9A56C 800233CC 925801A1 */  lbu   $t8, 0x1a1($s2)
.L800233D0:
/* A9A570 800233D0 02E02825 */  move  $a1, $s7
/* A9A574 800233D4 02402025 */  move  $a0, $s2
/* A9A578 800233D8 2B010002 */  slti  $at, $t8, 2
/* A9A57C 800233DC 10200005 */  beqz  $at, .L800233F4
/* A9A580 800233E0 00000000 */   nop   
/* A9A584 800233E4 0C008A84 */  jal   func_80022A10
/* A9A588 800233E8 02402025 */   move  $a0, $s2
/* A9A58C 800233EC 10000003 */  b     .L800233FC
/* A9A590 800233F0 00000000 */   nop   
.L800233F4:
/* A9A594 800233F4 0C0087C0 */  jal   func_80021F00
/* A9A598 800233F8 02E02825 */   move  $a1, $s7
.L800233FC:
/* A9A59C 800233FC 3C068013 */  lui   $a2, %hi(D_80135418) # $a2, 0x8013
/* A9A5A0 80023400 24C65418 */  addiu $a2, %lo(D_80135418) # addiu $a2, $a2, 0x5418
/* A9A5A4 80023404 27A40074 */  addiu $a0, $sp, 0x74
/* A9A5A8 80023408 02E02825 */  move  $a1, $s7
/* A9A5AC 8002340C 0C031AD5 */  jal   func_800C6B54
/* A9A5B0 80023410 2407071F */   li    $a3, 1823
/* A9A5B4 80023414 8FBF003C */  lw    $ra, 0x3c($sp)
/* A9A5B8 80023418 D7B40010 */  ldc1  $f20, 0x10($sp)
/* A9A5BC 8002341C 8FB0001C */  lw    $s0, 0x1c($sp)
/* A9A5C0 80023420 8FB10020 */  lw    $s1, 0x20($sp)
/* A9A5C4 80023424 8FB20024 */  lw    $s2, 0x24($sp)
/* A9A5C8 80023428 8FB30028 */  lw    $s3, 0x28($sp)
/* A9A5CC 8002342C 8FB4002C */  lw    $s4, 0x2c($sp)
/* A9A5D0 80023430 8FB50030 */  lw    $s5, 0x30($sp)
/* A9A5D4 80023434 8FB60034 */  lw    $s6, 0x34($sp)
/* A9A5D8 80023438 8FB70038 */  lw    $s7, 0x38($sp)
/* A9A5DC 8002343C 03E00008 */  jr    $ra
/* A9A5E0 80023440 27BD00A0 */   addiu $sp, $sp, 0xa0