glabel func_80A05040
/* 03410 80A05040 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 03414 80A05044 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03418 80A05048 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 0341C 80A0504C AFB00014 */  sw      $s0, 0x0014($sp)           
/* 03420 80A05050 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 03424 80A05054 0C281379 */  jal     func_80A04DE4              
/* 03428 80A05058 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 0342C 80A0505C 0C042F6F */  jal     func_8010BDBC              
/* 03430 80A05060 260420D8 */  addiu   $a0, $s0, 0x20D8           ## $a0 = 000020D8
/* 03434 80A05064 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 03438 80A05068 54410023 */  bnel    $v0, $at, .L80A050F8       
/* 0343C 80A0506C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 03440 80A05070 0C041AF2 */  jal     func_80106BC8              
/* 03444 80A05074 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03448 80A05078 1040001E */  beq     $v0, $zero, .L80A050F4     
/* 0344C 80A0507C 3C020001 */  lui     $v0, 0x0001                ## $v0 = 00010000
/* 03450 80A05080 00501021 */  addu    $v0, $v0, $s0              
/* 03454 80A05084 904204BD */  lbu     $v0, 0x04BD($v0)           ## 000104BD
/* 03458 80A05088 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0345C 80A0508C 10400005 */  beq     $v0, $zero, .L80A050A4     
/* 03460 80A05090 00000000 */  nop
/* 03464 80A05094 1041000C */  beq     $v0, $at, .L80A050C8       
/* 03468 80A05098 00000000 */  nop
/* 0346C 80A0509C 10000016 */  beq     $zero, $zero, .L80A050F8   
/* 03470 80A050A0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L80A050A4:
/* 03474 80A050A4 0C01B0AC */  jal     func_8006C2B0              
/* 03478 80A050A8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0347C 80A050AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03480 80A050B0 0C042DC8 */  jal     func_8010B720              
/* 03484 80A050B4 3045FFFF */  andi    $a1, $v0, 0xFFFF           ## $a1 = 00000000
/* 03488 80A050B8 3C0E80A0 */  lui     $t6, %hi(func_80A05114)    ## $t6 = 80A00000
/* 0348C 80A050BC 25CE5114 */  addiu   $t6, $t6, %lo(func_80A05114) ## $t6 = 80A05114
/* 03490 80A050C0 1000000C */  beq     $zero, $zero, .L80A050F4   
/* 03494 80A050C4 AE2E0130 */  sw      $t6, 0x0130($s1)           ## 00000130
.L80A050C8:
/* 03498 80A050C8 0C041B33 */  jal     func_80106CCC              
/* 0349C 80A050CC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 034A0 80A050D0 3C0F80A0 */  lui     $t7, %hi(func_80A053F0)    ## $t7 = 80A00000
/* 034A4 80A050D4 25EF53F0 */  addiu   $t7, $t7, %lo(func_80A053F0) ## $t7 = 80A053F0
/* 034A8 80A050D8 AE2F0130 */  sw      $t7, 0x0130($s1)           ## 00000130
/* 034AC 80A050DC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 034B0 80A050E0 0C28070E */  jal     func_80A01C38              
/* 034B4 80A050E4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 034B8 80A050E8 963802C4 */  lhu     $t8, 0x02C4($s1)           ## 000002C4
/* 034BC 80A050EC 3319FFDF */  andi    $t9, $t8, 0xFFDF           ## $t9 = 00000000
/* 034C0 80A050F0 A63902C4 */  sh      $t9, 0x02C4($s1)           ## 000002C4
.L80A050F4:
/* 034C4 80A050F4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L80A050F8:
/* 034C8 80A050F8 0C2813E5 */  jal     func_80A04F94              
/* 034CC 80A050FC 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 034D0 80A05100 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 034D4 80A05104 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 034D8 80A05108 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 034DC 80A0510C 03E00008 */  jr      $ra                        
/* 034E0 80A05110 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000


