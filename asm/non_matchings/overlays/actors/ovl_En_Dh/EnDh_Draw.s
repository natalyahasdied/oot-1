glabel EnDh_Draw
/* 014F0 809EC230 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 014F4 809EC234 AFB20040 */  sw      $s2, 0x0040($sp)           
/* 014F8 809EC238 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 014FC 809EC23C AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 01500 809EC240 AFB1003C */  sw      $s1, 0x003C($sp)           
/* 01504 809EC244 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 01508 809EC248 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0150C 809EC24C 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01510 809EC250 3C06809F */  lui     $a2, %hi(D_809EC680)       ## $a2 = 809F0000
/* 01514 809EC254 24C6C680 */  addiu   $a2, $a2, %lo(D_809EC680)  ## $a2 = 809EC680
/* 01518 809EC258 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 0151C 809EC25C 2407044B */  addiu   $a3, $zero, 0x044B         ## $a3 = 0000044B
/* 01520 809EC260 0C031AB1 */  jal     func_800C6AC4              
/* 01524 809EC264 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 01528 809EC268 922E025A */  lbu     $t6, 0x025A($s1)           ## 0000025A
/* 0152C 809EC26C 240100FF */  addiu   $at, $zero, 0x00FF         ## $at = 000000FF
/* 01530 809EC270 15C10021 */  bne     $t6, $at, .L809EC2F8       
/* 01534 809EC274 00000000 */  nop
/* 01538 809EC278 0C024F46 */  jal     func_80093D18              
/* 0153C 809EC27C 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 01540 809EC280 8E0302C0 */  lw      $v1, 0x02C0($s0)           ## 000002C0
/* 01544 809EC284 3C18FB00 */  lui     $t8, 0xFB00                ## $t8 = FB000000
/* 01548 809EC288 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 0154C 809EC28C 246F0008 */  addiu   $t7, $v1, 0x0008           ## $t7 = 00000008
/* 01550 809EC290 AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 01554 809EC294 AC780000 */  sw      $t8, 0x0000($v1)           ## 00000000
/* 01558 809EC298 9229025A */  lbu     $t1, 0x025A($s1)           ## 0000025A
/* 0155C 809EC29C 3C0C8011 */  lui     $t4, 0x8011                ## $t4 = 80110000
/* 01560 809EC2A0 258C6290 */  addiu   $t4, $t4, 0x6290           ## $t4 = 80116290
/* 01564 809EC2A4 AC690004 */  sw      $t1, 0x0004($v1)           ## 00000004
/* 01568 809EC2A8 8E0302C0 */  lw      $v1, 0x02C0($s0)           ## 000002C0
/* 0156C 809EC2AC 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 01570 809EC2B0 3C0D809F */  lui     $t5, %hi(func_809EC1A0)    ## $t5 = 809F0000
/* 01574 809EC2B4 246A0008 */  addiu   $t2, $v1, 0x0008           ## $t2 = 00000008
/* 01578 809EC2B8 AE0A02C0 */  sw      $t2, 0x02C0($s0)           ## 000002C0
/* 0157C 809EC2BC AC6C0004 */  sw      $t4, 0x0004($v1)           ## 00000004
/* 01580 809EC2C0 AC6B0000 */  sw      $t3, 0x0000($v1)           ## 00000000
/* 01584 809EC2C4 9227014E */  lbu     $a3, 0x014E($s1)           ## 0000014E
/* 01588 809EC2C8 8E26016C */  lw      $a2, 0x016C($s1)           ## 0000016C
/* 0158C 809EC2CC 8E250150 */  lw      $a1, 0x0150($s1)           ## 00000150
/* 01590 809EC2D0 25ADC1A0 */  addiu   $t5, $t5, %lo(func_809EC1A0) ## $t5 = 809EC1A0
/* 01594 809EC2D4 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 01598 809EC2D8 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 0159C 809EC2DC AFA00010 */  sw      $zero, 0x0010($sp)         
/* 015A0 809EC2E0 8E0E02C0 */  lw      $t6, 0x02C0($s0)           ## 000002C0
/* 015A4 809EC2E4 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 015A8 809EC2E8 0C0289CF */  jal     func_800A273C              
/* 015AC 809EC2EC AFAE001C */  sw      $t6, 0x001C($sp)           
/* 015B0 809EC2F0 1000001E */  beq     $zero, $zero, .L809EC36C   
/* 015B4 809EC2F4 AE0202C0 */  sw      $v0, 0x02C0($s0)           ## 000002C0
.L809EC2F8:
/* 015B8 809EC2F8 0C024F61 */  jal     func_80093D84              
/* 015BC 809EC2FC 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 015C0 809EC300 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 015C4 809EC304 3C18FB00 */  lui     $t8, 0xFB00                ## $t8 = FB000000
/* 015C8 809EC308 3C0BDB06 */  lui     $t3, 0xDB06                ## $t3 = DB060000
/* 015CC 809EC30C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 015D0 809EC310 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 015D4 809EC314 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 015D8 809EC318 9229025A */  lbu     $t1, 0x025A($s1)           ## 0000025A
/* 015DC 809EC31C 3C0C8011 */  lui     $t4, 0x8011                ## $t4 = 80110000
/* 015E0 809EC320 258C6280 */  addiu   $t4, $t4, 0x6280           ## $t4 = 80116280
/* 015E4 809EC324 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 015E8 809EC328 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 015EC 809EC32C 356B0020 */  ori     $t3, $t3, 0x0020           ## $t3 = DB060020
/* 015F0 809EC330 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 015F4 809EC334 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 015F8 809EC338 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 015FC 809EC33C AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 01600 809EC340 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 01604 809EC344 9227014E */  lbu     $a3, 0x014E($s1)           ## 0000014E
/* 01608 809EC348 8E26016C */  lw      $a2, 0x016C($s1)           ## 0000016C
/* 0160C 809EC34C 8E250150 */  lw      $a1, 0x0150($s1)           ## 00000150
/* 01610 809EC350 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 01614 809EC354 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 01618 809EC358 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 0161C 809EC35C 8E0D02D0 */  lw      $t5, 0x02D0($s0)           ## 000002D0
/* 01620 809EC360 0C0289CF */  jal     func_800A273C              
/* 01624 809EC364 AFAD001C */  sw      $t5, 0x001C($sp)           
/* 01628 809EC368 AE0202D0 */  sw      $v0, 0x02D0($s0)           ## 000002D0
.L809EC36C:
/* 0162C 809EC36C 922E0252 */  lbu     $t6, 0x0252($s1)           ## 00000252
/* 01630 809EC370 11C0007F */  beq     $t6, $zero, .L809EC570     
/* 01634 809EC374 00000000 */  nop
/* 01638 809EC378 0C024F61 */  jal     func_80093D84              
/* 0163C 809EC37C 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 01640 809EC380 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01644 809EC384 3C195537 */  lui     $t9, 0x5537                ## $t9 = 55370000
/* 01648 809EC388 37390082 */  ori     $t9, $t9, 0x0082           ## $t9 = 55370082
/* 0164C 809EC38C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 01650 809EC390 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 01654 809EC394 3C18FB00 */  lui     $t8, 0xFB00                ## $t8 = FB000000
/* 01658 809EC398 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 0165C 809EC39C AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 01660 809EC3A0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01664 809EC3A4 3C0ADB06 */  lui     $t2, 0xDB06                ## $t2 = DB060000
/* 01668 809EC3A8 354A0020 */  ori     $t2, $t2, 0x0020           ## $t2 = DB060020
/* 0166C 809EC3AC 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01670 809EC3B0 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 01674 809EC3B4 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 01678 809EC3B8 8E43009C */  lw      $v1, 0x009C($s2)           ## 0000009C
/* 0167C 809EC3BC 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 01680 809EC3C0 240A0040 */  addiu   $t2, $zero, 0x0040         ## $t2 = 00000040
/* 01684 809EC3C4 00030823 */  subu    $at, $zero, $v1            
/* 01688 809EC3C8 00017080 */  sll     $t6, $at,  2               
/* 0168C 809EC3CC 0001C080 */  sll     $t8, $at,  2               
/* 01690 809EC3D0 0301C021 */  addu    $t8, $t8, $at              
/* 01694 809EC3D4 01C17021 */  addu    $t6, $t6, $at              
/* 01698 809EC3D8 000E7040 */  sll     $t6, $t6,  1               
/* 0169C 809EC3DC 0018C080 */  sll     $t8, $t8,  2               
/* 016A0 809EC3E0 00013080 */  sll     $a2, $at,  2               
/* 016A4 809EC3E4 00C13023 */  subu    $a2, $a2, $at              
/* 016A8 809EC3E8 331900FF */  andi    $t9, $t8, 0x00FF           ## $t9 = 00000000
/* 016AC 809EC3EC 31CF007F */  andi    $t7, $t6, 0x007F           ## $t7 = 00000000
/* 016B0 809EC3F0 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 016B4 809EC3F4 240B0020 */  addiu   $t3, $zero, 0x0020         ## $t3 = 00000020
/* 016B8 809EC3F8 240C0040 */  addiu   $t4, $zero, 0x0040         ## $t4 = 00000040
/* 016BC 809EC3FC 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 016C0 809EC400 AFAD0018 */  sw      $t5, 0x0018($sp)           
/* 016C4 809EC404 AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 016C8 809EC408 AFAB0010 */  sw      $t3, 0x0010($sp)           
/* 016CC 809EC40C AFA90024 */  sw      $t1, 0x0024($sp)           
/* 016D0 809EC410 AFAF001C */  sw      $t7, 0x001C($sp)           
/* 016D4 809EC414 AFB90020 */  sw      $t9, 0x0020($sp)           
/* 016D8 809EC418 30C6007F */  andi    $a2, $a2, 0x007F           ## $a2 = 00000000
/* 016DC 809EC41C AFAA0028 */  sw      $t2, 0x0028($sp)           
/* 016E0 809EC420 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 016E4 809EC424 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 016E8 809EC428 0C0253D0 */  jal     Draw_TwoTexScroll              
/* 016EC 809EC42C AFA2005C */  sw      $v0, 0x005C($sp)           
/* 016F0 809EC430 8FA8005C */  lw      $t0, 0x005C($sp)           
/* 016F4 809EC434 3C0CFA00 */  lui     $t4, 0xFA00                ## $t4 = FA000000
/* 016F8 809EC438 358C8080 */  ori     $t4, $t4, 0x8080           ## $t4 = FA008080
/* 016FC 809EC43C AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 01700 809EC440 8E0302D0 */  lw      $v1, 0x02D0($s0)           ## 000002D0
/* 01704 809EC444 444DF800 */  cfc1    $t5, $31
/* 01708 809EC448 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0170C 809EC44C 246B0008 */  addiu   $t3, $v1, 0x0008           ## $t3 = 00000008
/* 01710 809EC450 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 01714 809EC454 AC6C0000 */  sw      $t4, 0x0000($v1)           ## 00000000
/* 01718 809EC458 44CEF800 */  ctc1    $t6, $31
/* 0171C 809EC45C C6240320 */  lwc1    $f4, 0x0320($s1)           ## 00000320
/* 01720 809EC460 3C014F00 */  lui     $at, 0x4F00                ## $at = 4F000000
/* 01724 809EC464 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 01728 809EC468 460021A4 */  cvt.w.s $f6, $f4                   
/* 0172C 809EC46C 444EF800 */  cfc1    $t6, $31
/* 01730 809EC470 00000000 */  nop
/* 01734 809EC474 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 01738 809EC478 51C00013 */  beql    $t6, $zero, .L809EC4C8     
/* 0173C 809EC47C 440E3000 */  mfc1    $t6, $f6                   
/* 01740 809EC480 44813000 */  mtc1    $at, $f6                   ## $f6 = 2147483648.00
/* 01744 809EC484 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 01748 809EC488 46062181 */  sub.s   $f6, $f4, $f6              
/* 0174C 809EC48C 44CEF800 */  ctc1    $t6, $31
/* 01750 809EC490 00000000 */  nop
/* 01754 809EC494 460031A4 */  cvt.w.s $f6, $f6                   
/* 01758 809EC498 444EF800 */  cfc1    $t6, $31
/* 0175C 809EC49C 00000000 */  nop
/* 01760 809EC4A0 31CE0078 */  andi    $t6, $t6, 0x0078           ## $t6 = 00000000
/* 01764 809EC4A4 15C00005 */  bne     $t6, $zero, .L809EC4BC     
/* 01768 809EC4A8 00000000 */  nop
/* 0176C 809EC4AC 440E3000 */  mfc1    $t6, $f6                   
/* 01770 809EC4B0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 01774 809EC4B4 10000007 */  beq     $zero, $zero, .L809EC4D4   
/* 01778 809EC4B8 01C17025 */  or      $t6, $t6, $at              ## $t6 = 80000000
.L809EC4BC:
/* 0177C 809EC4BC 10000005 */  beq     $zero, $zero, .L809EC4D4   
/* 01780 809EC4C0 240EFFFF */  addiu   $t6, $zero, 0xFFFF         ## $t6 = FFFFFFFF
/* 01784 809EC4C4 440E3000 */  mfc1    $t6, $f6                   
.L809EC4C8:
/* 01788 809EC4C8 00000000 */  nop
/* 0178C 809EC4CC 05C0FFFB */  bltz    $t6, .L809EC4BC            
/* 01790 809EC4D0 00000000 */  nop
.L809EC4D4:
/* 01794 809EC4D4 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 01798 809EC4D8 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 000000FF
/* 0179C 809EC4DC AC6F0004 */  sw      $t7, 0x0004($v1)           ## 00000004
/* 017A0 809EC4E0 44CDF800 */  ctc1    $t5, $31
/* 017A4 809EC4E4 C62E00BC */  lwc1    $f14, 0x00BC($s1)          ## 000000BC
/* 017A8 809EC4E8 44066000 */  mfc1    $a2, $f12                  
/* 017AC 809EC4EC 0C034261 */  jal     Matrix_Translate              
/* 017B0 809EC4F0 46007387 */  neg.s   $f14, $f14                 
/* 017B4 809EC4F4 3C01809F */  lui     $at, %hi(D_809EC6EC)       ## $at = 809F0000
/* 017B8 809EC4F8 C420C6EC */  lwc1    $f0, %lo(D_809EC6EC)($at)  
/* 017BC 809EC4FC C6280318 */  lwc1    $f8, 0x0318($s1)           ## 00000318
/* 017C0 809EC500 C62A031C */  lwc1    $f10, 0x031C($s1)          ## 0000031C
/* 017C4 809EC504 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 017C8 809EC508 46004302 */  mul.s   $f12, $f8, $f0             
/* 017CC 809EC50C 44066000 */  mfc1    $a2, $f12                  
/* 017D0 809EC510 46005382 */  mul.s   $f14, $f10, $f0            
/* 017D4 809EC514 0C0342A3 */  jal     Matrix_Scale              
/* 017D8 809EC518 00000000 */  nop
/* 017DC 809EC51C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 017E0 809EC520 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 017E4 809EC524 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 017E8 809EC528 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 017EC 809EC52C AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 017F0 809EC530 3C05809F */  lui     $a1, %hi(D_809EC690)       ## $a1 = 809F0000
/* 017F4 809EC534 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 017F8 809EC538 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 017FC 809EC53C 24A5C690 */  addiu   $a1, $a1, %lo(D_809EC690)  ## $a1 = 809EC690
/* 01800 809EC540 24060488 */  addiu   $a2, $zero, 0x0488         ## $a2 = 00000488
/* 01804 809EC544 0C0346A2 */  jal     Matrix_NewMtx              
/* 01808 809EC548 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 0180C 809EC54C AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 01810 809EC550 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01814 809EC554 3C0B0600 */  lui     $t3, 0x0600                ## $t3 = 06000000
/* 01818 809EC558 256B7FC0 */  addiu   $t3, $t3, 0x7FC0           ## $t3 = 06007FC0
/* 0181C 809EC55C 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 01820 809EC560 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 01824 809EC564 3C0ADE00 */  lui     $t2, 0xDE00                ## $t2 = DE000000
/* 01828 809EC568 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 0182C 809EC56C AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
.L809EC570:
/* 01830 809EC570 3C06809F */  lui     $a2, %hi(D_809EC6A0)       ## $a2 = 809F0000
/* 01834 809EC574 24C6C6A0 */  addiu   $a2, $a2, %lo(D_809EC6A0)  ## $a2 = 809EC6A0
/* 01838 809EC578 27A40074 */  addiu   $a0, $sp, 0x0074           ## $a0 = FFFFFFE4
/* 0183C 809EC57C 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 01840 809EC580 0C031AD5 */  jal     func_800C6B54              
/* 01844 809EC584 2407048E */  addiu   $a3, $zero, 0x048E         ## $a3 = 0000048E
/* 01848 809EC588 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 0184C 809EC58C 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 01850 809EC590 8FB1003C */  lw      $s1, 0x003C($sp)           
/* 01854 809EC594 8FB20040 */  lw      $s2, 0x0040($sp)           
/* 01858 809EC598 03E00008 */  jr      $ra                        
/* 0185C 809EC59C 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000

