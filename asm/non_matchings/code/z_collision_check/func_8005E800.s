glabel func_8005E800
/* AD59A0 8005E800 908E0010 */  lbu   $t6, 0x10($a0)
/* AD59A4 8005E804 35CF0004 */  ori   $t7, $t6, 4
/* AD59A8 8005E808 A08F0010 */  sb    $t7, 0x10($a0)
/* AD59AC 8005E80C 90B80011 */  lbu   $t8, 0x11($a1)
/* AD59B0 8005E810 37190080 */  ori   $t9, $t8, 0x80
/* AD59B4 8005E814 03E00008 */  jr    $ra
/* AD59B8 8005E818 A0B90011 */   sb    $t9, 0x11($a1)

