.late_rodata
glabel D_80883660
    .float 0.005
glabel D_80883664
    .float 0.025
glabel D_80883668
    .float 3000

.text
glabel BgHakaZou_Init
/* 00000 808825C0 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00004 808825C4 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00008 808825C8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0000C 808825CC AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00010 808825D0 3C058088 */  lui     $a1, %hi(D_80883648)       ## $a1 = 80880000
/* 00014 808825D4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00018 808825D8 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 0001C 808825DC 24A53648 */  addiu   $a1, $a1, %lo(D_80883648)  ## $a1 = 80883648
/* 00020 808825E0 8619001C */  lh      $t9, 0x001C($s0)           ## 0000001C
/* 00024 808825E4 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 00028 808825E8 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0002C 808825EC 332800FF */  andi    $t0, $t9, 0x00FF           ## $t0 = 00000000
/* 00030 808825F0 A608001C */  sh      $t0, 0x001C($s0)           ## 0000001C
/* 00034 808825F4 8609001C */  lh      $t1, 0x001C($s0)           ## 0000001C
/* 00038 808825F8 000EC203 */  sra     $t8, $t6,  8               
/* 0003C 808825FC A2180169 */  sb      $t8, 0x0169($s0)           ## 00000169
/* 00040 80882600 15210052 */  bne     $t1, $at, .L8088274C       
/* 00044 80882604 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00048 80882608 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0004C 8088260C 00000000 */  nop
/* 00050 80882610 3C018088 */  lui     $at, %hi(D_80883660)       ## $at = 80880000
/* 00054 80882614 C4243660 */  lwc1    $f4, %lo(D_80883660)($at)  
/* 00058 80882618 3C018088 */  lui     $at, %hi(D_80883664)       ## $at = 80880000
/* 0005C 8088261C C4283664 */  lwc1    $f8, %lo(D_80883664)($at)  
/* 00060 80882620 46040182 */  mul.s   $f6, $f0, $f4              
/* 00064 80882624 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00068 80882628 46083280 */  add.s   $f10, $f6, $f8             
/* 0006C 8088262C 44055000 */  mfc1    $a1, $f10                  
/* 00070 80882630 0C00B58B */  jal     Actor_SetScale
              
/* 00074 80882634 00000000 */  nop
/* 00078 80882638 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 0007C 8088263C 00000000 */  nop
/* 00080 80882640 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00084 80882644 E6000068 */  swc1    $f0, 0x0068($s0)           ## 00000068
/* 00088 80882648 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 0008C 8088264C 44818000 */  mtc1    $at, $f16                  ## $f16 = 0.50
/* 00090 80882650 3C014580 */  lui     $at, 0x4580                ## $at = 45800000
/* 00094 80882654 44816000 */  mtc1    $at, $f12                  ## $f12 = 4096.00
/* 00098 80882658 4610003C */  c.lt.s  $f0, $f16                  
/* 0009C 8088265C 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 000A0 80882660 45000003 */  bc1f    .L80882670                 
/* 000A4 80882664 00000000 */  nop
/* 000A8 80882668 10000001 */  beq     $zero, $zero, .L80882670   
/* 000AC 8088266C 2403FFFF */  addiu   $v1, $zero, 0xFFFF         ## $v1 = FFFFFFFF
.L80882670:
/* 000B0 80882670 0C00CFC8 */  jal     Math_Rand_CenteredFloat
              
/* 000B4 80882674 AFA30028 */  sw      $v1, 0x0028($sp)           
/* 000B8 80882678 8FA30028 */  lw      $v1, 0x0028($sp)           
/* 000BC 8088267C 860A00B6 */  lh      $t2, 0x00B6($s0)           ## 000000B6
/* 000C0 80882680 240E0014 */  addiu   $t6, $zero, 0x0014         ## $t6 = 00000014
/* 000C4 80882684 A60E016A */  sh      $t6, 0x016A($s0)           ## 0000016A
/* 000C8 80882688 01430019 */  multu   $t2, $v1                   
/* 000CC 8088268C 24040100 */  addiu   $a0, $zero, 0x0100         ## $a0 = 00000100
/* 000D0 80882690 24050300 */  addiu   $a1, $zero, 0x0300         ## $a1 = 00000300
/* 000D4 80882694 00005812 */  mflo    $t3                        
/* 000D8 80882698 448B9000 */  mtc1    $t3, $f18                  ## $f18 = 0.00
/* 000DC 8088269C 00000000 */  nop
/* 000E0 808826A0 46809120 */  cvt.s.w $f4, $f18                  
/* 000E4 808826A4 46040180 */  add.s   $f6, $f0, $f4              
/* 000E8 808826A8 4600320D */  trunc.w.s $f8, $f6                   
/* 000EC 808826AC 440D4000 */  mfc1    $t5, $f8                   
/* 000F0 808826B0 0C01DF64 */  jal     Math_Rand_S16Offset
              
