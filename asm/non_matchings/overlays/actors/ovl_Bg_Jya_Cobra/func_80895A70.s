glabel func_80895A70
/* 00180 80895A70 27BDFFC0 */  addiu   $sp, $sp, 0xFFC0           ## $sp = FFFFFFC0
/* 00184 80895A74 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00188 80895A78 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 0018C 80895A7C 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 00190 80895A80 8C830118 */  lw      $v1, 0x0118($a0)           ## 00000118
/* 00194 80895A84 30420003 */  andi    $v0, $v0, 0x0003           ## $v0 = 00000000
/* 00198 80895A88 10400007 */  beq     $v0, $zero, .L80895AA8     
/* 0019C 80895A8C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 001A0 80895A90 1041000D */  beq     $v0, $at, .L80895AC8       
/* 001A4 80895A94 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 001A8 80895A98 50410011 */  beql    $v0, $at, .L80895AE0       
/* 001AC 80895A9C 8C620168 */  lw      $v0, 0x0168($v1)           ## 00000168
/* 001B0 80895AA0 10000011 */  beq     $zero, $zero, .L80895AE8   
/* 001B4 80895AA4 8FA20034 */  lw      $v0, 0x0034($sp)           
.L80895AA8:
/* 001B8 80895AA8 8CC3011C */  lw      $v1, 0x011C($a2)           ## 0000011C
/* 001BC 80895AAC 1060004B */  beq     $v1, $zero, .L80895BDC     
/* 001C0 80895AB0 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
/* 001C4 80895AB4 8C6E0130 */  lw      $t6, 0x0130($v1)           ## 00000130
/* 001C8 80895AB8 55C0000C */  bnel    $t6, $zero, .L80895AEC     
/* 001CC 80895ABC 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 001D0 80895AC0 10000046 */  beq     $zero, $zero, .L80895BDC   
/* 001D4 80895AC4 ACC0011C */  sw      $zero, 0x011C($a2)         ## 0000011C
.L80895AC8:
/* 001D8 80895AC8 8C620164 */  lw      $v0, 0x0164($v1)           ## 00000164
/* 001DC 80895ACC 54400007 */  bnel    $v0, $zero, .L80895AEC     
/* 001E0 80895AD0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 001E4 80895AD4 10000042 */  beq     $zero, $zero, .L80895BE0   
/* 001E8 80895AD8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 001EC 80895ADC 8C620168 */  lw      $v0, 0x0168($v1)           ## 00000168
.L80895AE0:
/* 001F0 80895AE0 5040003F */  beql    $v0, $zero, .L80895BE0     
/* 001F4 80895AE4 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80895AE8:
/* 001F8 80895AE8 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
.L80895AEC:
/* 001FC 80895AEC C4C6018C */  lwc1    $f6, 0x018C($a2)           ## 0000018C
/* 00200 80895AF0 240F0001 */  addiu   $t7, $zero, 0x0001         ## $t7 = 00000001
/* 00204 80895AF4 2444027C */  addiu   $a0, $v0, 0x027C           ## $a0 = 0000027C
/* 00208 80895AF8 4604303E */  c.le.s  $f6, $f4                   
/* 0020C 80895AFC 24C50180 */  addiu   $a1, $a2, 0x0180           ## $a1 = 00000180
/* 00210 80895B00 45020004 */  bc1fl   .L80895B14                 
/* 00214 80895B04 A04002AE */  sb      $zero, 0x02AE($v0)         ## 000002AE
/* 00218 80895B08 10000034 */  beq     $zero, $zero, .L80895BDC   
/* 0021C 80895B0C A04F02AE */  sb      $t7, 0x02AE($v0)           ## 000002AE
/* 00220 80895B10 A04002AE */  sb      $zero, 0x02AE($v0)         ## 000002AE
.L80895B14:
/* 00224 80895B14 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00228 80895B18 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 0022C 80895B1C 0C01DF90 */  jal     Math_Vec3f_Copy
              ## Vec3f_Copy
