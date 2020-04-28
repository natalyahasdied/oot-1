glabel BgDdanKd_Init
/* 00008 808710F8 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 0000C 808710FC AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00010 80871100 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00014 80871104 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00018 80871108 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 0001C 8087110C AFA00024 */  sw      $zero, 0x0024($sp)         
/* 00020 80871110 3C058087 */  lui     $a1, %hi(D_808718EC)       ## $a1 = 80870000
/* 00024 80871114 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00028 80871118 AC800164 */  sw      $zero, 0x0164($a0)         ## 00000164
/* 0002C 8087111C 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 00030 80871120 24A518EC */  addiu   $a1, $a1, %lo(D_808718EC)  ## $a1 = 808718EC
/* 00034 80871124 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00038 80871128 0C010D20 */  jal     func_80043480
              
/* 0003C 8087112C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00040 80871130 26050178 */  addiu   $a1, $s0, 0x0178           ## $a1 = 00000178
/* 00044 80871134 AFA50020 */  sw      $a1, 0x0020($sp)           
/* 00048 80871138 0C0170D9 */  jal     Collider_InitCylinder
              
/* 0004C 8087113C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00050 80871140 3C078087 */  lui     $a3, %hi(D_808718C0)       ## $a3 = 80870000
/* 00054 80871144 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 00058 80871148 24E718C0 */  addiu   $a3, $a3, %lo(D_808718C0)  ## $a3 = 808718C0
/* 0005C 8087114C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00060 80871150 0C01712B */  jal     Collider_SetCylinder
              
/* 00064 80871154 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00068 80871158 3C040600 */  lui     $a0, 0x0600                ## $a0 = 06000000
/* 0006C 8087115C 24844F30 */  addiu   $a0, $a0, 0x4F30           ## $a0 = 06004F30
/* 00070 80871160 0C010620 */  jal     func_80041880
              
/* 00074 80871164 27A50024 */  addiu   $a1, $sp, 0x0024           ## $a1 = FFFFFFF4
/* 00078 80871168 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0007C 8087116C 26250810 */  addiu   $a1, $s1, 0x0810           ## $a1 = 00000810
/* 00080 80871170 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00084 80871174 0C00FA9D */  jal     func_8003EA74
              ## func_8003EA74
/* 00088 80871178 8FA70024 */  lw      $a3, 0x0024($sp)           
/* 0008C 8087117C AE02014C */  sw      $v0, 0x014C($s0)           ## 0000014C
/* 00090 80871180 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00094 80871184 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00098 80871188 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 0009C 8087118C 14400007 */  bne     $v0, $zero, .L808711AC     
/* 000A0 80871190 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 000A4 80871194 3C058087 */  lui     $a1, %hi(func_80871234)    ## $a1 = 80870000
/* 000A8 80871198 24A51234 */  addiu   $a1, $a1, %lo(func_80871234) ## $a1 = 80871234
/* 000AC 8087119C 0C21C43C */  jal     BgDdanKd_SetupAction              
/* 000B0 808711A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 000B4 808711A4 1000000D */  beq     $zero, $zero, .L808711DC   
/* 000B8 808711A8 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808711AC:
/* 000BC 808711AC C604000C */  lwc1    $f4, 0x000C($s0)           ## 0000000C
/* 000C0 808711B0 44813000 */  mtc1    $at, $f6                   ## $f6 = 0.00
/* 000C4 808711B4 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 000C8 808711B8 44815000 */  mtc1    $at, $f10                  ## $f10 = 20.00
/* 000CC 808711BC 46062201 */  sub.s   $f8, $f4, $f6              
/* 000D0 808711C0 3C058087 */  lui     $a1, %hi(func_80871838)    ## $a1 = 80870000
/* 000D4 808711C4 24A51838 */  addiu   $a1, $a1, %lo(func_80871838) ## $a1 = 80871838
/* 000D8 808711C8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 000DC 808711CC 460A4401 */  sub.s   $f16, $f8, $f10            
/* 000E0 808711D0 0C21C43C */  jal     BgDdanKd_SetupAction              
/* 000E4 808711D4 E6100028 */  swc1    $f16, 0x0028($s0)          ## 00000028
/* 000E8 808711D8 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808711DC:
/* 000EC 808711DC 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 000F0 808711E0 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 000F4 808711E4 03E00008 */  jr      $ra                        
/* 000F8 808711E8 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