/* 000F4 808826B4 A60D0032 */  sh      $t5, 0x0032($s0)           ## 00000032
/* 000F8 808826B8 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 000FC 808826BC A7A20026 */  sh      $v0, 0x0026($sp)           
/* 00100 808826C0 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 00104 808826C4 44815000 */  mtc1    $at, $f10                  ## $f10 = 0.50
/* 00108 808826C8 87AF0026 */  lh      $t7, 0x0026($sp)           
/* 0010C 808826CC 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 00110 808826D0 460A003C */  c.lt.s  $f0, $f10                  
/* 00114 808826D4 00000000 */  nop
/* 00118 808826D8 45000003 */  bc1f    .L808826E8                 
/* 0011C 808826DC 00000000 */  nop
/* 00120 808826E0 10000001 */  beq     $zero, $zero, .L808826E8   
/* 00124 808826E4 2403FFFF */  addiu   $v1, $zero, 0xFFFF         ## $v1 = FFFFFFFF
.L808826E8:
/* 00128 808826E8 006F0019 */  multu   $v1, $t7                   
/* 0012C 808826EC 24040400 */  addiu   $a0, $zero, 0x0400         ## $a0 = 00000400
/* 00130 808826F0 24050800 */  addiu   $a1, $zero, 0x0800         ## $a1 = 00000800
/* 00134 808826F4 0000C012 */  mflo    $t8                        
/* 00138 808826F8 A6180030 */  sh      $t8, 0x0030($s0)           ## 00000030
/* 0013C 808826FC 0C01DF64 */  jal     Math_Rand_S16Offset
              
/* 00140 80882700 00000000 */  nop
/* 00144 80882704 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 00148 80882708 A7A20026 */  sh      $v0, 0x0026($sp)           
/* 0014C 8088270C 3C013F00 */  lui     $at, 0x3F00                ## $at = 3F000000
/* 00150 80882710 44818000 */  mtc1    $at, $f16                  ## $f16 = 0.50
/* 00154 80882714 87B90026 */  lh      $t9, 0x0026($sp)           
/* 00158 80882718 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 0015C 8088271C 4610003C */  c.lt.s  $f0, $f16                  
/* 00160 80882720 00000000 */  nop
/* 00164 80882724 45000003 */  bc1f    .L80882734                 
/* 00168 80882728 00000000 */  nop
/* 0016C 8088272C 10000001 */  beq     $zero, $zero, .L80882734   
/* 00170 80882730 2403FFFF */  addiu   $v1, $zero, 0xFFFF         ## $v1 = FFFFFFFF
.L80882734:
/* 00174 80882734 00790019 */  multu   $v1, $t9                   
/* 00178 80882738 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 0017C 8088273C 00004012 */  mflo    $t0                        
/* 00180 80882740 A6080034 */  sh      $t0, 0x0034($s0)           ## 00000034
/* 00184 80882744 1000001C */  beq     $zero, $zero, .L808827B8   
/* 00188 80882748 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
.L8088274C:
/* 0018C 8088274C 2605016C */  addiu   $a1, $s0, 0x016C           ## $a1 = 0000016C
/* 00190 80882750 0C0170D9 */  jal     Collider_InitCylinder
              
/* 00194 80882754 AFA50020 */  sw      $a1, 0x0020($sp)           
/* 00198 80882758 3C078088 */  lui     $a3, %hi(D_808835F0)       ## $a3 = 80880000
/* 0019C 8088275C 24E735F0 */  addiu   $a3, $a3, %lo(D_808835F0)  ## $a3 = 808835F0
/* 001A0 80882760 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 001A4 80882764 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 001A8 80882768 0C01712B */  jal     Collider_SetCylinder
              
/* 001AC 8088276C 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 001B0 80882770 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001B4 80882774 0C0189B7 */  jal     Collider_CylinderUpdate
              
/* 001B8 80882778 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 001BC 8088277C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001C0 80882780 0C010D20 */  jal     func_80043480
              
