glabel func_80B355BC
/* 0190C 80B355BC 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 01910 80B355C0 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 01914 80B355C4 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 01918 80B355C8 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 0191C 80B355CC 8CA31C44 */  lw      $v1, 0x1C44($a1)           ## 00001C44
/* 01920 80B355D0 848200B6 */  lh      $v0, 0x00B6($a0)           ## 000000B6
/* 01924 80B355D4 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 01928 80B355D8 846F00B6 */  lh      $t7, 0x00B6($v1)           ## 000000B6
/* 0192C 80B355DC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 01930 80B355E0 01E2C023 */  subu    $t8, $t7, $v0              
/* 01934 80B355E4 A7B80042 */  sh      $t8, 0x0042($sp)           
/* 01938 80B355E8 8499008A */  lh      $t9, 0x008A($a0)           ## 0000008A
/* 0193C 80B355EC 87AA0042 */  lh      $t2, 0x0042($sp)           
/* 01940 80B355F0 87AB0042 */  lh      $t3, 0x0042($sp)           
/* 01944 80B355F4 03224023 */  subu    $t0, $t9, $v0              
/* 01948 80B355F8 A7A80040 */  sh      $t0, 0x0040($sp)           
/* 0194C 80B355FC C48401A0 */  lwc1    $f4, 0x01A0($a0)           ## 000001A0
/* 01950 80B35600 000B6023 */  subu    $t4, $zero, $t3            
/* 01954 80B35604 4600218D */  trunc.w.s $f6, $f4                   
/* 01958 80B35608 44063000 */  mfc1    $a2, $f6                   
/* 0195C 80B3560C 05430003 */  bgezl   $t2, .L80B3561C            
/* 01960 80B35610 87AD0040 */  lh      $t5, 0x0040($sp)           
/* 01964 80B35614 A7AC0042 */  sh      $t4, 0x0042($sp)           
/* 01968 80B35618 87AD0040 */  lh      $t5, 0x0040($sp)           
.L80B3561C:
/* 0196C 80B3561C 87AE0040 */  lh      $t6, 0x0040($sp)           
/* 01970 80B35620 28C10009 */  slti    $at, $a2, 0x0009           
/* 01974 80B35624 05A10002 */  bgez    $t5, .L80B35630            
/* 01978 80B35628 000E7823 */  subu    $t7, $zero, $t6            
/* 0197C 80B3562C A7AF0040 */  sh      $t7, 0x0040($sp)           
.L80B35630:
/* 01980 80B35630 14200003 */  bne     $at, $zero, .L80B35640     
/* 01984 80B35634 E6080068 */  swc1    $f8, 0x0068($s0)           ## 00000068
/* 01988 80B35638 28C1000D */  slti    $at, $a2, 0x000D           
/* 0198C 80B3563C 14200005 */  bne     $at, $zero, .L80B35654     
.L80B35640:
/* 01990 80B35640 28C10011 */  slti    $at, $a2, 0x0011           
/* 01994 80B35644 1420000E */  bne     $at, $zero, .L80B35680     
/* 01998 80B35648 28C10014 */  slti    $at, $a2, 0x0014           
/* 0199C 80B3564C 5020000D */  beql    $at, $zero, .L80B35684     
/* 019A0 80B35650 A60002F8 */  sh      $zero, 0x02F8($s0)         ## 000002F8
.L80B35654:
/* 019A4 80B35654 861802F8 */  lh      $t8, 0x02F8($s0)           ## 000002F8
/* 019A8 80B35658 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 019AC 80B3565C 2405383F */  addiu   $a1, $zero, 0x383F         ## $a1 = 0000383F
/* 019B0 80B35660 57000005 */  bnel    $t8, $zero, .L80B35678     
/* 019B4 80B35664 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 019B8 80B35668 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 019BC 80B3566C AFA6003C */  sw      $a2, 0x003C($sp)           
/* 019C0 80B35670 8FA6003C */  lw      $a2, 0x003C($sp)           
/* 019C4 80B35674 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
.L80B35678:
/* 019C8 80B35678 10000002 */  beq     $zero, $zero, .L80B35684   
/* 019CC 80B3567C A61902F8 */  sh      $t9, 0x02F8($s0)           ## 000002F8
.L80B35680:
/* 019D0 80B35680 A60002F8 */  sh      $zero, 0x02F8($s0)         ## 000002F8
.L80B35684:
/* 019D4 80B35684 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 019D8 80B35688 14C10012 */  bne     $a2, $at, .L80B356D4       
/* 019DC 80B3568C 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 019E0 80B35690 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 019E4 80B35694 0C00CEA1 */  jal     func_80033A84              
/* 019E8 80B35698 AFA6003C */  sw      $a2, 0x003C($sp)           
/* 019EC 80B3569C 1440000D */  bne     $v0, $zero, .L80B356D4     
/* 019F0 80B356A0 8FA6003C */  lw      $a2, 0x003C($sp)           
/* 019F4 80B356A4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 019F8 80B356A8 24052000 */  addiu   $a1, $zero, 0x2000         ## $a1 = 00002000
/* 019FC 80B356AC 0C00B821 */  jal     func_8002E084              
/* 01A00 80B356B0 AFA6003C */  sw      $a2, 0x003C($sp)           
/* 01A04 80B356B4 1040000C */  beq     $v0, $zero, .L80B356E8     
/* 01A08 80B356B8 8FA6003C */  lw      $a2, 0x003C($sp)           
/* 01A0C 80B356BC 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 01A10 80B356C0 44818000 */  mtc1    $at, $f16                  ## $f16 = 100.00
/* 01A14 80B356C4 C60A0090 */  lwc1    $f10, 0x0090($s0)          ## 00000090
/* 01A18 80B356C8 460A803E */  c.le.s  $f16, $f10                 
/* 01A1C 80B356CC 00000000 */  nop
/* 01A20 80B356D0 45010005 */  bc1t    .L80B356E8                 
.L80B356D4:
/* 01A24 80B356D4 26040188 */  addiu   $a0, $s0, 0x0188           ## $a0 = 00000188
/* 01A28 80B356D8 0C02927F */  jal     SkelAnime_FrameUpdateMatrix
              
