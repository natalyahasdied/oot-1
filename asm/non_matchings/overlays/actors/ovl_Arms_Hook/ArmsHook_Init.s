glabel ArmsHook_Init
/* 00008 80864F08 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0000C 80864F0C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00010 80864F10 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00014 80864F14 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00018 80864F18 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0001C 80864F1C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00020 80864F20 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00024 80864F24 0C017406 */  jal     Collider_InitQuad              
/* 00028 80864F28 AFA50020 */  sw      $a1, 0x0020($sp)           
/* 0002C 80864F2C 3C078086 */  lui     $a3, %hi(D_80865B00)       ## $a3 = 80860000
/* 00030 80864F30 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 00034 80864F34 24E75B00 */  addiu   $a3, $a3, %lo(D_80865B00)  ## $a3 = 80865B00
/* 00038 80864F38 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 0003C 80864F3C 0C017441 */  jal     Collider_SetQuad              
/* 00040 80864F40 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00044 80864F44 3C058086 */  lui     $a1, %hi(func_80864FC4)    ## $a1 = 80860000
/* 00048 80864F48 24A54FC4 */  addiu   $a1, $a1, %lo(func_80864FC4) ## $a1 = 80864FC4
/* 0004C 80864F4C 0C2193C0 */  jal     ArmsHook_SetupAction              
/* 00050 80864F50 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00054 80864F54 8E0F0024 */  lw      $t7, 0x0024($s0)           ## 00000024
/* 00058 80864F58 8E0E0028 */  lw      $t6, 0x0028($s0)           ## 00000028
/* 0005C 80864F5C AE0F01E8 */  sw      $t7, 0x01E8($s0)           ## 000001E8
/* 00060 80864F60 8E0F002C */  lw      $t7, 0x002C($s0)           ## 0000002C
/* 00064 80864F64 AE0E01EC */  sw      $t6, 0x01EC($s0)           ## 000001EC
/* 00068 80864F68 AE0F01F0 */  sw      $t7, 0x01F0($s0)           ## 000001F0
/* 0006C 80864F6C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00070 80864F70 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00074 80864F74 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00078 80864F78 03E00008 */  jr      $ra                        
/* 0007C 80864F7C 00000000 */  nop
