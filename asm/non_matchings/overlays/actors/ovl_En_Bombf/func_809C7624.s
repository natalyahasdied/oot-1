glabel func_809C7624
/* 006C4 809C7624 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 006C8 809C7628 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 006CC 809C762C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 006D0 809C7630 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 006D4 809C7634 8C8201B4 */  lw      $v0, 0x01B4($a0)           ## 000001B4
/* 006D8 809C7638 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 006DC 809C763C 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 006E0 809C7640 8443002E */  lh      $v1, 0x002E($v0)           ## 0000002E
/* 006E4 809C7644 24060014 */  addiu   $a2, $zero, 0x0014         ## $a2 = 00000014
/* 006E8 809C7648 5460000A */  bnel    $v1, $zero, .L809C7674     
/* 006EC 809C764C 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 006F0 809C7650 8C8E0004 */  lw      $t6, 0x0004($a0)           ## 00000004
/* 006F4 809C7654 C48C0090 */  lwc1    $f12, 0x0090($a0)          ## 00000090
/* 006F8 809C7658 24070096 */  addiu   $a3, $zero, 0x0096         ## $a3 = 00000096
/* 006FC 809C765C 35CF0020 */  ori     $t7, $t6, 0x0020           ## $t7 = 00000020
/* 00700 809C7660 0C02A800 */  jal     func_800AA000              
/* 00704 809C7664 AC8F0004 */  sw      $t7, 0x0004($a0)           ## 00000004
/* 00708 809C7668 8E0201B4 */  lw      $v0, 0x01B4($s0)           ## 000001B4
/* 0070C 809C766C 8443002E */  lh      $v1, 0x002E($v0)           ## 0000002E
/* 00710 809C7670 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
.L809C7674:
/* 00714 809C7674 A458002E */  sh      $t8, 0x002E($v0)           ## 0000002E
/* 00718 809C7678 8E0201B4 */  lw      $v0, 0x01B4($s0)           ## 000001B4
/* 0071C 809C767C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00720 809C7680 26060198 */  addiu   $a2, $s0, 0x0198           ## $a2 = 00000198
/* 00724 809C7684 8459002E */  lh      $t9, 0x002E($v0)           ## 0000002E
/* 00728 809C7688 A4590036 */  sh      $t9, 0x0036($v0)           ## 00000036
/* 0072C 809C768C 8608001C */  lh      $t0, 0x001C($s0)           ## 0000001C
/* 00730 809C7690 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00734 809C7694 15010004 */  bne     $t0, $at, .L809C76A8       
/* 00738 809C7698 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0073C 809C769C 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 00740 809C76A0 0C0175E7 */  jal     CollisionCheck_SetAT
              ## CollisionCheck_setAT