/* 01A2C 80B356DC AFA6003C */  sw      $a2, 0x003C($sp)           
/* 01A30 80B356E0 10400085 */  beq     $v0, $zero, .L80B358F8     
/* 01A34 80B356E4 8FA6003C */  lw      $a2, 0x003C($sp)           
.L80B356E8:
/* 01A38 80B356E8 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 01A3C 80B356EC 10C10029 */  beq     $a2, $at, .L80B35794       
/* 01A40 80B356F0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01A44 80B356F4 8E0202E8 */  lw      $v0, 0x02E8($s0)           ## 000002E8
/* 01A48 80B356F8 10400026 */  beq     $v0, $zero, .L80B35794     
/* 01A4C 80B356FC 2448FFFC */  addiu   $t0, $v0, 0xFFFC           ## $t0 = FFFFFFFC
/* 01A50 80B35700 44889000 */  mtc1    $t0, $f18                  ## $f18 = NaN
/* 01A54 80B35704 3C0180B3 */  lui     $at, %hi(D_80B37B9C)       ## $at = 80B30000
/* 01A58 80B35708 C4267B9C */  lwc1    $f6, %lo(D_80B37B9C)($at)  
/* 01A5C 80B3570C 46809120 */  cvt.s.w $f4, $f18                  
/* 01A60 80B35710 3C013FC0 */  lui     $at, 0x3FC0                ## $at = 3FC00000
/* 01A64 80B35714 44815000 */  mtc1    $at, $f10                  ## $f10 = 1.50
/* 01A68 80B35718 3C0180B3 */  lui     $at, %hi(D_80B37BA0)       ## $at = 80B30000
/* 01A6C 80B3571C C4327BA0 */  lwc1    $f18, %lo(D_80B37BA0)($at) 
/* 01A70 80B35720 860D00B6 */  lh      $t5, 0x00B6($s0)           ## 000000B6
/* 01A74 80B35724 46062202 */  mul.s   $f8, $f4, $f6              
/* 01A78 80B35728 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 01A7C 80B3572C 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 01A80 80B35730 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 01A84 80B35734 24180032 */  addiu   $t8, $zero, 0x0032         ## $t8 = 00000032
/* 01A88 80B35738 24190032 */  addiu   $t9, $zero, 0x0032         ## $t9 = 00000032
/* 01A8C 80B3573C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 01A90 80B35740 46085400 */  add.s   $f16, $f10, $f8            
/* 01A94 80B35744 44815000 */  mtc1    $at, $f10                  ## $f10 = 2.00
/* 01A98 80B35748 26060024 */  addiu   $a2, $s0, 0x0024           ## $a2 = 00000024
/* 01A9C 80B3574C 3C074170 */  lui     $a3, 0x4170                ## $a3 = 41700000
/* 01AA0 80B35750 46109102 */  mul.s   $f4, $f18, $f16            
/* 01AA4 80B35754 4600218D */  trunc.w.s $f6, $f4                   
/* 01AA8 80B35758 440C3000 */  mfc1    $t4, $f6                   
/* 01AAC 80B3575C 00000000 */  nop
/* 01AB0 80B35760 01AC7021 */  addu    $t6, $t5, $t4              
/* 01AB4 80B35764 A60E00B6 */  sh      $t6, 0x00B6($s0)           ## 000000B6
/* 01AB8 80B35768 AFA80020 */  sw      $t0, 0x0020($sp)           
/* 01ABC 80B3576C AFB9001C */  sw      $t9, 0x001C($sp)           
/* 01AC0 80B35770 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 01AC4 80B35774 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 01AC8 80B35778 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 01ACC 80B3577C 0C00CC98 */  jal     func_80033260              
/* 01AD0 80B35780 E7AA0014 */  swc1    $f10, 0x0014($sp)          
/* 01AD4 80B35784 8E0902E8 */  lw      $t1, 0x02E8($s0)           ## 000002E8
/* 01AD8 80B35788 252AFFFF */  addiu   $t2, $t1, 0xFFFF           ## $t2 = FFFFFFFF
/* 01ADC 80B3578C 1000005A */  beq     $zero, $zero, .L80B358F8   
/* 01AE0 80B35790 AE0A02E8 */  sw      $t2, 0x02E8($s0)           ## 000002E8
.L80B35794:
/* 01AE4 80B35794 24051554 */  addiu   $a1, $zero, 0x1554         ## $a1 = 00001554
/* 01AE8 80B35798 0C00B821 */  jal     func_8002E084              
/* 01AEC 80B3579C AFA6003C */  sw      $a2, 0x003C($sp)           
/* 01AF0 80B357A0 14400017 */  bne     $v0, $zero, .L80B35800     
/* 01AF4 80B357A4 8FA6003C */  lw      $a2, 0x003C($sp)           
/* 01AF8 80B357A8 2401000F */  addiu   $at, $zero, 0x000F         ## $at = 0000000F
/* 01AFC 80B357AC 10C10014 */  beq     $a2, $at, .L80B35800       
/* 01B00 80B357B0 00000000 */  nop
/* 01B04 80B357B4 0C2CD157 */  jal     func_80B3455C              
/* 01B08 80B357B8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B0C 80B357BC 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01B10 80B357C0 00000000 */  nop
/* 01B14 80B357C4 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 01B18 80B357C8 44811000 */  mtc1    $at, $f2                   ## $f2 = 5.00
/* 01B1C 80B357CC 240E0007 */  addiu   $t6, $zero, 0x0007         ## $t6 = 00000007
/* 01B20 80B357D0 46020202 */  mul.s   $f8, $f0, $f2              
/* 01B24 80B357D4 46024480 */  add.s   $f18, $f8, $f2             
/* 01B28 80B357D8 4600940D */  trunc.w.s $f16, $f18                 
/* 01B2C 80B357DC 440D8000 */  mfc1    $t5, $f16                  
/* 01B30 80B357E0 00000000 */  nop
/* 01B34 80B357E4 AE0D02E8 */  sw      $t5, 0x02E8($s0)           ## 000002E8
/* 01B38 80B357E8 87AC0040 */  lh      $t4, 0x0040($sp)           
/* 01B3C 80B357EC 298132C9 */  slti    $at, $t4, 0x32C9           
/* 01B40 80B357F0 54200042 */  bnel    $at, $zero, .L80B358FC     
/* 01B44 80B357F4 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 01B48 80B357F8 1000003F */  beq     $zero, $zero, .L80B358F8   
/* 01B4C 80B357FC A60E02E2 */  sh      $t6, 0x02E2($s0)           ## 000002E2
.L80B35800:
/* 01B50 80B35800 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01B54 80B35804 00000000 */  nop
/* 01B58 80B35808 3C0180B3 */  lui     $at, %hi(D_80B37BA4)       ## $at = 80B30000
/* 01B5C 80B3580C C4247BA4 */  lwc1    $f4, %lo(D_80B37BA4)($at)  
/* 01B60 80B35810 3C0142F0 */  lui     $at, 0x42F0                ## $at = 42F00000
/* 01B64 80B35814 4600203C */  c.lt.s  $f4, $f0                   
/* 01B68 80B35818 00000000 */  nop
/* 01B6C 80B3581C 45010008 */  bc1t    .L80B35840                 
/* 01B70 80B35820 00000000 */  nop
/* 01B74 80B35824 C6060090 */  lwc1    $f6, 0x0090($s0)           ## 00000090
/* 01B78 80B35828 44815000 */  mtc1    $at, $f10                  ## $f10 = 120.00
/* 01B7C 80B3582C 00000000 */  nop
/* 01B80 80B35830 4606503E */  c.le.s  $f10, $f6                  
/* 01B84 80B35834 00000000 */  nop
/* 01B88 80B35838 4502000F */  bc1fl   .L80B35878                 
/* 01B8C 80B3583C 8619008A */  lh      $t9, 0x008A($s0)           ## 0000008A
.L80B35840:
/* 01B90 80B35840 0C2CD157 */  jal     func_80B3455C              
/* 01B94 80B35844 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B98 80B35848 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01B9C 80B3584C 00000000 */  nop
/* 01BA0 80B35850 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 01BA4 80B35854 44811000 */  mtc1    $at, $f2                   ## $f2 = 5.00
/* 01BA8 80B35858 00000000 */  nop
/* 01BAC 80B3585C 46020202 */  mul.s   $f8, $f0, $f2              
/* 01BB0 80B35860 46024480 */  add.s   $f18, $f8, $f2             
/* 01BB4 80B35864 4600940D */  trunc.w.s $f16, $f18                 
/* 01BB8 80B35868 44188000 */  mfc1    $t8, $f16                  
/* 01BBC 80B3586C 10000022 */  beq     $zero, $zero, .L80B358F8   
/* 01BC0 80B35870 AE1802E8 */  sw      $t8, 0x02E8($s0)           ## 000002E8
/* 01BC4 80B35874 8619008A */  lh      $t9, 0x008A($s0)           ## 0000008A
.L80B35878:
/* 01BC8 80B35878 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 01BCC 80B3587C A6190032 */  sh      $t9, 0x0032($s0)           ## 00000032
/* 01BD0 80B35880 3C0180B3 */  lui     $at, %hi(D_80B37BA8)       ## $at = 80B30000
/* 01BD4 80B35884 C4247BA8 */  lwc1    $f4, %lo(D_80B37BA8)($at)  
/* 01BD8 80B35888 87A80042 */  lh      $t0, 0x0042($sp)           
/* 01BDC 80B3588C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BE0 80B35890 4600203C */  c.lt.s  $f4, $f0                   
/* 01BE4 80B35894 29012711 */  slti    $at, $t0, 0x2711           
/* 01BE8 80B35898 45000005 */  bc1f    .L80B358B0                 
/* 01BEC 80B3589C 00000000 */  nop
/* 01BF0 80B358A0 0C2CD96A */  jal     func_80B365A8              
/* 01BF4 80B358A4 8FA5004C */  lw      $a1, 0x004C($sp)           
/* 01BF8 80B358A8 10000014 */  beq     $zero, $zero, .L80B358FC   
/* 01BFC 80B358AC 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L80B358B0:
/* 01C00 80B358B0 1020000F */  beq     $at, $zero, .L80B358F0     
/* 01C04 80B358B4 87A90040 */  lh      $t1, 0x0040($sp)           
/* 01C08 80B358B8 29213E81 */  slti    $at, $t1, 0x3E81           
/* 01C0C 80B358BC 14200007 */  bne     $at, $zero, .L80B358DC     
/* 01C10 80B358C0 8FA4004C */  lw      $a0, 0x004C($sp)           
/* 01C14 80B358C4 860A008A */  lh      $t2, 0x008A($s0)           ## 0000008A
/* 01C18 80B358C8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01C1C 80B358CC 0C2CD3CA */  jal     func_80B34F28              
/* 01C20 80B358D0 A60A0032 */  sh      $t2, 0x0032($s0)           ## 00000032
/* 01C24 80B358D4 10000009 */  beq     $zero, $zero, .L80B358FC   
/* 01C28 80B358D8 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L80B358DC:
/* 01C2C 80B358DC 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 01C30 80B358E0 0C2CCFEC */  jal     func_80B33FB0              
/* 01C34 80B358E4 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 01C38 80B358E8 10000004 */  beq     $zero, $zero, .L80B358FC   
/* 01C3C 80B358EC 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L80B358F0:
/* 01C40 80B358F0 0C2CD3CA */  jal     func_80B34F28              
/* 01C44 80B358F4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B358F8:
/* 01C48 80B358F8 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L80B358FC:
/* 01C4C 80B358FC 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 01C50 80B35900 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 01C54 80B35904 03E00008 */  jr      $ra                        
/* 01C58 80B35908 00000000 */  nop

