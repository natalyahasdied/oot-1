glabel func_809145BC
/* 03F7C 809145BC 8FA30010 */  lw      $v1, 0x0010($sp)           
/* 03F80 809145C0 8FA20014 */  lw      $v0, 0x0014($sp)           
/* 03F84 809145C4 846C0002 */  lh      $t4, 0x0002($v1)           ## 00000002
/* 03F88 809145C8 C44403D4 */  lwc1    $f4, 0x03D4($v0)           ## 000003D4
/* 03F8C 809145CC 846F0004 */  lh      $t7, 0x0004($v1)           ## 00000004
/* 03F90 809145D0 448C8000 */  mtc1    $t4, $f16                  ## $f16 = 0.00
/* 03F94 809145D4 448F5000 */  mtc1    $t7, $f10                  ## $f10 = 0.00
/* 03F98 809145D8 468084A0 */  cvt.s.w $f18, $f16                 
/* 03F9C 809145DC 46805420 */  cvt.s.w $f16, $f10                 
/* 03FA0 809145E0 46049180 */  add.s   $f6, $f18, $f4             
/* 03FA4 809145E4 4600320D */  trunc.w.s $f8, $f6                   
/* 03FA8 809145E8 440E4000 */  mfc1    $t6, $f8                   
/* 03FAC 809145EC 00000000 */  nop
/* 03FB0 809145F0 A46E0002 */  sh      $t6, 0x0002($v1)           ## 00000002
/* 03FB4 809145F4 C45203D8 */  lwc1    $f18, 0x03D8($v0)          ## 000003D8
/* 03FB8 809145F8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 03FBC 809145FC 46128100 */  add.s   $f4, $f16, $f18            
/* 03FC0 80914600 4600218D */  trunc.w.s $f6, $f4                   
/* 03FC4 80914604 44193000 */  mfc1    $t9, $f6                   
/* 03FC8 80914608 03E00008 */  jr      $ra                        
/* 03FCC 8091460C A4790004 */  sh      $t9, 0x0004($v1)           ## 00000004

