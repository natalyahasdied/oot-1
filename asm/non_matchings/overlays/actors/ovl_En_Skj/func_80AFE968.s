glabel func_80AFE968
/* 006B8 80AFE968 3C0280B0 */  lui     $v0, %hi(D_80B01644)       ## $v0 = 80B00000
/* 006BC 80AFE96C 8C421644 */  lw      $v0, %lo(D_80B01644)($v0)  
/* 006C0 80AFE970 C4860024 */  lwc1    $f6, 0x0024($a0)           ## 00000024
/* 006C4 80AFE974 C48A002C */  lwc1    $f10, 0x002C($a0)          ## 0000002C
/* 006C8 80AFE978 C4440024 */  lwc1    $f4, 0x0024($v0)           ## 80B00024
/* 006CC 80AFE97C C448002C */  lwc1    $f8, 0x002C($v0)           ## 80B0002C
/* 006D0 80AFE980 3C0141D0 */  lui     $at, 0x41D0                ## $at = 41D00000
/* 006D4 80AFE984 46062081 */  sub.s   $f2, $f4, $f6              
/* 006D8 80AFE988 44812000 */  mtc1    $at, $f4                   ## $f4 = 26.00
/* 006DC 80AFE98C 460A4301 */  sub.s   $f12, $f8, $f10            
/* 006E0 80AFE990 46021402 */  mul.s   $f16, $f2, $f2             
/* 006E4 80AFE994 00000000 */  nop
/* 006E8 80AFE998 460C6482 */  mul.s   $f18, $f12, $f12           
/* 006EC 80AFE99C 46128000 */  add.s   $f0, $f16, $f18            
/* 006F0 80AFE9A0 46000004 */  sqrt.s  $f0, $f0                   
/* 006F4 80AFE9A4 03E00008 */  jr      $ra                        
/* 006F8 80AFE9A8 46040000 */  add.s   $f0, $f0, $f4              


