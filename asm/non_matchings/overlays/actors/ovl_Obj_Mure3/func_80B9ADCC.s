glabel func_80B9ADCC
/* 003FC 80B9ADCC 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00400 80B9ADD0 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 00404 80B9ADD4 AFB50028 */  sw      $s5, 0x0028($sp)           
/* 00408 80B9ADD8 AFB40024 */  sw      $s4, 0x0024($sp)           
/* 0040C 80B9ADDC AFB30020 */  sw      $s3, 0x0020($sp)           
/* 00410 80B9ADE0 AFB2001C */  sw      $s2, 0x001C($sp)           
/* 00414 80B9ADE4 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00418 80B9ADE8 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0041C 80B9ADEC 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 00420 80B9ADF0 3C1580BA */  lui     $s5, %hi(D_80B9B0C0)       ## $s5 = 80BA0000
/* 00424 80B9ADF4 00809825 */  or      $s3, $a0, $zero            ## $s3 = 00000000
/* 00428 80B9ADF8 000E7B43 */  sra     $t7, $t6, 13               
/* 0042C 80B9ADFC 31F80007 */  andi    $t8, $t7, 0x0007           ## $t8 = 00000000
/* 00430 80B9AE00 0018C840 */  sll     $t9, $t8,  1               
/* 00434 80B9AE04 02B9A821 */  addu    $s5, $s5, $t9              
/* 00438 80B9AE08 86B5B0C0 */  lh      $s5, %lo(D_80B9B0C0)($s5)  
/* 0043C 80B9AE0C 00A0A025 */  or      $s4, $a1, $zero            ## $s4 = 00000000
/* 00440 80B9AE10 00008825 */  or      $s1, $zero, $zero          ## $s1 = 00000000
/* 00444 80B9AE14 1AA00020 */  blez    $s5, .L80B9AE98            
/* 00448 80B9AE18 00809025 */  or      $s2, $a0, $zero            ## $s2 = 00000000
.L80B9AE1C:
/* 0044C 80B9AE1C 8E480150 */  lw      $t0, 0x0150($s2)           ## 00000150
/* 00450 80B9AE20 5100001B */  beql    $t0, $zero, .L80B9AE90     
/* 00454 80B9AE24 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000001
/* 00458 80B9AE28 9669016C */  lhu     $t1, 0x016C($s3)           ## 0000016C
/* 0045C 80B9AE2C 26500150 */  addiu   $s0, $s2, 0x0150           ## $s0 = 00000150
/* 00460 80B9AE30 02802825 */  or      $a1, $s4, $zero            ## $a1 = 00000000
/* 00464 80B9AE34 02295007 */  srav    $t2, $t1, $s1              
/* 00468 80B9AE38 314B0001 */  andi    $t3, $t2, 0x0001           ## $t3 = 00000000
/* 0046C 80B9AE3C 55600014 */  bnel    $t3, $zero, .L80B9AE90     
/* 00470 80B9AE40 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000002
/* 00474 80B9AE44 0C00BD04 */  jal     func_8002F410              
/* 00478 80B9AE48 8E040000 */  lw      $a0, 0x0000($s0)           ## 00000150
/* 0047C 80B9AE4C 50400006 */  beql    $v0, $zero, .L80B9AE68     
/* 00480 80B9AE50 8E0C0000 */  lw      $t4, 0x0000($s0)           ## 00000150
/* 00484 80B9AE54 8665001C */  lh      $a1, 0x001C($s3)           ## 0000001C
/* 00488 80B9AE58 02802025 */  or      $a0, $s4, $zero            ## $a0 = 00000000
/* 0048C 80B9AE5C 0C00B2DD */  jal     Flags_SetSwitch
              
/* 00490 80B9AE60 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 00494 80B9AE64 8E0C0000 */  lw      $t4, 0x0000($s0)           ## 00000150
.L80B9AE68:
/* 00498 80B9AE68 8D8D0130 */  lw      $t5, 0x0130($t4)           ## 00000130
/* 0049C 80B9AE6C 55A00008 */  bnel    $t5, $zero, .L80B9AE90     
/* 004A0 80B9AE70 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000003
/* 004A4 80B9AE74 966E016C */  lhu     $t6, 0x016C($s3)           ## 0000016C
/* 004A8 80B9AE78 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 004AC 80B9AE7C 022FC004 */  sllv    $t8, $t7, $s1              
/* 004B0 80B9AE80 01D8C825 */  or      $t9, $t6, $t8              ## $t9 = 00000000
/* 004B4 80B9AE84 A679016C */  sh      $t9, 0x016C($s3)           ## 0000016C
/* 004B8 80B9AE88 AE400150 */  sw      $zero, 0x0150($s2)         ## 00000150
/* 004BC 80B9AE8C 26310001 */  addiu   $s1, $s1, 0x0001           ## $s1 = 00000004
.L80B9AE90:
/* 004C0 80B9AE90 1635FFE2 */  bne     $s1, $s5, .L80B9AE1C       
/* 004C4 80B9AE94 26520004 */  addiu   $s2, $s2, 0x0004           ## $s2 = 00000004
.L80B9AE98:
/* 004C8 80B9AE98 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 004CC 80B9AE9C 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 004D0 80B9AEA0 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 004D4 80B9AEA4 8FB2001C */  lw      $s2, 0x001C($sp)           
/* 004D8 80B9AEA8 8FB30020 */  lw      $s3, 0x0020($sp)           
/* 004DC 80B9AEAC 8FB40024 */  lw      $s4, 0x0024($sp)           
/* 004E0 80B9AEB0 8FB50028 */  lw      $s5, 0x0028($sp)           
/* 004E4 80B9AEB4 03E00008 */  jr      $ra                        
/* 004E8 80B9AEB8 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000

