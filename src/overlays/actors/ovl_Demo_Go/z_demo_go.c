/*
 * File: z_demo_go.c
 * Overlay: Demo_Go
 * Description:
*/

#include "z_demo_go.h"

#define ROOM  0x00
#define FLAGS 0x00000010

void DemoGo_Init(DemoGo* this, GlobalContext* globalCtx);
void DemoGo_Destroy(DemoGo* this, GlobalContext* globalCtx);
void DemoGo_Update(DemoGo* this, GlobalContext* globalCtx);
void DemoGo_Draw(DemoGo* this, GlobalContext* globalCtx);

void func_8097CE10(DemoGo* this, GlobalContext* globalCtx);
void func_8097CFDC(DemoGo* this, GlobalContext* globalCtx);
void func_8097CFFC(DemoGo* this, GlobalContext* globalCtx);
void func_8097D01C(DemoGo* this, GlobalContext* globalCtx);
void func_8097D058(DemoGo* this, GlobalContext* globalCtx);
void func_8097D088(DemoGo* this, GlobalContext* globalCtx);
void func_8097D0D0(DemoGo* this, GlobalContext* globalCtx);
void func_8097D130(DemoGo* this, GlobalContext* globalCtx);
void func_8097D290(DemoGo* this, GlobalContext* globalCtx);
void func_8097D29C(DemoGo* this, GlobalContext* globalCtx);

u32 D_8097D440[] = {0x0600CE80, 0x0600D280, 0x0600D680};

ActorFunc D_8097D44C[] =
{
    func_8097CFDC,
    func_8097CFFC,
    func_8097D01C,
    func_8097D058,
    func_8097D088,
    func_8097D0D0,
    func_8097D130
};

ActorFunc D_8097D468[] =
{
    func_8097D290,
    func_8097D29C
};

const ActorInit Demo_Go_InitVars =
{
    ACTOR_DEMO_GO,
    ACTORTYPE_NPC,
    ROOM,
    FLAGS,
    OBJECT_OF1D_MAP,
    sizeof(DemoGo),
    (ActorFunc)DemoGo_Init,
    (ActorFunc)DemoGo_Destroy,
    (ActorFunc)DemoGo_Update,
    (ActorFunc)DemoGo_Draw,
};

extern u32 D_060029A8;
extern u32 D_0600FEF0;
extern u32 D_06004930;

UNK_TYPE func_8097C870(DemoGo *this)
{
    s32 ret;
    switch (this->actor.params)
    {
        case 0:
            ret = 3;
            break;
        case 1:
            ret = 4;
            break;
        default:
            if (1)
            {
                ret = 5;
            }
            break;
    }
    return ret;
}

void func_8097C8A8(DemoGo* this, GlobalContext* globalCtx)
{
    s32 pad[2];
    Actor* thisx = &this->actor;
    Vec3f* sp20;
    Vec3f* sp1C;

    if ((thisx->params == 0) || (thisx->params == 1))
    {
        func_800A6E10(&globalCtx->mf_11D60, &thisx->posRot.pos, &sp20, &sp1C);
        Audio_PlaySoundAtPosition(globalCtx, &sp20, 0x14, 0x28A0);
    }
}

void DemoGo_Destroy(DemoGo* this, GlobalContext* globalCtx)
{
    func_800A56F0(&this->skelAnime, globalCtx);
}

void func_8097C930(DemoGo* this)
{
    s16* something = &this->unk_192;
    s16* other = &this->unk_190;
    s32 pad[3];
    s16 phi_v0;

    if (*something == 0) { phi_v0 = 0; } else { *something -= 1; phi_v0 = *something;}

    if (phi_v0 == 0)
    {
        *something = Math_Rand_S16Offset(0x3C, 0x3C);
    }
    *other = *something;
    if (*other >= 3)
    {
        *other = 0;
    }
}

void func_8097C9B8(DemoGo* this)
{
    func_80078914(&this->actor.unk_E4, NA_SE_EN_DODO_M_GND);
}

void func_8097C9DC(DemoGo* this)
{
    s32 pad[2];
    if (func_800A56C8(&this->skelAnime, 12.0f) || func_800A56C8(&this->skelAnime, 25.0f))
    {
        func_80078914(&this->actor.unk_E4, NA_SE_EN_MORIBLIN_WALK);
    }
}

void func_8097CA30(DemoGo* this, GlobalContext* globalCtx)
{
    func_8002E4B4(globalCtx, &this->actor, 75.0f, 30.0f, 30.0f, 5);
}

void func_8097CA78(DemoGo* this, GlobalContext* globalCtx)
{
    s16 pad;
    Vec3f vec = this->actor.posRot.pos;
    func_80033480(globalCtx, &vec, kREG(11) + 100.0f, kREG(12) + 0xA, kREG(13) + 0x12C, kREG(14), 0);
    func_8097C9B8(this);
}

