glabel func_80984124
/* 00E24 80984124 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00E28 80984128 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00E2C 8098412C 0C261012 */  jal     func_80984048              
/* 00E30 80984130 00000000 */  nop
/* 00E34 80984134 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00E38 80984138 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00E3C 8098413C 03E00008 */  jr      $ra                        
/* 00E40 80984140 00000000 */  nop


