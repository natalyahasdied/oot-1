glabel func_8095335C
/* 0409C 8095335C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 040A0 80953360 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 040A4 80953364 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 040A8 80953368 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 040AC 8095336C AFA50024 */  sw      $a1, 0x0024($sp)           
/* 040B0 80953370 2405313C */  addiu   $a1, $zero, 0x313C         ## $a1 = 0000313C
/* 040B4 80953374 248400E4 */  addiu   $a0, $a0, 0x00E4           ## $a0 = 000000E4
/* 040B8 80953378 0C03D0DB */  jal     func_800F436C              
/* 040BC 8095337C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 040C0 80953380 8E0E0004 */  lw      $t6, 0x0004($s0)           ## 00000004
/* 040C4 80953384 2401FFFA */  addiu   $at, $zero, 0xFFFA         ## $at = FFFFFFFA
/* 040C8 80953388 3C041001 */  lui     $a0, 0x1001                ## $a0 = 10010000
/* 040CC 8095338C 01C17824 */  and     $t7, $t6, $at              
/* 040D0 80953390 AE0F0004 */  sw      $t7, 0x0004($s0)           ## 00000004
/* 040D4 80953394 0C03E803 */  jal     Audio_SetBGM
              
/* 040D8 80953398 348400FF */  ori     $a0, $a0, 0x00FF           ## $a0 = 100100FF
/* 040DC 8095339C 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 040E0 809533A0 44800000 */  mtc1    $zero, $f0                 ## $f0 = 0.00
/* 040E4 809533A4 24180C31 */  addiu   $t8, $zero, 0x0C31         ## $t8 = 00000C31
/* 040E8 809533A8 A61801F6 */  sh      $t8, 0x01F6($s0)           ## 000001F6
/* 040EC 809533AC 2419000E */  addiu   $t9, $zero, 0x000E         ## $t9 = 0000000E
/* 040F0 809533B0 3C018096 */  lui     $at, %hi(D_809668D2)       ## $at = 80960000
/* 040F4 809533B4 A03968D2 */  sb      $t9, %lo(D_809668D2)($at)  
/* 040F8 809533B8 3C050001 */  lui     $a1, 0x0001                ## $a1 = 00010000
/* 040FC 809533BC 00A42821 */  addu    $a1, $a1, $a0              
/* 04100 809533C0 E6000068 */  swc1    $f0, 0x0068($s0)           ## 00000068
/* 04104 809533C4 E60001A8 */  swc1    $f0, 0x01A8($s0)           ## 000001A8
/* 04108 809533C8 0C00B33C */  jal     Flags_SetClear
              
/* 0410C 809533CC 80A51CBC */  lb      $a1, 0x1CBC($a1)           ## 00011CBC
/* 04110 809533D0 3C058095 */  lui     $a1, %hi(func_809533F4)    ## $a1 = 80950000
/* 04114 809533D4 24A533F4 */  addiu   $a1, $a1, %lo(func_809533F4) ## $a1 = 809533F4
/* 04118 809533D8 0C253CB0 */  jal     func_8094F2C0              
/* 0411C 809533DC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 04120 809533E0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 04124 809533E4 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 04128 809533E8 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 0412C 809533EC 03E00008 */  jr      $ra                        
/* 04130 809533F0 00000000 */  nop


