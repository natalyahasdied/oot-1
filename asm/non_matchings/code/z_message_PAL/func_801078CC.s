glabel func_801078CC
/* B7EA6C 801078CC 24997FFF */  addiu $t9, $a0, 0x7fff
/* B7EA70 801078D0 933962FE */  lbu   $t9, 0x62fe($t9)
/* B7EA74 801078D4 24010001 */  li    $at, 1
/* B7EA78 801078D8 240500FF */  li    $a1, 255
/* B7EA7C 801078DC 17210008 */  bne   $t9, $at, .L80107900
/* B7EA80 801078E0 240900E1 */   li    $t1, 225
/* B7EA84 801078E4 24817FFF */  addiu $at, $a0, 0x7fff
/* B7EA88 801078E8 240500FF */  li    $a1, 255
/* B7EA8C 801078EC 2408001E */  li    $t0, 30
/* B7EA90 801078F0 A42563DD */  sh    $a1, 0x63dd($at)
/* B7EA94 801078F4 A42563DF */  sh    $a1, 0x63df($at)
/* B7EA98 801078F8 03E00008 */  jr    $ra
/* B7EA9C 801078FC A42863E1 */   sh    $t0, 0x63e1($at)
.L80107900:
/* B7EAA0 80107900 24817FFF */  addiu $at, $a0, 0x7fff
/* B7EAA4 80107904 240A0032 */  li    $t2, 50
/* B7EAA8 80107908 A42963DD */  sh    $t1, 0x63dd($at)
/* B7EAAC 8010790C A42563DF */  sh    $a1, 0x63df($at)
/* B7EAB0 80107910 03E00008 */  jr    $ra
/* B7EAB4 80107914 A42A63E1 */   sh    $t2, 0x63e1($at)
