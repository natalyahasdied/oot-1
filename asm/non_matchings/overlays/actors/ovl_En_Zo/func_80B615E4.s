glabel func_80B615E4
/* 013C4 80B615E4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 013C8 80B615E8 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 013CC 80B615EC 8C830154 */  lw      $v1, 0x0154($a0)           ## 00000154
/* 013D0 80B615F0 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 013D4 80B615F4 24A50598 */  addiu   $a1, $a1, 0x0598           ## $a1 = 06000598
/* 013D8 80B615F8 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 013DC 80B615FC 10A30005 */  beq     $a1, $v1, .L80B61614       
/* 013E0 80B61600 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 013E4 80B61604 3C0E0600 */  lui     $t6, 0x0600                ## $t6 = 06000000
/* 013E8 80B61608 25CE0D48 */  addiu   $t6, $t6, 0x0D48           ## $t6 = 06000D48
/* 013EC 80B6160C 55C3000C */  bnel    $t6, $v1, .L80B61640       
/* 013F0 80B61610 84E20194 */  lh      $v0, 0x0194($a3)           ## 00000194
.L80B61614:
/* 013F4 80B61614 84EF0194 */  lh      $t7, 0x0194($a3)           ## 00000194
/* 013F8 80B61618 55E00009 */  bnel    $t7, $zero, .L80B61640     
/* 013FC 80B6161C 84E20194 */  lh      $v0, 0x0194($a3)           ## 00000194
/* 01400 80B61620 8CF90190 */  lw      $t9, 0x0190($a3)           ## 00000190
/* 01404 80B61624 3C1880B6 */  lui     $t8, %hi(func_80B618F0)    ## $t8 = 80B60000
/* 01408 80B61628 271818F0 */  addiu   $t8, $t8, %lo(func_80B618F0) ## $t8 = 80B618F0
/* 0140C 80B6162C 17190003 */  bne     $t8, $t9, .L80B6163C       
/* 01410 80B61630 24060003 */  addiu   $a2, $zero, 0x0003         ## $a2 = 00000003
/* 01414 80B61634 10000001 */  beq     $zero, $zero, .L80B6163C   
/* 01418 80B61638 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
.L80B6163C:
/* 0141C 80B6163C 84E20194 */  lh      $v0, 0x0194($a3)           ## 00000194
.L80B61640:
/* 01420 80B61640 24E4014C */  addiu   $a0, $a3, 0x014C           ## $a0 = 0000014C
/* 01424 80B61644 10400008 */  beq     $v0, $zero, .L80B61668     
/* 01428 80B61648 00000000 */  nop
/* 0142C 80B6164C 94E8010E */  lhu     $t0, 0x010E($a3)           ## 0000010E
/* 01430 80B61650 24014006 */  addiu   $at, $zero, 0x4006         ## $at = 00004006
/* 01434 80B61654 15010004 */  bne     $t0, $at, .L80B61668       
/* 01438 80B61658 00000000 */  nop
/* 0143C 80B6165C 10A30002 */  beq     $a1, $v1, .L80B61668       
/* 01440 80B61660 00000000 */  nop
/* 01444 80B61664 24060006 */  addiu   $a2, $zero, 0x0006         ## $a2 = 00000006
.L80B61668:
/* 01448 80B61668 10400009 */  beq     $v0, $zero, .L80B61690     
/* 0144C 80B6166C 3C0580B6 */  lui     $a1, %hi(D_80B624E4)       ## $a1 = 80B60000
/* 01450 80B61670 94E9010E */  lhu     $t1, 0x010E($a3)           ## 0000010E
/* 01454 80B61674 24014007 */  addiu   $at, $zero, 0x4007         ## $at = 00004007
/* 01458 80B61678 3C0A0600 */  lui     $t2, 0x0600                ## $t2 = 06000000
/* 0145C 80B6167C 15210004 */  bne     $t1, $at, .L80B61690       
/* 01460 80B61680 254A0D48 */  addiu   $t2, $t2, 0x0D48           ## $t2 = 06000D48
/* 01464 80B61684 51430003 */  beql    $t2, $v1, .L80B61694       
/* 01468 80B61688 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 0146C 80B6168C 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
.L80B61690:
/* 01470 80B61690 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
.L80B61694:
/* 01474 80B61694 10C1000D */  beq     $a2, $at, .L80B616CC       
/* 01478 80B61698 24A524E4 */  addiu   $a1, $a1, %lo(D_80B624E4)  ## $a1 = 80B624E4
/* 0147C 80B6169C AFA6001C */  sw      $a2, 0x001C($sp)           
/* 01480 80B616A0 0C00D3B0 */  jal     func_80034EC0              
/* 01484 80B616A4 AFA70020 */  sw      $a3, 0x0020($sp)           
/* 01488 80B616A8 8FA6001C */  lw      $a2, 0x001C($sp)           
/* 0148C 80B616AC 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 01490 80B616B0 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 01494 80B616B4 54C10006 */  bnel    $a2, $at, .L80B616D0       
/* 01498 80B616B8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0149C 80B616BC C4E4015C */  lwc1    $f4, 0x015C($a3)           ## 0000015C
/* 014A0 80B616C0 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 014A4 80B616C4 E4E40164 */  swc1    $f4, 0x0164($a3)           ## 00000164
/* 014A8 80B616C8 E4E60168 */  swc1    $f6, 0x0168($a3)           ## 00000168
.L80B616CC:
/* 014AC 80B616CC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80B616D0:
/* 014B0 80B616D0 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 014B4 80B616D4 03E00008 */  jr      $ra                        
/* 014B8 80B616D8 00000000 */  nop


