glabel func_809670AC
/* 0075C 809670AC 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00760 809670B0 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00764 809670B4 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00768 809670B8 948E0290 */  lhu     $t6, 0x0290($a0)           ## 00000290
/* 0076C 809670BC 9482028E */  lhu     $v0, 0x028E($a0)           ## 0000028E
/* 00770 809670C0 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 00774 809670C4 2841000A */  slti    $at, $v0, 0x000A           
/* 00778 809670C8 10200004 */  beq     $at, $zero, .L809670DC     
/* 0077C 809670CC A48F0290 */  sh      $t7, 0x0290($a0)           ## 00000290
/* 00780 809670D0 24580001 */  addiu   $t8, $v0, 0x0001           ## $t8 = 00000001
/* 00784 809670D4 10000011 */  beq     $zero, $zero, .L8096711C   
/* 00788 809670D8 A498028E */  sh      $t8, 0x028E($a0)           ## 0000028E
.L809670DC:
/* 0078C 809670DC C4800050 */  lwc1    $f0, 0x0050($a0)           ## 00000050
/* 00790 809670E0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 00794 809670E4 3C018097 */  lui     $at, %hi(D_809695DC)       ## $at = 80970000
/* 00798 809670E8 4600203C */  c.lt.s  $f4, $f0                   
/* 0079C 809670EC 00000000 */  nop
/* 007A0 809670F0 45000008 */  bc1f    .L80967114                 
/* 007A4 809670F4 00000000 */  nop
/* 007A8 809670F8 C42695DC */  lwc1    $f6, %lo(D_809695DC)($at)  
/* 007AC 809670FC 46060201 */  sub.s   $f8, $f0, $f6              
/* 007B0 80967100 E4880050 */  swc1    $f8, 0x0050($a0)           ## 00000050
/* 007B4 80967104 0C00B58B */  jal     Actor_SetScale
              
/* 007B8 80967108 8C850050 */  lw      $a1, 0x0050($a0)           ## 00000050
/* 007BC 8096710C 10000004 */  beq     $zero, $zero, .L80967120   
/* 007C0 80967110 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80967114:
/* 007C4 80967114 0C00B55C */  jal     Actor_Kill
              
/* 007C8 80967118 00000000 */  nop
.L8096711C:
/* 007CC 8096711C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80967120:
/* 007D0 80967120 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 007D4 80967124 03E00008 */  jr      $ra                        
/* 007D8 80967128 00000000 */  nop


