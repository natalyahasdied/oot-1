/*
 * File: z_bg_mizu_uzu.c
 * Overlay: ovl_Bg_Mizu_Uzu
 * Description: Water Noise
 */

#include "z_bg_mizu_uzu.h"

#define FLAGS 0x00000000

#define THIS ((BgMizuUzu*)thisx)

void BgMizuUzu_Init(Actor* thisx, GlobalContext* globalCtx);
void BgMizuUzu_Destroy(Actor* thisx, GlobalContext* globalCtx);
void BgMizuUzu_Update(Actor* thisx, GlobalContext* globalCtx);
void BgMizuUzu_Draw(Actor* thisx, GlobalContext* globalCtx);

const ActorInit Bg_Mizu_Uzu_InitVars = {
    ACTOR_BG_MIZU_UZU,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_MIZU_OBJECTS,
    sizeof(BgMizuUzu),
    (ActorFunc)BgMizuUzu_Init,
    (ActorFunc)BgMizuUzu_Destroy,
    (ActorFunc)BgMizuUzu_Update,
    (ActorFunc)BgMizuUzu_Draw,
};

static InitChainEntry sInitChain[] = {
    ICHAIN_F32(uncullZoneScale, 1000, ICHAIN_CONTINUE),
    ICHAIN_F32(uncullZoneDownward, 1000, ICHAIN_CONTINUE),
    ICHAIN_VEC3F_DIV1000(scale, 100, ICHAIN_STOP),
};

extern CollisionHeader D_060074EC;

void func_8089F788(BgMizuUzu* this, GlobalContext* globalCtx);

void BgMizuUzu_Init(Actor* thisx, GlobalContext* globalCtx) {
    BgMizuUzu* this = THIS;
    s32 pad;
    CollisionHeader* colHeader = NULL;
    s32 pad2;

    Actor_ProcessInitChain(thisx, sInitChain);
    func_80043480(thisx, DPM_UNK);
    func_80041880(&D_060074EC, &colHeader);
    this->dyna.dynaPolyId = func_8003EA74(globalCtx, &globalCtx->colCtx.dyna, thisx, colHeader);
    this->actionFunc = func_8089F788;
}

void BgMizuUzu_Destroy(Actor* thisx, GlobalContext* globalCtx) {
    BgMizuUzu* this = THIS;

    func_8003ED58(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
}

void func_8089F788(BgMizuUzu* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->dyna.actor;

    if (PLAYER->currentBoots == 1) {
        func_8003EBF8(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    } else {
        func_8003EC50(globalCtx, &globalCtx->colCtx.dyna, this->dyna.dynaPolyId);
    }
    Audio_PlayActorSound2(thisx, NA_SE_EV_WATER_CONVECTION - SFX_FLAG);
    thisx->shape.rot.y += 0x1C0;
}

void BgMizuUzu_Update(Actor* thisx, GlobalContext* globalCtx) {
    BgMizuUzu* this = THIS;

    this->actionFunc(this, globalCtx);
}

void BgMizuUzu_Draw(Actor* thisx, GlobalContext* globalCtx) {
}