// Not equivalent, I believe in part due to actorAction->endPos being the wrong type, holding floats instead of ints
#ifdef NON_MATCHING
void func_8097CB0C(DemoGo* this, GlobalContext* globalCtx) {
    Actor* thisx = &this->actor;
    CutsceneContext* csCtx = &globalCtx->csCtx;
    Vec3f startPos;
    f32 temp_ret;
    CsCmdActorAction* actorAction;

    if (globalCtx->csCtx.state != 0)
    {
        actorAction = csCtx->actorActions[func_8097C870(this)];
        if (actorAction != 0)
        {
            temp_ret = func_8006F93C(actorAction->endFrame, actorAction->startFrame, csCtx->frames);
            startPos = actorAction->startPos;
            thisx->posRot.pos.x = (((actorAction->endPos.x - startPos.x) * temp_ret) + startPos.x);
            thisx->posRot.pos.y = (((actorAction->endPos.y - startPos.y) * temp_ret) + startPos.y);
            thisx->posRot.pos.z = (((actorAction->endPos.z - startPos.z) * temp_ret) + startPos.z);
            thisx->shape.rot.y = actorAction->rot.y;
            thisx->posRot.rot.y = actorAction->rot.y;
        }
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Demo_Go/func_8097CB0C.s")
#endif

void func_8097CC08(DemoGo* this)
{
    f32 something = this->unk_19C;
    if (something < 8.0f)
    {
        this->actor.speedXZ = (((kREG(15) * 0.01f) + 1.2f) * 0.125f) * something;
    }
    else
    {
        this->actor.speedXZ = (kREG(15) * 0.01f) + 1.2f;
    }
    Actor_MoveForward(&this->actor);
}

void func_8097CCC0(DemoGo* this)
{
    Actor_MoveForward(&this->actor);
}

void func_8097CCE0(DemoGo* this, GlobalContext* globalCtx)
{
    CsCmdActorAction* actorAction;
    Actor* thisx = &this->actor;
    s32 rotYDelta;
    s32 newRotY;
    s32 thisRotY;

    if (globalCtx->csCtx.state != 0)
    {
        actorAction = globalCtx->csCtx.actorActions[func_8097C870(this)];
        if (actorAction != 0)
        {
            thisRotY = thisx->posRot.rot.y;
            rotYDelta = actorAction->rot.y - thisRotY;
            if ((rotYDelta > -(kREG(16) + 0x96)) && (rotYDelta < kREG(16) + 0x96))
            {
                newRotY = actorAction->rot.y;
            } 
            else if (rotYDelta > 0)
            {
                newRotY = (thisRotY + kREG(16)) + 0x96;
            } 
            else
            {
                 newRotY = (thisRotY - kREG(16)) - 0x96;
            }
            thisx->shape.rot.y = newRotY;
            thisx->posRot.rot.y = newRotY;
        }
    }
}

UNK_TYPE DemoGo_FrameUpdateMatrix(DemoGo* this)
{
    return SkelAnime_FrameUpdateMatrix(&this->skelAnime);
}

// This is probably at least close to equivalent but not necessarily so
#ifdef NON_MATCHING
UNK_TYPE func_8097CDB0(DemoGo* this, GlobalContext* globalCtx, u16 csCmdActorAction)
{
    CutsceneContext* csCtx = &globalCtx->csCtx;
    CsCmdActorAction* actorAction = csCtx->actorActions[func_8097C870(this)];
    if (csCtx->state != 0)
    {
        if (actorAction != 0 && actorAction->action == csCmdActorAction)
        {
            return 1;
        }
    }
    return 0;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Demo_Go/func_8097CDB0.s")
#endif

void func_8097CE10(DemoGo* this, GlobalContext* globalCtx)
{
    this->action = 1;
}

void func_8097CE20(DemoGo* this, GlobalContext* globalCtx)
{
    if (func_8097CDB0(this, globalCtx, 2))
    {
        this->action = 2;
        this->drawConfig = 1;
        func_8097CB0C(this, globalCtx);
        func_8097C8A8(this, globalCtx);
    }
}

void func_8097CE78(DemoGo* this, GlobalContext* globalCtx)
{
    CutsceneContext* csCtx = &globalCtx->csCtx;
    CsCmdActorAction* actorAction;

    if (globalCtx->csCtx.state != 0)
    {
        actorAction = csCtx->actorActions[func_8097C870(this)];
        if (actorAction != 0 && csCtx->frames >= actorAction->endFrame)
        {
            func_8097CA78(this, globalCtx);
            this->action = 3;
        }
    }
}

void func_8097CEEC(DemoGo* this, GlobalContext* globalCtx)
{
    if (func_8097CDB0(this, globalCtx, 3))
    {
        this->action = 4;
    }
}

void func_8097CF20(DemoGo* this, GlobalContext* globalCtx, UNK_TYPE arg2)
{
    UNK_PTR animation = &D_060029A8;
    if (arg2 != 0)
    {
        SkelAnime_ChangeAnimation(&this->skelAnime, animation, 1.0f, 0.0f, SkelAnime_GetFrameCount(animation), 0, -8.0f);
        this->action = 5;
        this->unk_19C = 0.0f;
    }
}

void func_8097CF9C(DemoGo* this)
{
    this->unk_19C += 1.0f;
    if (this->unk_19C >= 8.0f)
    {
        this->action = 6;
    }
}

void func_8097CFDC(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CE10(this, globalCtx);
}

void func_8097CFFC(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CE20(this, globalCtx);
}

void func_8097D01C(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CB0C(this, globalCtx);
    func_8097CA30(this, globalCtx);
    func_8097CE78(this, globalCtx);
}

void func_8097D058(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CA30(this, globalCtx);
    func_8097CEEC(this, globalCtx);
}

void func_8097D088(DemoGo* this, GlobalContext* globalCtx)
{
    UNK_TYPE something;
    func_8097CA30(this, globalCtx);
    something = DemoGo_FrameUpdateMatrix(this);
    func_8097C930(this);
    func_8097CF20(this, globalCtx, something);
}

void func_8097D0D0(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CCE0(this, globalCtx);
    func_8097CCC0(this);
    func_8097CA30(this, globalCtx);
    DemoGo_FrameUpdateMatrix(this);
    func_8097C930(this);
    func_8097C9DC(this);
    func_8097CF9C(this);
}
void func_8097D130(DemoGo* this, GlobalContext* globalCtx)
{
    func_8097CCE0(this, globalCtx);
    func_8097CC08(this);
    func_8097CA30(this, globalCtx);
    DemoGo_FrameUpdateMatrix(this);
    func_8097C930(this);
    func_8097C9DC(this);
}

void DemoGo_Update(DemoGo* this, GlobalContext* globalCtx)
{
    if (this->action < 0 || this->action >= 7 || D_8097D44C[this->action] == 0)
    {
        osSyncPrintf("[31mメインモードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n[m");
        return;
    }
    D_8097D44C[this->action](this, globalCtx);
}

void DemoGo_Init(DemoGo* this, GlobalContext* globalCtx)
{
    UNK_PTR animation = &D_06004930;
    s16 pad;
    
    ActorShape_Init(&this->actor.shape, 0.0f, ActorShadow_DrawFunc_Circle, 30.0f);
    func_800A46F8(globalCtx, &this->skelAnime, &D_0600FEF0, 0, 0, 0, 0);
    SkelAnime_ChangeAnimation(&this->skelAnime, animation, 1.0f, 0.0f, SkelAnime_GetFrameCount(animation), 2, 0.0f);
    this->action = 0;
}

void func_8097D290(DemoGo* this, GlobalContext* globalCtx)
{

}

// Not equivalent yet - the gSPSegment calls are probably the main issue
#ifdef NON_MATCHING
extern u32 D_0600E680;
void func_8097D29C(DemoGo* this, GlobalContext* globalCtx)
{
    u32 addr = D_8097D440[this->unk_190];
    GraphicsContext* gfxCtx = &globalCtx->state.gfxCtx;
    Gfx* gfxArr[4];

    func_800C6AC4(gfxArr, globalCtx->state.gfxCtx, "../z_demo_go.c", 732);
    func_80093D18(globalCtx->state.gfxCtx);

    gSPSegment(gfxCtx->polyOpa.p++, 0x08, SEGMENTED_TO_VIRTUAL(addr));
    gSPSegment(gfxCtx->polyOpa.p++, 0x09, SEGMENTED_TO_VIRTUAL(D_0600E680));

    func_800A1AC8(globalCtx, this->skelAnime.limbIndex, this->skelAnime.actorDrawTbl, this->skelAnime.dListCount, 0, 0, &this->actor);
    func_800C6B54(gfxArr, globalCtx->state.gfxCtx, "../z_demo_go.c", 746);
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/overlays/actors/ovl_Demo_Go/func_8097D29C.s")
#endif

void DemoGo_Draw(DemoGo* this, GlobalContext* globalCtx) {
    if (this->drawConfig < 0 || this->drawConfig >= 2 || D_8097D468[this->drawConfig] == 0)
    {
        osSyncPrintf("[31m描画モードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n[m");
        return;
    }
    D_8097D468[this->drawConfig](this, globalCtx);
}
