glabel func_808A6A94
/* 00884 808A6A94 90820169 */  lbu     $v0, 0x0169($a0)           ## 00000169
/* 00888 808A6A98 24070003 */  addiu   $a3, $zero, 0x0003         ## $a3 = 00000003
/* 0088C 808A6A9C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00890 808A6AA0 10E20003 */  beq     $a3, $v0, .L808A6AB0       
/* 00894 808A6AA4 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00898 808A6AA8 5441001B */  bnel    $v0, $at, .L808A6B18       
/* 0089C 808A6AAC 8C86011C */  lw      $a2, 0x011C($a0)           ## 0000011C
.L808A6AB0:
/* 008A0 808A6AB0 8C86011C */  lw      $a2, 0x011C($a0)           ## 0000011C
/* 008A4 808A6AB4 C484002C */  lwc1    $f4, 0x002C($a0)           ## 0000002C
/* 008A8 808A6AB8 C4C8002C */  lwc1    $f8, 0x002C($a2)           ## 0000002C
/* 008AC 808A6ABC 4600218D */  trunc.w.s $f6, $f4                   
/* 008B0 808A6AC0 4600428D */  trunc.w.s $f10, $f8                  
/* 008B4 808A6AC4 44033000 */  mfc1    $v1, $f6                   
/* 008B8 808A6AC8 44055000 */  mfc1    $a1, $f10                  
/* 008BC 808A6ACC 54E2000A */  bnel    $a3, $v0, .L808A6AF8       
/* 008C0 808A6AD0 C4C80024 */  lwc1    $f8, 0x0024($a2)           ## 00000024
/* 008C4 808A6AD4 C4900024 */  lwc1    $f16, 0x0024($a0)          ## 00000024
/* 008C8 808A6AD8 C4C40024 */  lwc1    $f4, 0x0024($a2)           ## 00000024
/* 008CC 808A6ADC 4600848D */  trunc.w.s $f18, $f16                 
/* 008D0 808A6AE0 4600218D */  trunc.w.s $f6, $f4                   
/* 008D4 808A6AE4 44079000 */  mfc1    $a3, $f18                  
/* 008D8 808A6AE8 44083000 */  mfc1    $t0, $f6                   
/* 008DC 808A6AEC 10000021 */  beq     $zero, $zero, .L808A6B74   
/* 008E0 808A6AF0 00000000 */  nop
/* 008E4 808A6AF4 C4C80024 */  lwc1    $f8, 0x0024($a2)           ## 00000024
.L808A6AF8:
/* 008E8 808A6AF8 C4900024 */  lwc1    $f16, 0x0024($a0)          ## 00000024
/* 008EC 808A6AFC 4600428D */  trunc.w.s $f10, $f8                  
/* 008F0 808A6B00 4600848D */  trunc.w.s $f18, $f16                 
/* 008F4 808A6B04 44075000 */  mfc1    $a3, $f10                  
/* 008F8 808A6B08 44089000 */  mfc1    $t0, $f18                  
/* 008FC 808A6B0C 10000019 */  beq     $zero, $zero, .L808A6B74   
/* 00900 808A6B10 00000000 */  nop
/* 00904 808A6B14 8C86011C */  lw      $a2, 0x011C($a0)           ## 0000011C
.L808A6B18:
/* 00908 808A6B18 C4840024 */  lwc1    $f4, 0x0024($a0)           ## 00000024
/* 0090C 808A6B1C C4C80024 */  lwc1    $f8, 0x0024($a2)           ## 00000024
/* 00910 808A6B20 4600218D */  trunc.w.s $f6, $f4                   
/* 00914 808A6B24 4600428D */  trunc.w.s $f10, $f8                  
/* 00918 808A6B28 44033000 */  mfc1    $v1, $f6                   
/* 0091C 808A6B2C 44055000 */  mfc1    $a1, $f10                  
/* 00920 808A6B30 5440000A */  bnel    $v0, $zero, .L808A6B5C     
/* 00924 808A6B34 C4C8002C */  lwc1    $f8, 0x002C($a2)           ## 0000002C
/* 00928 808A6B38 C490002C */  lwc1    $f16, 0x002C($a0)          ## 0000002C
/* 0092C 808A6B3C C4C4002C */  lwc1    $f4, 0x002C($a2)           ## 0000002C
/* 00930 808A6B40 4600848D */  trunc.w.s $f18, $f16                 
/* 00934 808A6B44 4600218D */  trunc.w.s $f6, $f4                   
/* 00938 808A6B48 44079000 */  mfc1    $a3, $f18                  
/* 0093C 808A6B4C 44083000 */  mfc1    $t0, $f6                   
/* 00940 808A6B50 10000008 */  beq     $zero, $zero, .L808A6B74   
/* 00944 808A6B54 00000000 */  nop
/* 00948 808A6B58 C4C8002C */  lwc1    $f8, 0x002C($a2)           ## 0000002C
.L808A6B5C:
/* 0094C 808A6B5C C490002C */  lwc1    $f16, 0x002C($a0)          ## 0000002C
/* 00950 808A6B60 4600428D */  trunc.w.s $f10, $f8                  
/* 00954 808A6B64 4600848D */  trunc.w.s $f18, $f16                 
/* 00958 808A6B68 44075000 */  mfc1    $a3, $f10                  
/* 0095C 808A6B6C 44089000 */  mfc1    $t0, $f18                  
/* 00960 808A6B70 00000000 */  nop
.L808A6B74:
/* 00964 808A6B74 1465000B */  bne     $v1, $a1, .L808A6BA4       
/* 00968 808A6B78 0107C823 */  subu    $t9, $t0, $a3              
/* 0096C 808A6B7C 2401003C */  addiu   $at, $zero, 0x003C         ## $at = 0000003C
/* 00970 808A6B80 17210008 */  bne     $t9, $at, .L808A6BA4       
/* 00974 808A6B84 3C03808B */  lui     $v1, %hi(D_808A80A0)       ## $v1 = 808B0000
/* 00978 808A6B88 246380A0 */  addiu   $v1, $v1, %lo(D_808A80A0)  ## $v1 = 808A80A0
/* 0097C 808A6B8C 90690000 */  lbu     $t1, 0x0000($v1)           ## 808A80A0
/* 00980 808A6B90 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00984 808A6B94 004A5804 */  sllv    $t3, $t2, $v0              
/* 00988 808A6B98 012B6025 */  or      $t4, $t1, $t3              ## $t4 = 00000000
/* 0098C 808A6B9C 03E00008 */  jr      $ra                        
/* 00990 808A6BA0 A06C0000 */  sb      $t4, 0x0000($v1)           ## 808A80A0
.L808A6BA4:
/* 00994 808A6BA4 3C03808B */  lui     $v1, %hi(D_808A80A0)       ## $v1 = 808B0000
/* 00998 808A6BA8 246380A0 */  addiu   $v1, $v1, %lo(D_808A80A0)  ## $v1 = 808A80A0
/* 0099C 808A6BAC 906D0000 */  lbu     $t5, 0x0000($v1)           ## 808A80A0
/* 009A0 808A6BB0 004E7804 */  sllv    $t7, $t6, $v0              
/* 009A4 808A6BB4 01E0C027 */  nor     $t8, $t7, $zero            
/* 009A8 808A6BB8 01B8C824 */  and     $t9, $t5, $t8              
/* 009AC 808A6BBC A0790000 */  sb      $t9, 0x0000($v1)           ## 808A80A0
/* 009B0 808A6BC0 03E00008 */  jr      $ra                        
/* 009B4 808A6BC4 00000000 */  nop