/* 00230 80895B20 AFA20034 */  sw      $v0, 0x0034($sp)           
/* 00234 80895B24 8FA60040 */  lw      $a2, 0x0040($sp)           
/* 00238 80895B28 3C018089 */  lui     $at, %hi(D_808976FC)       ## $at = 80890000
/* 0023C 80895B2C C43076FC */  lwc1    $f16, %lo(D_808976FC)($at) 
/* 00240 80895B30 84D800B6 */  lh      $t8, 0x00B6($a2)           ## 000000B6
/* 00244 80895B34 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00248 80895B38 44984000 */  mtc1    $t8, $f8                   ## $f8 = 0.00
/* 0024C 80895B3C 00000000 */  nop
/* 00250 80895B40 468042A0 */  cvt.s.w $f10, $f8                  
/* 00254 80895B44 46105302 */  mul.s   $f12, $f10, $f16           
/* 00258 80895B48 0C034348 */  jal     Matrix_RotateY              
/* 0025C 80895B4C 00000000 */  nop
/* 00260 80895B50 8FA60040 */  lw      $a2, 0x0040($sp)           
/* 00264 80895B54 3C0A8089 */  lui     $t2, %hi(D_80897308)       ## $t2 = 80890000
/* 00268 80895B58 3C018089 */  lui     $at, %hi(D_80897700)       ## $at = 80890000
/* 0026C 80895B5C 84D9001C */  lh      $t9, 0x001C($a2)           ## 0000001C
/* 00270 80895B60 C4267700 */  lwc1    $f6, %lo(D_80897700)($at)  
/* 00274 80895B64 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00278 80895B68 33280003 */  andi    $t0, $t9, 0x0003           ## $t0 = 00000000
/* 0027C 80895B6C 00084840 */  sll     $t1, $t0,  1               
/* 00280 80895B70 01495021 */  addu    $t2, $t2, $t1              
/* 00284 80895B74 854A7308 */  lh      $t2, %lo(D_80897308)($t2)  
/* 00288 80895B78 448A9000 */  mtc1    $t2, $f18                  ## $f18 = -0.00
/* 0028C 80895B7C 00000000 */  nop
/* 00290 80895B80 46809120 */  cvt.s.w $f4, $f18                  
/* 00294 80895B84 46062302 */  mul.s   $f12, $f4, $f6             
/* 00298 80895B88 0C0342DC */  jal     Matrix_RotateX              
/* 0029C 80895B8C 00000000 */  nop
/* 002A0 80895B90 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 002A4 80895B94 44805000 */  mtc1    $zero, $f10                ## $f10 = 0.00
/* 002A8 80895B98 8FA60040 */  lw      $a2, 0x0040($sp)           
/* 002AC 80895B9C 3C01452F */  lui     $at, 0x452F                ## $at = 452F0000
/* 002B0 80895BA0 E7A80028 */  swc1    $f8, 0x0028($sp)           
/* 002B4 80895BA4 E7AA002C */  swc1    $f10, 0x002C($sp)          
/* 002B8 80895BA8 44819000 */  mtc1    $at, $f18                  ## $f18 = 2800.00
/* 002BC 80895BAC C4D00190 */  lwc1    $f16, 0x0190($a2)          ## 00000190
/* 002C0 80895BB0 8FA20034 */  lw      $v0, 0x0034($sp)           
/* 002C4 80895BB4 27A40028 */  addiu   $a0, $sp, 0x0028           ## $a0 = FFFFFFE8
/* 002C8 80895BB8 46128102 */  mul.s   $f4, $f16, $f18            
/* 002CC 80895BBC 24450288 */  addiu   $a1, $v0, 0x0288           ## $a1 = 00000288
/* 002D0 80895BC0 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 002D4 80895BC4 0C0346BD */  jal     Matrix_MultVec3f              
/* 002D8 80895BC8 E7A40030 */  swc1    $f4, 0x0030($sp)           
/* 002DC 80895BCC 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 002E0 80895BD0 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 002E4 80895BD4 0C01DFA7 */  jal     Math_Vec3f_Sum
              ## Vec3f_Add
/* 002E8 80895BD8 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
.L80895BDC:
/* 002EC 80895BDC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80895BE0:
/* 002F0 80895BE0 27BD0040 */  addiu   $sp, $sp, 0x0040           ## $sp = 00000000
/* 002F4 80895BE4 03E00008 */  jr      $ra                        
/* 002F8 80895BE8 00000000 */  nop