/* 001C4 80882784 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 001C8 80882788 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 001CC 8088278C 3C018088 */  lui     $at, %hi(D_80883668)       ## $at = 80880000
/* 001D0 80882790 54400009 */  bnel    $v0, $zero, .L808827B8     
/* 001D4 80882794 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 001D8 80882798 C4203668 */  lwc1    $f0, %lo(D_80883668)($at)  
/* 001DC 8088279C 3C0144FA */  lui     $at, 0x44FA                ## $at = 44FA0000
/* 001E0 808827A0 44819000 */  mtc1    $at, $f18                  ## $f18 = 2000.00
/* 001E4 808827A4 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 001E8 808827A8 E60000F8 */  swc1    $f0, 0x00F8($s0)           ## 000000F8
/* 001EC 808827AC E60000FC */  swc1    $f0, 0x00FC($s0)           ## 000000FC
/* 001F0 808827B0 E61200F4 */  swc1    $f18, 0x00F4($s0)          ## 000000F4
/* 001F4 808827B4 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
.L808827B8:
/* 001F8 808827B8 14410009 */  bne     $v0, $at, .L808827E0       
/* 001FC 808827BC 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00200 808827C0 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00204 808827C4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00208 808827C8 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 0020C 808827CC 2405008D */  addiu   $a1, $zero, 0x008D         ## $a1 = 0000008D
/* 00210 808827D0 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 00214 808827D4 00812021 */  addu    $a0, $a0, $at              
/* 00218 808827D8 10000007 */  beq     $zero, $zero, .L808827F8   
/* 0021C 808827DC A2020168 */  sb      $v0, 0x0168($s0)           ## 00000168
.L808827E0:
/* 00220 808827E0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00224 808827E4 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 00228 808827E8 00812021 */  addu    $a0, $a0, $at              
/* 0022C 808827EC 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 00230 808827F0 24050069 */  addiu   $a1, $zero, 0x0069         ## $a1 = 00000069
/* 00234 808827F4 A2020168 */  sb      $v0, 0x0168($s0)           ## 00000168
.L808827F8:
/* 00238 808827F8 82090168 */  lb      $t1, 0x0168($s0)           ## 00000168
/* 0023C 808827FC 05230006 */  bgezl   $t1, .L80882818            
/* 00240 80882800 860A001C */  lh      $t2, 0x001C($s0)           ## 0000001C
/* 00244 80882804 0C00B55C */  jal     Actor_Kill
              
/* 00248 80882808 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0024C 8088280C 1000001D */  beq     $zero, $zero, .L80882884   
/* 00250 80882810 00000000 */  nop
/* 00254 80882814 860A001C */  lh      $t2, 0x001C($s0)           ## 0000001C
.L80882818:
/* 00258 80882818 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0025C 8088281C 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00260 80882820 11410018 */  beq     $t2, $at, .L80882884       
/* 00264 80882824 00000000 */  nop
/* 00268 80882828 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 0026C 8088282C 92050169 */  lbu     $a1, 0x0169($s0)           ## 00000169
/* 00270 80882830 10400014 */  beq     $v0, $zero, .L80882884     
/* 00274 80882834 00000000 */  nop
/* 00278 80882838 860B001C */  lh      $t3, 0x001C($s0)           ## 0000001C
/* 0027C 8088283C 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 00280 80882840 51600006 */  beql    $t3, $zero, .L8088285C     
/* 00284 80882844 44813000 */  mtc1    $at, $f6                   ## $f6 = 80.00
/* 00288 80882848 0C00B55C */  jal     Actor_Kill
              
/* 0028C 8088284C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00290 80882850 1000000C */  beq     $zero, $zero, .L80882884   
/* 00294 80882854 00000000 */  nop
/* 00298 80882858 44813000 */  mtc1    $at, $f6                   ## $f6 = 0.00
.L8088285C:
/* 0029C 8088285C 3C014258 */  lui     $at, 0x4258                ## $at = 42580000
/* 002A0 80882860 C604002C */  lwc1    $f4, 0x002C($s0)           ## 0000002C
/* 002A4 80882864 44818000 */  mtc1    $at, $f16                  ## $f16 = 54.00
/* 002A8 80882868 C60A0028 */  lwc1    $f10, 0x0028($s0)          ## 00000028
/* 002AC 8088286C 46062201 */  sub.s   $f8, $f4, $f6              
/* 002B0 80882870 240CC000 */  addiu   $t4, $zero, 0xC000         ## $t4 = FFFFC000
/* 002B4 80882874 A60C00B4 */  sh      $t4, 0x00B4($s0)           ## 000000B4
/* 002B8 80882878 46105481 */  sub.s   $f18, $f10, $f16           
/* 002BC 8088287C E608002C */  swc1    $f8, 0x002C($s0)           ## 0000002C
/* 002C0 80882880 E6120028 */  swc1    $f18, 0x0028($s0)          ## 00000028
.L80882884:
/* 002C4 80882884 3C0D8088 */  lui     $t5, %hi(func_80882A70)    ## $t5 = 80880000
/* 002C8 80882888 25AD2A70 */  addiu   $t5, $t5, %lo(func_80882A70) ## $t5 = 80882A70
/* 002CC 8088288C AE0D0164 */  sw      $t5, 0x0164($s0)           ## 00000164
/* 002D0 80882890 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 002D4 80882894 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 002D8 80882898 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 002DC 8088289C 03E00008 */  jr      $ra                        
/* 002E0 808828A0 00000000 */  nop