/* 00744 809C76A4 00812821 */  addu    $a1, $a0, $at              
.L809C76A8:
/* 00748 809C76A8 8FA20024 */  lw      $v0, 0x0024($sp)           
/* 0074C 809C76AC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00750 809C76B0 00411021 */  addu    $v0, $v0, $at              
/* 00754 809C76B4 84430AB6 */  lh      $v1, 0x0AB6($v0)           ## 00000AB6
/* 00758 809C76B8 10600002 */  beq     $v1, $zero, .L809C76C4     
/* 0075C 809C76BC 246AFFE7 */  addiu   $t2, $v1, 0xFFE7           ## $t2 = FFFFFFE7
/* 00760 809C76C0 A44A0AB6 */  sh      $t2, 0x0AB6($v0)           ## 00000AB6
.L809C76C4:
/* 00764 809C76C4 84430AB8 */  lh      $v1, 0x0AB8($v0)           ## 00000AB8
/* 00768 809C76C8 10600002 */  beq     $v1, $zero, .L809C76D4     
/* 0076C 809C76CC 246BFFE7 */  addiu   $t3, $v1, 0xFFE7           ## $t3 = FFFFFFE7
/* 00770 809C76D0 A44B0AB8 */  sh      $t3, 0x0AB8($v0)           ## 00000AB8
.L809C76D4:
/* 00774 809C76D4 84430ABA */  lh      $v1, 0x0ABA($v0)           ## 00000ABA
/* 00778 809C76D8 10600002 */  beq     $v1, $zero, .L809C76E4     
/* 0077C 809C76DC 246CFFE7 */  addiu   $t4, $v1, 0xFFE7           ## $t4 = FFFFFFE7
/* 00780 809C76E0 A44C0ABA */  sh      $t4, 0x0ABA($v0)           ## 00000ABA
.L809C76E4:
/* 00784 809C76E4 84430AB0 */  lh      $v1, 0x0AB0($v0)           ## 00000AB0
/* 00788 809C76E8 10600002 */  beq     $v1, $zero, .L809C76F4     
/* 0078C 809C76EC 246DFFE7 */  addiu   $t5, $v1, 0xFFE7           ## $t5 = FFFFFFE7
/* 00790 809C76F0 A44D0AB0 */  sh      $t5, 0x0AB0($v0)           ## 00000AB0
.L809C76F4:
/* 00794 809C76F4 84430AB2 */  lh      $v1, 0x0AB2($v0)           ## 00000AB2
/* 00798 809C76F8 10600002 */  beq     $v1, $zero, .L809C7704     
/* 0079C 809C76FC 246EFFE7 */  addiu   $t6, $v1, 0xFFE7           ## $t6 = FFFFFFE7
/* 007A0 809C7700 A44E0AB2 */  sh      $t6, 0x0AB2($v0)           ## 00000AB2
.L809C7704:
/* 007A4 809C7704 84430AB4 */  lh      $v1, 0x0AB4($v0)           ## 00000AB4
/* 007A8 809C7708 10600002 */  beq     $v1, $zero, .L809C7714     
/* 007AC 809C770C 246FFFE7 */  addiu   $t7, $v1, 0xFFE7           ## $t7 = FFFFFFE7
/* 007B0 809C7710 A44F0AB4 */  sh      $t7, 0x0AB4($v0)           ## 00000AB4
.L809C7714:
/* 007B4 809C7714 861801F8 */  lh      $t8, 0x01F8($s0)           ## 000001F8
/* 007B8 809C7718 8FB90024 */  lw      $t9, 0x0024($sp)           
/* 007BC 809C771C 57000012 */  bnel    $t8, $zero, .L809C7768     
/* 007C0 809C7720 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 007C4 809C7724 8F221C44 */  lw      $v0, 0x1C44($t9)           ## 00001C44
/* 007C8 809C7728 8C43067C */  lw      $v1, 0x067C($v0)           ## 0000067C
/* 007CC 809C772C 30680800 */  andi    $t0, $v1, 0x0800           ## $t0 = 00000000
/* 007D0 809C7730 1100000A */  beq     $t0, $zero, .L809C775C     
/* 007D4 809C7734 00000000 */  nop
/* 007D8 809C7738 8C4903AC */  lw      $t1, 0x03AC($v0)           ## 000003AC
/* 007DC 809C773C 2401F7FF */  addiu   $at, $zero, 0xF7FF         ## $at = FFFFF7FF
/* 007E0 809C7740 00615024 */  and     $t2, $v1, $at              
/* 007E4 809C7744 16090005 */  bne     $s0, $t1, .L809C775C       
/* 007E8 809C7748 00000000 */  nop
/* 007EC 809C774C AC40011C */  sw      $zero, 0x011C($v0)         ## 0000011C
/* 007F0 809C7750 AC4003AC */  sw      $zero, 0x03AC($v0)         ## 000003AC
/* 007F4 809C7754 AC400438 */  sw      $zero, 0x0438($v0)         ## 00000438
/* 007F8 809C7758 AC4A067C */  sw      $t2, 0x067C($v0)           ## 0000067C
.L809C775C:
/* 007FC 809C775C 0C00B55C */  jal     Actor_Kill
              
/* 00800 809C7760 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00804 809C7764 8FBF001C */  lw      $ra, 0x001C($sp)           
.L809C7768:
/* 00808 809C7768 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0080C 809C776C 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00810 809C7770 03E00008 */  jr      $ra                        
/* 00814 809C7774 00000000 */  nop
