/*
 * File: z_obj_blockstop.c
 * Overlay: ovl_Obj_Blockstop
 * Description: Stops blocks and sets relevant flags when the block is in position.
 */

#include "z_obj_blockstop.h"

#define FLAGS 0x00000000

#define THIS ((ObjBlockstop*)thisx)

void ObjBlockstop_Init(Actor* thisx, GlobalContext* globalCtx);
void ObjBlockstop_Destroy(Actor* thisx, GlobalContext* globalCtx);
void ObjBlockstop_Update(Actor* thisx, GlobalContext* globalCtx);

const ActorInit Obj_Blockstop_InitVars = {
    ACTOR_OBJ_BLOCKSTOP,
    ACTORTYPE_PROP,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(ObjBlockstop),
    (ActorFunc)ObjBlockstop_Init,
    (ActorFunc)ObjBlockstop_Destroy,
    (ActorFunc)ObjBlockstop_Update,
    NULL,
};

void ObjBlockstop_Init(Actor* thisx, GlobalContext* globalCtx) {
    ObjBlockstop* this = THIS;

    if (Flags_GetSwitch(globalCtx, this->actor.params)) {
        Actor_Kill(&this->actor);
    } else {
        this->actor.posRot.pos.y += 1;
    }
}

void ObjBlockstop_Destroy(Actor* thisx, GlobalContext* globalCtx) {
}

void ObjBlockstop_Update(Actor* thisx, GlobalContext* globalCtx) {
    ObjBlockstop* this = THIS;
    Actor* dynaActor;
    Vec3f sp4C;
    s32 bgId;
    s32 pad;

    if (func_8003DF10(&globalCtx->colCtx, &this->actor.initPosRot.pos, &this->actor.posRot.pos, &sp4C,
                      &this->actor.floorPoly, 0, 0, 1, 1, &bgId, &this->actor)) {
        dynaActor = func_8003EB84(&globalCtx->colCtx, bgId);

        if (dynaActor != NULL && dynaActor->id == ACTOR_OBJ_OSHIHIKI) {
            if ((dynaActor->params & 0x000F) == 3 || (dynaActor->params & 0x000F) == 7) {
                func_80078884(NA_SE_SY_CORRECT_CHIME);
            } else {
                func_80078884(NA_SE_SY_TRE_BOX_APPEAR);
            }

            Flags_SetSwitch(globalCtx, this->actor.params);
            Actor_Kill(&this->actor);
        }
    }
}
