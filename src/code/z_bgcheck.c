#include <ultra64.h>
#include <global.h>
#include <vt.h>
#include <z64actor.h>

// func_80041DB8, SurfaceType wall properties
s32 D_80119D90[32] = {
    0, 1, 3, 5, 8, 16, 32, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

// func_80041F34
u16 D_80119E10[14] = {
    NA_SE_PL_WALK_GROUND & 0x1FF, NA_SE_PL_WALK_SAND & 0x1FF,   NA_SE_PL_WALK_CONCRETE & 0x1FF,
    NA_SE_PL_WALK_DIRT & 0x1FF,   NA_SE_PL_WALK_WATER0 & 0x1FF, NA_SE_PL_WALK_WATER1 & 0x1FF,
    NA_SE_PL_WALK_WATER2 & 0x1FF, NA_SE_PL_WALK_MAGMA & 0x1FF,  NA_SE_PL_WALK_GRASS & 0x1FF,
    NA_SE_PL_WALK_GLASS & 0x1FF,  NA_SE_PL_WALK_LADDER & 0x1FF, NA_SE_PL_WALK_GROUND & 0x1FF,
    NA_SE_PL_WALK_ICE & 0x1FF,    NA_SE_PL_WALK_IRON & 0x1FF,
};

// original name: T_BGCheck_PosErrorCheck
s32 func_80038600(Vec3f* pos, char* file, s32 line) {
    if (pos->x >= 32760.0f || pos->x <= -32760.0f || pos->y >= 32760.0f || pos->y <= -32760.0f || pos->z >= 32760.0f ||
        pos->z <= -32760.0f) {
        osSyncPrintf(VT_FGCOL(RED));
        // "Translates to: Position is invalid."
        osSyncPrintf("T_BGCheck_PosErrorCheck():位置が妥当ではありません。pos (%f,%f,%f) file:%s line:%d\n", pos->x,
                     pos->y, pos->z, file, line);
        osSyncPrintf(VT_RST);
        return true;
    }
    return false;
}

// Set SSNode
void func_80038708(SSNode* node, s16* polyId, u16 next) {
    node->polyId = *polyId;
    node->next = next;
}

// Set SS_NULL
void func_8003871C(u16* arg0) {
    *arg0 = SS_NULL;
}

// Set SSNodeList
void func_80038728(SSNodeList* nodeList, u16* next, s16* polyId) {
    u16 newNode = func_8003E4DC(nodeList);

    func_80038708(&nodeList->tbl[newNode], polyId, *next);
    *next = newNode;
}

// Set DynaSSNodeList
void func_80038780(DynaSSNodeList* arg0, u16* next, s16* polyId) {
    u16 newNode = func_80038878(arg0);

    if (!(newNode != SS_NULL)) {
        __assert("new_node != SS_NULL", "../z_bgcheck.c", 1776);
    }

    func_80038708(&arg0->tbl[newNode], polyId, *next);
    *next = newNode;
}

// Init DynaSSNodeList
void func_800387FC(GlobalContext* globalCtx, DynaSSNodeList* nodeList) {
    nodeList->tbl = NULL;
    nodeList->count = 0;
}

// Initialize DynaSSNodeList tbl
void func_8003880C(GlobalContext* globalCtx, DynaSSNodeList* nodeList, s32 max) {
    nodeList->tbl = THA_AllocEndAlign(&globalCtx->state.tha, max * 4, -2);

    if (!(nodeList->tbl != NULL)) {
        __assert("psst->tbl != NULL", "../z_bgcheck.c", 1811);
    }

    nodeList->max = max;
    nodeList->count = 0;
}

// Reset DynaSSNodeList count
void func_80038870(DynaSSNodeList* arg0) {
    arg0->count = 0;
}

// Get next DynaSSNodeList item
u16 func_80038878(DynaSSNodeList* arg0) {
    u16 var = arg0->count++;

    if (arg0->max <= var) {
        return SS_NULL;
    }

    return var;
}

// original name: T_BGCheck_Vec3sToVec3f
void func_800388A8(Vec3s* src, Vec3f* dst) {
    dst->x = src->x;
    dst->y = src->y;
    dst->z = src->z;
}

// original name: T_BGCheck_Vec3fToVec3s
void func_800388E8(Vec3s* dst, Vec3f* src) {
    dst->x = src->x;
    dst->y = src->y;
    dst->z = src->z;
}

// Get CollisionPoly's lowest y point
s16 func_80038924(CollisionPoly* poly, Vec3s* vtxList) {
    s32 a, b, c;
    s16 min;

    // If the y normal is 1 or -1, then return any y coordinate
    if (poly->norm.y == 0x7FFF || poly->norm.y == -0x7FFF) {
        return vtxList[VTX_INDEX(poly->flags_vIA)].y;
    }

    a = VTX_INDEX(poly->flags_vIA);
    b = VTX_INDEX(poly->flags_vIB);
    c = poly->vIC;

    min = vtxList[a].y;

    if (min > vtxList[b].y) {
        min = vtxList[b].y;
    }
    if (min < vtxList[c].y) {
        return min;
    }
    return vtxList[c].y;
}

// CollisionPoly get unit normal
void func_800389D4(CollisionPoly* poly, f32* unitNormX, f32* unitNormY, f32* unitNormZ) {
    *unitNormX = COLPOLY_GET_NORM(poly->norm.x);
    *unitNormY = COLPOLY_GET_NORM(poly->norm.y);
    *unitNormZ = COLPOLY_GET_NORM(poly->norm.z);
}

// Compute ? matrix
void func_80038A28(CollisionPoly* poly, f32 x, f32 y, f32 z, MtxF* mtxF) {
    f32 nX;
    f32 nY;
    f32 nZ;
    s32 pad[1];
    f32 phi_f2;
    f32 phi_f14;
    f32 phi_f12;
    f32 inv_phi_f2;
    f32 inv_phi_f14;

    if (poly == NULL) {
        return;
    }
    func_800389D4(poly, &nX, &nY, &nZ);

    phi_f2 = sqrtf(1.0f - SQ(nX));
    if (!IS_ZERO(phi_f2)) {
        inv_phi_f2 = 1.0f / phi_f2;
        phi_f14 = nY * inv_phi_f2;
        phi_f12 = -(nZ * inv_phi_f2);
    } else {
        phi_f14 = sqrtf(1.0f - SQ(nY));
        if (1) {
            if (!IS_ZERO(phi_f14)) {
                inv_phi_f14 = (1.0f / phi_f14);
                phi_f12 = nX * inv_phi_f14;
                phi_f2 = -(nZ * inv_phi_f14);
            } else {
                phi_f12 = 0.0f;
                phi_f2 = 0.0f;
            }
        }
    }
    mtxF->xx = phi_f2;
    mtxF->xy = (-nX) * phi_f14;
    mtxF->xz = nX * phi_f12;
    mtxF->yx = nX;
    mtxF->yy = nY;
    mtxF->yz = nZ;
    mtxF->zy = phi_f12;
    mtxF->zz = phi_f14;
    mtxF->xw = 0.0f;
    mtxF->yw = 0.0f;
    mtxF->zx = 0.0f;
    mtxF->zw = 0.0f;
    mtxF->wx = x;
    mtxF->wy = y;
    mtxF->wz = z;
    mtxF->ww = 1.0f;
}

// Calculate point distance from plane
f32 func_80038B7C(CollisionPoly* poly, Vec3f* point) {
    return (poly->norm.x * point->x + poly->norm.y * point->y + poly->norm.z * point->z) * COLPOLY_NORM_FRAC +
           poly->dist;
}

// Get Poly Verts
void func_80038BE0(CollisionPoly* poly, Vec3s* vtxList, Vec3f* dest) {
    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIA)], &dest[0]);
    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIB)], &dest[1]);
    func_800388A8(&vtxList[poly->vIC], &dest[2]);
}

// original name: T_Polygon_GetVertex_bg_ai
// Get Vertex by bgId
void func_80038C78(CollisionPoly* poly, s32 bgId, CollisionContext* colCtx, Vec3f* destPoly) {
    Vec3s* vtxList;

    if (poly == NULL || bgId > BG_ACTOR_MAX || destPoly == NULL) {
        osSyncPrintf(VT_COL(RED, WHITE));
        // translates to: "Argument not appropriate. Processing terminated."
        osSyncPrintf("T_Polygon_GetVertex_bg_ai(): Error %d %d %d 引数が適切ではありません。処理を終了します。\n",
                     poly == NULL, bgId > BG_ACTOR_MAX, destPoly == NULL);
        osSyncPrintf(VT_RST);

        if (destPoly != NULL) {
            destPoly[2].z = 0.0f;
            destPoly[1].z = 0.0f;
            destPoly[1].y = 0.0f;
            destPoly[1].x = 0.0f;
            destPoly[0].z = 0.0f;
            destPoly[0].y = 0.0f;
            destPoly[0].x = 0.0f;
        }
    } else {
        if (bgId == BG_ACTOR_MAX) {
            vtxList = colCtx->colHeader->vtxList;
        } else {
            vtxList = colCtx->dyna.vtxList;
        }

        func_80038BE0(poly, vtxList, destPoly);
    }
}

// Checks if point (`x`,`z`) is within `chkDist` of `poly`, computing `yIntersect` if true
// Determinant max 300.0f
s32 func_80038D48(CollisionPoly* poly, Vec3s* vtxList, f32 x, f32 z, f32* yIntersect, f32 chkDist) {
    static Vec3f polyVtxs[3];
    f32 nX;
    f32 nY;
    f32 nZ;
    Vec3s* vA;
    Vec3s* vB;
    Vec3s* vC;

    vA = &vtxList[VTX_INDEX(poly->flags_vIA)];
    Math_Vec3s_ToVec3f(&polyVtxs[0], vA);
    vB = &vtxList[VTX_INDEX(poly->flags_vIB)];
    Math_Vec3s_ToVec3f(&polyVtxs[1], vB);
    vC = &vtxList[poly->vIC];
    Math_Vec3s_ToVec3f(&polyVtxs[2], vC);

    nX = COLPOLY_GET_NORM(poly->norm.x);
    nY = COLPOLY_GET_NORM(poly->norm.y);
    nZ = COLPOLY_GET_NORM(poly->norm.z);

    return Math3D_TriChkPointParaYIntersectDist(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], nX, nY, nZ, poly->dist, z, x,
                                                yIntersect, chkDist);
}

// Checks if point (`x`,`z`) is within `chkDist` of `poly`, computing `yIntersect` if true
// Determinant max 0.0f (checks if on or within poly)
s32 func_80038E78(CollisionPoly* poly, Vec3s* vtxList, f32 x, f32 z, f32* yIntersect, f32 chkDist) {
    static Vec3f polyVtxs[3];
    f32 nX;
    f32 nY;
    f32 nZ;

    func_80038BE0(poly, vtxList, polyVtxs);
    func_800389D4(poly, &nX, &nY, &nZ);
    return Math3D_TriChkPointParaYIntersectInsideTri(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], nX, nY, nZ, poly->dist,
                                                     z, x, yIntersect, chkDist);
}

// Checks if point (`x`,`z`) is within 1.0f of `poly`, computing `yIntersect` if true
// Determinant max 300.0f
s32 func_80038F20(CollisionPoly* poly, Vec3s* vtxList, f32 x, f32 z, f32* yIntersect) {
    return func_80038D48(poly, vtxList, x, z, yIntersect, 1.0f);
}

// Checks if point (`y`,`z`) is within 1.0f of `poly`, computing `xIntersect` if true
// Determinant max 300.0f
s32 func_80038F60(CollisionPoly* poly, Vec3s* vtxList, f32 y, f32 z, f32* xIntersect) {
    static Vec3f polyVtxs[3];
    f32 nX;
    f32 nY;
    f32 nZ;

    func_80038BE0(poly, vtxList, polyVtxs);
    func_800389D4(poly, &nX, &nY, &nZ);
    return Math3D_TriChkPointParaXIntersect(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], nX, nY, nZ, poly->dist, y, z,
                                            xIntersect);
}

// Checks if point (`x`,`y`) is within 1.0f of `poly`, computing `zIntersect` if true
// Determinant max 300.0f
s32 func_80039000(CollisionPoly* poly, Vec3s* vtxList, f32 x, f32 y, f32* zIntersect) {
    static Vec3f polyVtxs[3];
    f32 nX;
    f32 nY;
    f32 nZ;

    func_80038BE0(poly, vtxList, polyVtxs);
    func_800389D4(poly, &nX, &nY, &nZ);
    return Math3D_TriChkPointParaZIntersect(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], nX, nY, nZ, poly->dist, x, y,
                                            zIntersect);
}

// Test if travelling from `pointA` to `pointB` intersects `poly`
//`planeIntersect` is the point at which the line from `pointA` to `pointB` crosses `poly`'s plane
s32 func_800390A0(CollisionPoly* poly, Vec3s* vtxList, Vec3f* pointA, Vec3f* pointB, Vec3f* planeIntersect, s32 arg5,
                  f32 chkDist) {
    f32 planeDistA;
    f32 planeDistB;
    f32 planeDistDelta;
    static Vec3f polyVtxs[3];
    static Plane plane;

    plane.originDist = poly->dist;
    planeDistA = (poly->norm.x * pointA->x + poly->norm.y * pointA->y + poly->norm.z * pointA->z) * COLPOLY_NORM_FRAC +
                 plane.originDist;
    planeDistB = (poly->norm.x * pointB->x + poly->norm.y * pointB->y + poly->norm.z * pointB->z) * COLPOLY_NORM_FRAC +
                 plane.originDist;

    planeDistDelta = planeDistA - planeDistB;
    if ((0.0f <= planeDistA && 0.0f <= planeDistB) || (planeDistA < 0.0f && planeDistB < 0.0f) ||
        (arg5 != 0 && planeDistA < 0.0f && 0.0f < planeDistB) || IS_ZERO(planeDistDelta)) {
        return false;
    }

    func_800389D4(poly, &plane.normal.x, &plane.normal.y, &plane.normal.z);
    func_80038BE0(poly, vtxList, polyVtxs);
    Math3D_LineSplitRatio(pointA, pointB, planeDistA / planeDistDelta, planeIntersect);
    if ((0.5f < fabsf(plane.normal.x) && Math3D_TriChkPointParaXDist(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], &plane,
                                                                     planeIntersect->y, planeIntersect->z, chkDist)) ||
        (0.5f < fabsf(plane.normal.y) && Math3D_TriChkPointParaYDist(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], &plane,
                                                                     planeIntersect->z, planeIntersect->x, chkDist)) ||
        (0.5f < fabsf(plane.normal.z) &&
         Math3D_TriChkLineSegParaZDist(&polyVtxs[0], &polyVtxs[1], &polyVtxs[2], &plane, planeIntersect->x,
                                       planeIntersect->y, chkDist))) {
        return true;
    }
    return false;
}

// Tests if sphere `center` `radius` intersects `poly`
s32 func_8003937C(CollisionPoly* poly, Vec3s* vtxList, Vec3f* center, f32 radius) {
    static Sphere16 sphere;
    static TriNorm tri;
    Vec3f intersect;

    func_80038BE0(poly, vtxList, tri.vtx);
    func_800389D4(poly, &tri.plane.normal.x, &tri.plane.normal.y, &tri.plane.normal.z);
    tri.plane.originDist = poly->dist;
    sphere.center.x = center->x;
    sphere.center.y = center->y;
    sphere.center.z = center->z;
    sphere.radius = radius;
    return Math3D_TriVsSphIntersect(&sphere, &tri, &intersect);
}

#ifdef NON_MATCHING
// Add poly to lookup table. Table is sorted by poly's smallest y vertex component
// lookupId = SSNodeList insert id
// polyList = CollisionPoly lookup list
// vtxList = vertex lookup list
// polyId = index into polyList of CollisionPoly to insert into the lookup table
//
// regalloc issues
void func_80039448(CollisionContext* colCtx, u16* lookupId, CollisionPoly* polyList, Vec3s* vtxList, s16 polyId) {
    SSNode* ssCur; // t1, sp24
    SSNode* ssNext;
    CollisionPoly* poly;
    s32 yMin;
    u16 nextPos;

    // if list is null
    if (SS_NULL == *lookupId) {
        func_80038728(&colCtx->polyNodes, lookupId, &polyId);
        return;
    }

    yMin = func_80038924(&polyList[polyId], vtxList);

    // regalloc issues
    ssCur = &colCtx->polyNodes.tbl[*lookupId];
    poly = &polyList[ssCur->polyId];

    // if the poly being inserted is already the poly with the lowest y component
    if (yMin < vtxList[VTX_INDEX(poly->flags_vIA)].y && yMin < vtxList[VTX_INDEX(poly->flags_vIB)].y &&
        yMin < vtxList[poly->vIC].y) {

        func_80038728(&colCtx->polyNodes, lookupId, &polyId);
        return;
    }
    while (true) {
        // if list->next is null
        if (SS_NULL == ssCur->next) {
            if (poly->flags_vIA) {}
            nextPos = func_8003E4DC(&colCtx->polyNodes);
            func_80038708(&colCtx->polyNodes.tbl[nextPos], &polyId, SS_NULL);
            ssCur->next = nextPos;
            return;
        }

        // regalloc issues
        if (1) {
            ssNext = &colCtx->polyNodes.tbl[ssCur->next];
            poly = polyList + ssNext->polyId;
        }

        // if the poly being inserted is lower than the next poly
        if (yMin < vtxList[VTX_INDEX(poly->flags_vIA)].y && yMin < vtxList[VTX_INDEX(poly->flags_vIB)].y &&
            yMin < vtxList[poly->vIC].y) {

            nextPos = func_8003E4DC(&colCtx->polyNodes);
            func_80038708(&colCtx->polyNodes.tbl[nextPos], &polyId, ssCur->next);
            ssCur->next = nextPos;
            return;
        }
        ssCur = ssNext;
    }
}
#else
void func_80039448(CollisionContext* colCtx, u16* lookupId, CollisionPoly* polyList, Vec3s* vtxList, s16 polyId);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_80039448.s")
#endif

// Add CollisionPoly to static lookup list
void func_8003965C(Lookup* lookup, CollisionContext* colCtx, CollisionPoly* polyList, Vec3s* vtxList, s16 index) {
    if (polyList[index].norm.y >= 0x4000) {
        func_80039448(colCtx, &lookup->floor, polyList, vtxList, index);

    } else if (polyList[index].norm.y <= -0x6666) {
        func_80039448(colCtx, &lookup->ceiling, polyList, vtxList, index);

    } else {
        func_80039448(colCtx, &lookup->wall, polyList, vtxList, index);
    }
}

#ifdef NON_MATCHING
// Locates the closest static poly directly underneath `pos`, starting at list `nodeId`
// returns yIntersect of the closest poly, or `yIntersectStart`
// stores the pointer of the closest poly to `outPoly`
// if (flags & 1), ignore polys with a norm.y < 0 (from vertical walls to ceilings)
//
// Codegen issues
f32 func_800396F0(CollisionContext* colCtx, u16 xpFlags, u16* nodeId, CollisionPoly** outPoly, Vec3f* pos,
                  f32 yIntersectStart, f32 chkDist, s32 flags) {
    f32 yIntersect;          // sp78
    Vec3s* vtxList;          // a1
    s32 polyId;              // s0
    CollisionPoly* poly;     // v1
    CollisionPoly* polyList; // t0
    SSNode* curNode;         // s1
    f32 result;              // f0

    result = yIntersectStart;
    if (SS_NULL == *nodeId) {
        return result;
    }

    curNode = &colCtx->polyNodes.tbl[*nodeId];

    // 0924
    while (true) {
        polyList = colCtx->colHeader->polyList;
        polyId = curNode->polyId;
        poly = &polyList[polyId];

        if (VIA_FLAG_TEST(poly->flags_vIA, xpFlags) || ((flags & 1) && poly->norm.y < 0)) {

            if (SS_NULL == curNode->next) {
                break;
            }
            curNode = &colCtx->polyNodes.tbl[curNode->next];
            // continue;
        } else {
            vtxList = colCtx->colHeader->vtxList;
            if (pos->y < vtxList[VTX_INDEX(poly->flags_vIA)].y && pos->y < vtxList[VTX_INDEX(poly->flags_vIB)].y &&
                pos->y < vtxList[(s32)poly->vIC].y) {
                break;
            }

            if (func_80038E78(poly, vtxList, pos->x, pos->z, &yIntersect, chkDist) == true) {
                // if poly is closer to pos without going over
                if (yIntersect < pos->y && result < yIntersect) {

                    result = yIntersect;
                    *outPoly = &colCtx->colHeader->polyList[polyId];
                }
            }

            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }
    }
    return result;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_800396F0.s")
f32 func_800396F0(CollisionContext* colCtx, u16 xpFlags, u16* nodeId, CollisionPoly** outPoly, Vec3f* pos,
                  f32 yIntersectStart, f32 chkDist, s32 flags);
#endif

// Locates the closest static poly directly underneath `pos` within `lookup`.
// returns yIntersect of the closest poly, or `yIntersectStart`
// stores the pointer of the closest poly to `outPoly`
f32 func_8003992C(Lookup* lookup, CollisionContext* colCtx, u16 xpFlags, CollisionPoly** poly, Vec3f* pos, u32 arg5,
                  f32 chkDist, f32 yIntersectStart) {
    s32 flag; // skip polys with norm.y < 0
    f32 yIntersect = yIntersectStart;

    if (arg5 & 4) {
        yIntersect = func_800396F0(colCtx, xpFlags, &lookup->floor, poly, pos, yIntersect, chkDist, 0);
    }

    if ((arg5 & 2) || (arg5 & 8)) {
        flag = 0;
        if (arg5 & 0x10) {
            flag = 1;
        }
        yIntersect = func_800396F0(colCtx, xpFlags, &lookup->wall, poly, pos, yIntersect, chkDist, flag);
    }

    if (arg5 & 1) {
        flag = 0;
        if (arg5 & 0x10) {
            flag = 1;
        }
        yIntersect = func_800396F0(colCtx, xpFlags, &lookup->ceiling, poly, pos, yIntersect, chkDist, flag);
    }

    return yIntersect;
}

// Compute wall displacement, and test if poly is not a damage wall
// returns true if `poly` is null or not a damage wall, else false
// returns x, z displacement in `outX` `outZ`, and the pointer to `poly in `outPoly`
// `arg7` is 1 / sqrt( sq(poly.norm.x) + sq(poly.norm.z) )
s32 func_80039A3C(CollisionContext* colCtx, CollisionPoly* poly, f32* outX, f32* outZ, f32 nx, f32 ny, f32 nz, f32 arg7,
                  f32 planeDist, f32 radius, CollisionPoly** outPoly) {
    CollisionPoly* wallPoly;
    u32 surfaceData;
    u32 wallDamage;
    f32 displacement = (radius - planeDist) * arg7;

    *outX += displacement * nx;
    *outZ += displacement * nz;

    wallPoly = *outPoly;
    if (wallPoly == NULL) {
        *outPoly = poly;
        return true;
    }

    surfaceData = colCtx->colHeader->polygonTypes[wallPoly->type].data[1];
    wallDamage = surfaceData & 0x08000000 ? 1 : 0;

    if (!wallDamage) {
        *outPoly = poly;
        return true;
    }
    return false;
}

#ifdef NON_MATCHING
// Performs collision detection on static poly walls within `lookup` on sphere `pos`, `radius`
// returns true if a collision was detected
// `outX` `outZ` return the displaced x,z coordinates,
// `outPoly` returns the pointer to the nearest poly collided with, or NULL
//
// codegen issues
s32 func_80039AEC(Lookup* lookup, CollisionContext* colCtx, u16 xpFlags, f32* outX, f32* outZ, Vec3f* pos, f32 radius,
                  CollisionPoly** outPoly) {
    // f32 sp104;
    Vec3f resultPos; // spFC
    f32 temp_f2;
    f32 temp_f2_2;
    f32 planeDist;           // f30
    f32 intersect;           // spEC
    s32 result;              // spE8
    CollisionPoly* poly;     // s0
    CollisionPoly* polyList; // spE0
    f32 temp_f0;             // pad
    f32 temp_f14;            // sp9C
    f32 temp_f0_3;           // f0
    f32 xTemp;               // f0
    s32 pad2;
    f32 ac_size;     // f20
    f32 nX;          // f22
    f32 nY;          // f26
    f32 nZ;          // f24
    f32 temp_f16;    // spB8
    Vec3s* vtxList;  // s2
    u16 pad;         // temp_v0;
    SSNode* curNode; // s1
    f32 zMin;        // f2
    f32 zMax;        // f12
    f32 xMin;        // f2
    f32 xMax;        //  f12

    result = false;
    if (SS_NULL == lookup->wall) {
        return result;
    }
    resultPos = *pos;

    polyList = colCtx->colHeader->polyList;
    vtxList = colCtx->colHeader->vtxList;
    curNode = &colCtx->polyNodes.tbl[lookup->wall];

    while (true) {
        poly = &polyList[curNode->polyId];
        if (pos->y < vtxList[VTX_INDEX(poly->flags_vIA)].y && pos->y < vtxList[VTX_INDEX(poly->flags_vIB)].y &&
            pos->y < vtxList[poly->vIC].y) {
            break;
        }

        nX = COLPOLY_GET_NORM(poly->norm.x);
        nY = COLPOLY_GET_NORM(poly->norm.y);
        nZ = COLPOLY_GET_NORM(poly->norm.z);
        ac_size = sqrtf(SQ(nX) + SQ(nZ));
        planeDist = Math3D_DistPlaneToPos(nX, nY, nZ, poly->dist, &resultPos);
        if (radius < fabsf(planeDist) || VIA_FLAG_TEST(poly->flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        (!IS_ZERO(ac_size)) ? (void)0 : __assert("!IS_ZERO(ac_size)", "../z_bgcheck.c", 2854);
        temp_f14 = 1.0f / ac_size;
        temp_f16 = fabsf(nZ) * temp_f14;
        if (temp_f16 < 0.4f) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        // compute poly zMin/zMax
        zMin = zMax = vtxList[VTX_INDEX(poly->flags_vIA)].z;
        temp_f0_3 = vtxList[VTX_INDEX(poly->flags_vIB)].z;

        if (temp_f0_3 < zMax) {
            zMin = temp_f0_3;
        } else if (zMax < temp_f0_3) {
            zMin = zMax;
            zMax = temp_f0_3;
        }
        temp_f0_3 = vtxList[poly->vIC].z;
        if (temp_f0_3 < zMin) {
            zMin = temp_f0_3;
        } else if (zMax < temp_f0_3) {
            zMax = temp_f0_3;
        }

        zMin -= radius;
        zMax += radius;

        if (resultPos.z < zMin || zMax < resultPos.z) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if (func_80039000(poly, vtxList, resultPos.x, pos->y, &intersect)) {
            temp_f2 = intersect - resultPos.z;
            if (fabsf(temp_f2) <= radius / temp_f16) {
                if (temp_f2 * nZ <= 4.0f) {
                    func_80039A3C(colCtx, poly, &resultPos.x, &resultPos.z, nX, nY, nZ, temp_f14, planeDist, radius,
                                  outPoly);
                    result = true;
                }
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &colCtx->polyNodes.tbl[curNode->next];
        }
    }

    curNode = &colCtx->polyNodes.tbl[lookup->wall];

    while (true) {
        poly = &polyList[curNode->polyId];
        if (pos->y < vtxList[VTX_INDEX(poly->flags_vIA)].y && pos->y < vtxList[VTX_INDEX(poly->flags_vIB)].y &&
            pos->y < vtxList[poly->vIC].y) {
            break;
        }

        nX = COLPOLY_GET_NORM(poly->norm.x);
        nY = COLPOLY_GET_NORM(poly->norm.y);
        nZ = COLPOLY_GET_NORM(poly->norm.z);
        ac_size = sqrtf(SQ(nX) + SQ(nZ));
        planeDist = Math3D_DistPlaneToPos(nX, nY, nZ, poly->dist, &resultPos);
        if (radius < fabsf(planeDist) || VIA_FLAG_TEST(poly->flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        (!IS_ZERO(ac_size)) ? (void)0 : __assert("!IS_ZERO(ac_size)", "../z_bgcheck.c", 2964);
        temp_f14 = 1.0f / ac_size;
        temp_f16 = fabsf(nX) * temp_f14;
        if (temp_f16 < 0.4f) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        // compute poly xMin/xMax
        xMin = xMax = vtxList[VTX_INDEX(poly->flags_vIA)].x;
        temp_f0_3 = vtxList[VTX_INDEX(poly->flags_vIB)].x;

        if (temp_f0_3 < xMax) {
            xMin = temp_f0_3;
        } else if (xMax < temp_f0_3) {
            xMin = xMax;
            xMax = temp_f0_3;
        }
        temp_f0_3 = vtxList[poly->vIC].x;
        if (temp_f0_3 < xMin) {
            xMin = temp_f0_3;
        } else if (xMax < temp_f0_3) {
            xMax = temp_f0_3;
        }

        xMin -= radius;
        xMax += radius;

        if (resultPos.x < xMin || xMax < resultPos.x) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if (func_80038F60(poly, vtxList, pos->y, resultPos.z, &intersect)) {
            temp_f2 = intersect - resultPos.x;
            if (fabsf(temp_f2) <= radius / temp_f16) {
                if (temp_f2 * nX <= 4.0f) {
                    func_80039A3C(colCtx, poly, &resultPos.x, &resultPos.z, nX, nY, nZ, temp_f14, planeDist, radius,
                                  outPoly);
                    result = true;
                }
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &colCtx->polyNodes.tbl[curNode->next];
            continue;
        }
    }

    *outX = resultPos.x;
    *outZ = resultPos.z;
    return result;
}
#else
s32 func_80039AEC(Lookup* lookup, CollisionContext* colCtx, u16 xpFlags, f32* outX, f32* outZ, Vec3f* pos, f32 radius,
                  CollisionPoly** outPoly);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_80039AEC.s")
#endif

// Static Poly Something ceiling detection related
s32 func_8003A3E0(Lookup* lookup, u16 xpFlags, CollisionContext* colCtx, f32* arg3, Vec3f* pos, f32 arg5,
                  CollisionPoly** outPoly) {
    s32 result = false;
    u16 nextId;
    CollisionPoly* poly;
    CollisionPoly* polyList;
    f32 yIntersect;
    Vec3s* vtxList;
    SSNode* curNode;
    u16 ceiling;

    ceiling = lookup->ceiling;
    if (SS_NULL == ceiling) {
        return false;
    }
    curNode = &colCtx->polyNodes.tbl[ceiling];
    polyList = colCtx->colHeader->polyList;
    vtxList = colCtx->colHeader->vtxList;

    *arg3 = pos->y;

    while (true) {
        s32 id = curNode->polyId;
        if (VIA_FLAG_TEST(colCtx->colHeader->polyList[id].flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        poly = &polyList[id];
        if (func_80038F20(poly, vtxList, pos->x, pos->z, &yIntersect)) {
            f32 temp_f0 = yIntersect - *arg3;
            f32 nY = COLPOLY_GET_NORM(poly->norm.y);
            if (0.0f < temp_f0 && temp_f0 < arg5) {
                if (temp_f0 * nY <= 0) {

                    *arg3 = yIntersect - arg5;
                    *outPoly = poly;
                    result = true;
                }
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &colCtx->polyNodes.tbl[curNode->next];
            continue;
        }
    }
    return result;
}

s32 func_8003A5B8(u16* node, CollisionContext* colCtx, u16 xpFlagsA, u16 xpFlagsB, Vec3f* pointA, Vec3f* pointB,
                  Vec3f* arg6, CollisionPoly** outPoly, f32* arg8, f32 arg9, s32 argA) {
    SSNode* curNode;
    u8* checkedPoly;
    Vec3f polyIntersect;
    CollisionPoly* polyList;
    CollisionPoly* curPoly;
    s32 result;
    f32 minY;
    f32 temp_f0_2;
    s16 polyId;
    u16 curNodeId;

    result = false;
    polyList = colCtx->colHeader->polyList;
    curNodeId = *node;
    if (SS_NULL == curNodeId) {
        return result;
    }

    curNode = colCtx->polyNodes.tbl + curNodeId;
    while (true) {
        polyId = curNode->polyId;
        checkedPoly = colCtx->polyNodes.polyCheckTbl + polyId;

        if (*checkedPoly == true || VIA_FLAG_TEST(polyList[polyId].flags_vIA, xpFlagsA) ||
            !(xpFlagsB == 0 || VIA_FLAG_TEST(polyList[polyId].flags_vIA, xpFlagsB))) {

            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = colCtx->polyNodes.tbl + curNode->next;
                continue;
            }
        }
        *checkedPoly = true;
        curPoly = polyId + polyList;
        minY = (f32)func_80038924(curPoly, colCtx->colHeader->vtxList);
        if (pointA->y < minY && pointB->y < minY) {
            break;
        }
        if (func_800390A0(curPoly, colCtx->colHeader->vtxList, pointA, pointB, &polyIntersect, (argA & 8) != 0, arg9)) {
            temp_f0_2 = Math3D_Vec3fDistSq(pointA, &polyIntersect);
            if (temp_f0_2 < *arg8) {

                *arg8 = temp_f0_2;
                *arg6 = polyIntersect;
                *pointB = polyIntersect;
                *outPoly = curPoly;
                result = true;
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        }
        curNode = colCtx->polyNodes.tbl + curNode->next;
    }
    return result;
}

s32 func_8003A7D8(Lookup* lookup, CollisionContext* colCtx, u16 arg2, u16 arg3, Vec3f* arg4, Vec3f* arg5, Vec3f* arg6,
                  CollisionPoly** arg7, f32 arg8, f32* arg9, s32 argA) {
    s32 result = false;
    if (argA & 2) {
        if (lookup->floor != SS_NULL) {
            if (func_8003A5B8(&lookup->floor, colCtx, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg8, argA) != 0) {
                result = true;
            }
        }
    }

    if (argA & 1) {
        if (lookup->wall != SS_NULL) {
            if (func_8003A5B8(&lookup->wall, colCtx, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg8, argA) != 0) {
                result = true;
            }
        }
    }

    if (argA & 4) {
        if (lookup->ceiling != SS_NULL) {
            if (func_8003A5B8(&lookup->ceiling, colCtx, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg8, argA) != 0) {
                result = true;
            }
        }
    }
    return result;
}

#ifdef NON_MATCHING
// right ops, wrong order
s32 func_8003A95C(SSNode* node, u16 xpFlags, CollisionContext* colCtx, Vec3f* center, f32 radius,
                  CollisionPoly** outPoly) {

    CollisionPoly* curPoly;
    u16 nextId;
    SSNode* curNode;
    CollisionPoly* polyList;
    Vec3s* vtxList;

    curNode = node;
    vtxList = colCtx->colHeader->vtxList;
    polyList = colCtx->colHeader->polyList;

    while (true) {
        s16 id = curNode->polyId;

        curPoly = &polyList[id];
        if (VIA_FLAG_TEST(colCtx->colHeader->polyList[id].flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &colCtx->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        if (center->y + radius < vtxList[VTX_INDEX(curPoly->flags_vIA)].y &&
            center->y + radius < vtxList[VTX_INDEX(curPoly->flags_vIB)].y &&
            center->y + radius < vtxList[curPoly->vIC].y) {
            break;
        }
        if (func_8003937C(curPoly, vtxList, center, radius)) {
            *outPoly = curPoly;
            return true;
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &colCtx->polyNodes.tbl[curNode->next];
        }
    }
    return false;
}
#else
s32 func_8003A95C(SSNode* node, u16 xpFlags, CollisionContext* colCtx, Vec3f* center, f32 radius,
                  CollisionPoly** outPoly);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8003A95C.s")
#endif //  NON_MATCHING

// Test if sphere is colliding with scene
s32 func_8003AB28(Lookup* lookup, u16 xpFlags, CollisionContext* colCtx, Vec3f* center, f32 radius,
                  CollisionPoly** outPoly, u16 xpoFlags) {
    if (lookup->floor != SS_NULL && (xpoFlags & COLPOLY_IGNORE_FLOOR) == 0 &&
        func_8003A95C(&colCtx->polyNodes.tbl[lookup->floor], xpFlags, colCtx, center, radius, outPoly)) {
        return true;
    }

    if (lookup->wall != SS_NULL && (xpoFlags & COLPOLY_IGNORE_WALL) == 0 &&
        func_8003A95C(&colCtx->polyNodes.tbl[lookup->wall], xpFlags, colCtx, center, radius, outPoly)) {
        return true;
    }

    if (lookup->ceiling != SS_NULL && (xpoFlags & COLPOLY_IGNORE_CEILING) == 0 &&
        func_8003A95C(&colCtx->polyNodes.tbl[lookup->ceiling], xpFlags, colCtx, center, radius, outPoly)) {
        return true;
    }

    return false;
}

// Get Lookup sector
// Does not return null
Lookup* func_8003AC54(CollisionContext* colCtx, Lookup* lookup, Vec3f* pos) {
    Vec3i sector;
    s32 regFix;

    func_8003ADC8(colCtx, pos, &sector);
    regFix = colCtx->subdivisions.x;
    return (sector.z * regFix) * colCtx->subdivisions.y + lookup + sector.x + sector.y * regFix;
}

// Get Lookup sector
// Returns null if just outside the mesh bounding box
Lookup* func_8003AD00(CollisionContext* colCtx, Lookup* lookup, Vec3f* pos) {
    Vec3i sector;
    s32 regFix;

    if (!func_8003C55C(colCtx, pos)) {
        return NULL;
    }
    func_8003ADC8(colCtx, pos, &sector);
    regFix = colCtx->subdivisions.x;
    return (sector.z * regFix) * colCtx->subdivisions.y + lookup + sector.x + sector.y * regFix;
}

// Get Lookup position
void func_8003ADC8(CollisionContext* colCtx, Vec3f* pos, Vec3i* sector) {
    sector->x = (pos->x - colCtx->minBounds.x) * colCtx->inverseUnitSize.x;
    sector->y = (pos->y - colCtx->minBounds.y) * colCtx->inverseUnitSize.y;
    sector->z = (pos->z - colCtx->minBounds.z) * colCtx->inverseUnitSize.z;

    if (sector->x < 0) {
        sector->x = 0;
    } else if (sector->x >= colCtx->subdivisions.x) {
        sector->x = colCtx->subdivisions.x - 1;
    }

    if (sector->y < 0) {
        sector->y = 0;
    } else if (sector->y >= colCtx->subdivisions.y) {
        sector->y = colCtx->subdivisions.y - 1;
    }

    if (sector->z < 0) {
        sector->z = 0;
    } else if (sector->z >= colCtx->subdivisions.z) {
        sector->z = colCtx->subdivisions.z - 1;
    }
}

// Get Negative Bias Lookup position
// decrements result Lookup coordinate if within 50 units of the negative boundary
void func_8003AEA8(CollisionContext* colCtx, Vec3f* pos, s32* sx, s32* sy, s32* sz) {
    f32 temp1 = pos->x - colCtx->minBounds.x;
    f32 temp2 = pos->y - colCtx->minBounds.y;
    f32 temp3 = pos->z - colCtx->minBounds.z;
    *sx = temp1 * colCtx->inverseUnitSize.x;
    *sy = temp2 * colCtx->inverseUnitSize.y;
    *sz = temp3 * colCtx->inverseUnitSize.z;

    if (((s32)temp1 % (s32)colCtx->unitSize.x < 50) && (*sx > 0)) {
        *sx -= 1;
    }

    if (((s32)temp2 % (s32)colCtx->unitSize.y < 50) && (*sy > 0)) {
        *sy -= 1;
    }

    if (((s32)temp3 % (s32)colCtx->unitSize.z < 50) && (*sz > 0)) {
        *sz -= 1;
    }
}

// Get Positive Bias Lookup position
// increments result Lookup coordinate if within 50 units of the postive boundary
void func_8003B04C(CollisionContext* colCtx, Vec3f* pos, s32* sx, s32* sy, s32* sz) {
    f32 temp1 = pos->x - colCtx->minBounds.x;
    f32 temp2 = pos->y - colCtx->minBounds.y;
    f32 temp3 = pos->z - colCtx->minBounds.z;
    *sx = temp1 * colCtx->inverseUnitSize.x;
    *sy = temp2 * colCtx->inverseUnitSize.y;
    *sz = temp3 * colCtx->inverseUnitSize.z;

    if (((s32)colCtx->unitSize.x - 50 < (s32)temp1 % (s32)colCtx->unitSize.x) && (*sx < colCtx->subdivisions.x - 1)) {
        *sx += 1;
    }

    if (((s32)colCtx->unitSize.y - 50 < (s32)temp2 % (s32)colCtx->unitSize.y) && (*sy < colCtx->subdivisions.y - 1)) {
        *sy += 1;
    }

    if (((s32)colCtx->unitSize.z - 50 < (s32)temp3 % (s32)colCtx->unitSize.z) && (*sz < colCtx->subdivisions.z - 1)) {
        *sz += 1;
    }
}

// Calculate CollisionPoly's Lookup grid coordinate range
void func_8003B218(CollisionContext* colCtx, Vec3s* vtxList, CollisionPoly* polyList, s32* gridMinX, s32* gridMinY,
                   s32* gridMinZ, s32* gridMaxX, s32* gridMaxY, s32* gridMaxZ, s16 polyId) {
    u16* vtxDataTemp;
    Vec3f minVtx;
    Vec3f maxVtx;

    f32 x;
    f32 y;
    f32 z;

    Vec3s* vtx;
    s16 vtxId;

    vtxId = VTX_INDEX(polyList[polyId].vtxData[0]);

    Math_Vec3s_ToVec3f(&maxVtx, &vtxList[vtxId]);
    Math_Vec3f_Copy(&minVtx, &maxVtx);
    for (vtxDataTemp = polyList[polyId].vtxData + 1; vtxDataTemp < polyList[polyId].vtxData + 3; vtxDataTemp++) {
        vtxId = VTX_INDEX(*vtxDataTemp);
        vtx = vtxId + vtxList;
        x = vtx->x;
        y = vtx->y;
        z = vtx->z;

        if (x < minVtx.x) {
            minVtx.x = x;
        } else if (maxVtx.x < x) {
            maxVtx.x = x;
        }

        if (y < minVtx.y) {
            minVtx.y = y;
        } else if (maxVtx.y < y) {
            maxVtx.y = y;
        }

        if (z < minVtx.z) {
            minVtx.z = z;
        } else if (maxVtx.z < z) {
            maxVtx.z = z;
        }
    }
    func_8003AEA8(colCtx, &minVtx, gridMinX, gridMinY, gridMinZ);
    func_8003B04C(colCtx, &maxVtx, gridMaxX, gridMaxY, gridMaxZ);
}

s32 func_8003B3C8(Vec3f* min, Vec3f* max, CollisionPoly* polyList, Vec3s* vtxList, s16 polyId) {
    f32 intersect;
    Vec3f va2;
    Vec3f vb2;
    Vec3f vc2;
    CollisionPoly* poly;
    f32 nx;
    f32 ny;
    f32 nz;
    f32 dist;
    Vec3f va;
    Vec3f vb;
    Vec3f vc;
    s32 flags[3];

    flags[0] = flags[1] = 0;
    poly = &polyList[polyId];

    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIA)], &va);
    flags[0] = Math3D_PointRelativeToCubeFaces(&va, min, max);
    if (flags[0] == 0) {
        return true;
    }
    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIB)], &vb);
    flags[1] = Math3D_PointRelativeToCubeFaces(&vb, min, max);
    if (flags[1] == 0) {
        return true;
    }
    func_800388A8(&vtxList[poly->vIC], &vc);
    flags[2] = Math3D_PointRelativeToCubeFaces(&vc, min, max);
    if (flags[2] == 0) {
        return true;
    }
    if (flags[0] & flags[1] & flags[2]) {
        return false;
    }

    flags[0] |= Math3D_PointRelativeToCubeEdges(&va, min, max) << 8;
    flags[1] |= Math3D_PointRelativeToCubeEdges(&vb, min, max) << 8;
    flags[2] |= Math3D_PointRelativeToCubeEdges(&vc, min, max) << 8;
    if (flags[0] & flags[1] & flags[2]) {
        return false;
    }

    flags[0] |= Math3D_PointRelativeToCubeVertices(&va, min, max) << 0x18;
    flags[1] |= Math3D_PointRelativeToCubeVertices(&vb, min, max) << 0x18;
    flags[2] |= Math3D_PointRelativeToCubeVertices(&vc, min, max) << 0x18;
    if (flags[0] & flags[1] & flags[2]) {
        return false;
    }

    func_800389D4(poly, &nx, &ny, &nz);
    dist = poly->dist;
    if (Math3D_TriChkLineSegParaYIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->z, min->x, &intersect, min->y,
                                           max->y) ||
        Math3D_TriChkLineSegParaYIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->z, min->x, &intersect, min->y,
                                           max->y) ||
        Math3D_TriChkLineSegParaYIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->z, max->x, &intersect, min->y,
                                           max->y) ||
        Math3D_TriChkLineSegParaYIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->z, max->x, &intersect, min->y,
                                           max->y)) {
        return true;
    }
    if (Math3D_TriChkLineSegParaZIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->x, min->y, &intersect, min->z,
                                           max->z) ||
        Math3D_TriChkLineSegParaZIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->x, max->y, &intersect, min->z,
                                           max->z) ||
        Math3D_TriChkLineSegParaZIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->x, min->y, &intersect, min->z,
                                           max->z) ||
        Math3D_TriChkLineSegParaZIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->x, max->y, &intersect, min->z,
                                           max->z)) {
        return true;
    }
    if (Math3D_TriChkLineSegParaXIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->y, min->z, &intersect, min->x,
                                           max->x) ||
        Math3D_TriChkLineSegParaXIntersect(&va, &vb, &vc, nx, ny, nz, dist, min->y, max->z, &intersect, min->x,
                                           max->x) ||
        Math3D_TriChkLineSegParaXIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->y, min->z, &intersect, min->x,
                                           max->x) ||
        Math3D_TriChkLineSegParaXIntersect(&va, &vb, &vc, nx, ny, nz, dist, max->y, max->z, &intersect, min->x,
                                           max->x)) {
        return true;
    }
    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIA)], &va2);
    func_800388A8(&vtxList[VTX_INDEX(poly->flags_vIB)], &vb2);
    func_800388A8(&vtxList[poly->vIC], &vc2);
    if (Math3D_LineVsCube(min, max, &va2, &vb2) || Math3D_LineVsCube(min, max, &vb2, &vc2) ||
        Math3D_LineVsCube(min, max, &vc2, &va2)) {
        return true;
    }
    return false;
}

#ifdef NON_MATCHING
// regalloc, stack
// arg2 = lookup table start
u32 func_8003BB18(CollisionContext* colCtx, GlobalContext* globalCtx, Lookup* arg2) {

    Vec3s* temp_s4;
    CollisionPoly* temp_s5;
    s32 spEC; // total number of polys
    s32 spE8; // current poly
    s32 phi_s1;
    s32 spE0;
    s32 spDC;
    // xyz gridMin
    s32 gxMinD8;
    s32 gyMinD4;
    s32 gzMinD0;
    // xyx grid max
    s32 gxMaxCC;
    s32 gyMaxC8;
    s32 gzMaxC4;

    Vec3f spB8; // poly box min xyz
    Vec3f spAC; // poly box max xyz
    Lookup* phi_v0;

    Lookup* spA4;
    Lookup* phi_s0;
    Lookup* phi_fp;
    s32 sp98;

    f32 temp_f22;
    f32 temp_f24;
    f32 temp_f26;

    CollisionHeader* colHeader = colCtx->colHeader;

    for (phi_v0 = arg2; phi_v0 < (colCtx->subdivisions.x * colCtx->subdivisions.y * colCtx->subdivisions.z + arg2);
         phi_v0++) {
        phi_v0->floor = SS_NULL;
        phi_v0->wall = SS_NULL;
        phi_v0->ceiling = SS_NULL;
    }
    spEC = colHeader->nbPolygons;
    temp_s4 = colHeader->vtxList;
    temp_s5 = colHeader->polyList;
    sp98 = colCtx->subdivisions.x * colCtx->subdivisions.y;
    temp_f22 = colCtx->unitSize.x + 100.0f;
    temp_f24 = colCtx->unitSize.y + 100.0f;
    temp_f26 = colCtx->unitSize.z + 100.0f;

    for (spE8 = 0; spE8 < spEC; spE8++) { // 2DF4 ish to 3068
        func_8003B218(colCtx, temp_s4, temp_s5, &gxMinD8, &gyMinD4, &gzMinD0, &gxMaxCC, &gyMaxC8, &gzMaxC4, spE8);

        spA4 = gzMinD0 * sp98 + arg2;
        spB8.z = (colCtx->unitSize.z * gzMinD0 + colCtx->minBounds.z) - 50.0f;
        spAC.z = spB8.z + temp_f26;

        for (spDC = gzMinD0; spDC < gzMaxC4 + 1; spDC++) { // 2EA8

            phi_fp = (colCtx->subdivisions.x * gyMinD4) + spA4;
            spB8.y = (colCtx->unitSize.y * gyMinD4 + colCtx->minBounds.y) - 50.0f;
            spAC.y = spB8.y + temp_f24;

            for (spE0 = gyMinD4; spE0 < gyMaxC8 + 1; spE0++) { // 2F00

                phi_s0 = gxMinD8 + phi_fp;
                spB8.x = (colCtx->unitSize.x * gxMinD8 + colCtx->minBounds.x) - 50.0f;
                spAC.x = spB8.x + temp_f22;

                for (phi_s1 = gxMinD8; phi_s1 < gxMaxCC + 1; phi_s1++) // 2F5C
                {
                    if (func_8003B3C8(&spB8, &spAC, temp_s5, temp_s4, spE8) != 0) {
                        func_8003965C(phi_s0, colCtx, temp_s5, temp_s4, spE8);
                    }
                    spB8.x += colCtx->unitSize.x;
                    spAC.x += colCtx->unitSize.x;
                    phi_s0++;
                } // 2FC0

                spB8.y += colCtx->unitSize.y;
                spAC.y += colCtx->unitSize.y;
                phi_fp += colCtx->subdivisions.x;
            }
            spB8.z += colCtx->unitSize.z;
            spAC.z += colCtx->unitSize.z;
            spA4 += sp98;
        }
    }
    return colCtx->polyNodes.count * sizeof(SSNode);
}
#else
// Initialize Static Poly Lookup Table
u32 func_8003BB18(CollisionContext* colCtx, GlobalContext* globalCtx, Lookup* arg2);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8003BB18.s")
#endif

s16 spotScenes[19] = {
    /* 0x51 */ SCENE_SPOT00,
    /* 0x52 */ SCENE_SPOT01,
    /* 0x53 */ SCENE_SPOT02,
    /* 0x54 */ SCENE_SPOT03,
    /* 0x55 */ SCENE_SPOT04,
    /* 0x56 */ SCENE_SPOT05,
    /* 0x57 */ SCENE_SPOT06,
    /* 0x58 */ SCENE_SPOT07,
    /* 0x59 */ SCENE_SPOT08,
    /* 0x5A */ SCENE_SPOT09,
    /* 0x5B */ SCENE_SPOT10,
    /* 0x5C */ SCENE_SPOT11,
    /* 0x5D */ SCENE_SPOT12,
    /* 0x5E */ SCENE_SPOT13,
    /* 0x5F */ SCENE_SPOT15,
    /* 0x60 */ SCENE_SPOT16,
    /* 0x61 */ SCENE_SPOT17,
    /* 0x62 */ SCENE_SPOT18,
    /* 0x63 */ SCENE_SPOT20,
};

s32 func_8003BF18(GlobalContext* globalCtx) {
    s16* i;

    for (i = spotScenes; i < spotScenes + ARRAY_COUNT(spotScenes); i++) {
        if (globalCtx->sceneNum == *i) {
            return true;
        }
    }
    return false;
}

struct BgChkMem {
    s16 sceneId;
    u32 size;
};

struct BgChkMem D_80119E54[8] = { { SCENE_SPOT00, 0xB798 },     { SCENE_GANON_FINAL, 0x78C8 },
                                  { SCENE_GANON_DEMO, 0x70C8 }, { SCENE_JYASINBOSS, 0xACC8 },
                                  { SCENE_KENJYANOMA, 0x70C8 }, { SCENE_JYASINZOU, 0x16CC8 },
                                  { SCENE_HIDAN, 0x198C8 },     { SCENE_GANON_BOSS, 0x84C8 } };

s32 func_8003BF5C(s32 sceneId, u32* size) {
    s32 i;
    for (i = 0; i < 8; i++) {
        if (sceneId == D_80119E54[i].sceneId) {
            *size = D_80119E54[i].size;
            return true;
        }
    }
    return false;
}

// Compute division unit sizes for scene mesh lookup, for a single dimension
void func_8003BFF4(f32 min, s32 subdivisions, f32* max, f32* unitSize, f32* inverseUnitSize) {
    f32 temp_f14;
    f32 length;

    length = (*max - min);
    temp_f14 = (s32)(length / subdivisions) + 1;

    *unitSize = temp_f14;
    *unitSize = (temp_f14 < 150.0f) ? 150.0f : *unitSize;
    *inverseUnitSize = 1.0f / *unitSize;

    *max = *unitSize * subdivisions + min;
}

struct BgChkMemDungeon {
    s16 sceneId;
    Vec3s subdivisions;
    u32 unk_0x08;
};

struct BgChkMemDungeon D_80119E94[2] = { { SCENE_HAKADAN, { 23, 7, 14 }, -1 }, { SCENE_BMORI1, { 38, 1, 38 }, -1 } };

void func_8003C078(CollisionContext* colCtx, GlobalContext* globalCtx, CollisionHeader* colHeader) {
    u32 tblMax;
    u32 memSize;
    u32 temp_s2;
    SSNodeList* nodeList;
    s32 phi_a0;
    u32 sp40;
    s32 customTblMax;
    s32 i;

    colCtx->colHeader = colHeader;
    customTblMax = -1;
    osSyncPrintf("/*---------------- BGCheck バッファーメモリサイズ -------------*/\n");
    // /*---------------- BGCheck Buffer Memory Size -------------*/\n

    if (YREG(15) == 0x10 || YREG(15) == 0x20 || YREG(15) == 0x30 || YREG(15) == 0x40) {
        if (globalCtx->sceneNum == SCENE_MALON_STABLE) {
            osSyncPrintf("/* BGCheck LonLonサイズ %dbyte */\n", 0x3520);
            // /* BGCheck LonLon Size %dbyte */\n
            colCtx->dyna.memSize = 0x3520U;
        } else {
            osSyncPrintf("/* BGCheck ミニサイズ %dbyte */\n", 0x4E20);
            // /* BGCheck Mini Size %dbyte */\n
            colCtx->dyna.memSize = 0x4E20U;
        }
        colCtx->dyna.polyNodesMax = 500;
        colCtx->dyna.polyListMax = 256;
        colCtx->dyna.vtxListMax = 256;
        colCtx->subdivisions.x = 2;
        colCtx->subdivisions.y = 2;
        colCtx->subdivisions.z = 2;
    } else if (func_8003BF18(globalCtx) == true) {
        colCtx->dyna.memSize = 0xF000U;
        osSyncPrintf("/* BGCheck Spot用サイズ %dbyte */\n", 0xF000);
        // /* BGCheck Spot Size %dbyte */\n
        colCtx->dyna.polyNodesMax = 1000;
        colCtx->dyna.polyListMax = 512;
        colCtx->dyna.vtxListMax = 512;
        colCtx->subdivisions.x = 16;
        colCtx->subdivisions.y = 4;
        colCtx->subdivisions.z = 16;
    } else {
        if (func_8003BF5C(globalCtx->sceneNum, &sp40) != 0) {
            colCtx->dyna.memSize = sp40;
        } else {
            colCtx->dyna.memSize = 0x1CC00U;
        }
        osSyncPrintf("/* BGCheck ノーマルサイズ %dbyte  */\n", colCtx->dyna.memSize);
        // /* BGCheck Normal Size %dbyte  */\n
        colCtx->dyna.polyNodesMax = 1000;
        colCtx->dyna.polyListMax = 512;
        colCtx->dyna.vtxListMax = 512;
        phi_a0 = 0;

        for (i = 0; i < 2; i++) {
            if (globalCtx->sceneNum == D_80119E94[i].sceneId) {
                colCtx->subdivisions.x = D_80119E94[i].subdivisions.x;
                colCtx->subdivisions.y = D_80119E94[i].subdivisions.y;
                colCtx->subdivisions.z = D_80119E94[i].subdivisions.z;
                phi_a0 = 1;
                customTblMax = D_80119E94[i].unk_0x08;
            }
        }
        if (phi_a0 == 0) {
            colCtx->subdivisions.x = 16;
            colCtx->subdivisions.y = 4;
            colCtx->subdivisions.z = 16;
        }
    }
    colCtx->lookupTbl = THA_AllocEndAlign(
        &globalCtx->state.tha,
        ((colCtx->subdivisions.x * sizeof(Vec3s)) * colCtx->subdivisions.y) * colCtx->subdivisions.z, -2);
    if (colCtx->lookupTbl == NULL) {
        LogUtils_HungupThread("../z_bgcheck.c", 4176);
    }
    colCtx->minBounds.x = colCtx->colHeader->minBounds.x;
    colCtx->minBounds.y = colCtx->colHeader->minBounds.y;
    colCtx->minBounds.z = colCtx->colHeader->minBounds.z;
    colCtx->maxBounds.x = colCtx->colHeader->maxBounds.x;
    colCtx->maxBounds.y = colCtx->colHeader->maxBounds.y;
    colCtx->maxBounds.z = colCtx->colHeader->maxBounds.z;
    func_8003BFF4(colCtx->minBounds.x, colCtx->subdivisions.x, &colCtx->maxBounds.x, &colCtx->unitSize.x,
                  &colCtx->inverseUnitSize.x);
    func_8003BFF4(colCtx->minBounds.y, colCtx->subdivisions.y, &colCtx->maxBounds.y, &colCtx->unitSize.y,
                  &colCtx->inverseUnitSize.y);
    func_8003BFF4(colCtx->minBounds.z, colCtx->subdivisions.z, &colCtx->maxBounds.z, &colCtx->unitSize.z,
                  &colCtx->inverseUnitSize.z);
    memSize = colCtx->subdivisions.x * sizeof(Lookup) * colCtx->subdivisions.y * colCtx->subdivisions.z +
              colCtx->colHeader->nbPolygons + colCtx->dyna.polyNodesMax * sizeof(SSNode) +
              colCtx->dyna.polyListMax * sizeof(CollisionPoly) + colCtx->dyna.vtxListMax * sizeof(Vec3s) +
              sizeof(CollisionContext);
    if (customTblMax > 0) {
        tblMax = (u32)customTblMax;
    } else {
        if (colCtx->dyna.memSize < memSize) {
            LogUtils_HungupThread("../z_bgcheck.c", 4230);
        }
        tblMax = (colCtx->dyna.memSize - memSize) / sizeof(SSNode);
    }

    func_8003E398(&colCtx->polyNodes);
    func_8003E3AC(globalCtx, &colCtx->polyNodes, tblMax, colCtx->colHeader->nbPolygons);

    temp_s2 = func_8003BB18(colCtx, globalCtx, colCtx->lookupTbl);
    osSyncPrintf(VT_FGCOL(GREEN));
    osSyncPrintf("/*---結局 BG使用サイズ %dbyte---*/\n", memSize + temp_s2);
    osSyncPrintf(VT_RST);

    func_8003E954(globalCtx, &colCtx->dyna);
    func_8003E9A0(globalCtx, &colCtx->dyna);
}

// original name: T_BGCheck_getBGDataInfo
CollisionHeader* func_8003C4C4(CollisionContext* colCtx, s32 bgId) {
    if (bgId == BG_ACTOR_MAX) {
        return colCtx->colHeader;
    }
    if (bgId < 0 || bgId > BG_ACTOR_MAX) {
        return NULL;
    }
    if (!(colCtx->dyna.flags[bgId] & 1)) {
        osSyncPrintf(VT_COL(YELLOW, BLACK));
        osSyncPrintf("T_BGCheck_getBGDataInfo():そのbg_actor_indexは使われておりません。index=%d\n");
        osSyncPrintf(VT_RST);
        return NULL;
    }
    return colCtx->dyna.bgActors[bgId].colHeader;
}

// Test if pos is near collision boundaries
s32 func_8003C55C(CollisionContext* colCtx, Vec3f* pos) {
    if (pos->x < (colCtx->minBounds.x - 50.0f) || (colCtx->maxBounds.x + 50.0f) < pos->x ||
        pos->y < (colCtx->minBounds.y - 50.0f) || (colCtx->maxBounds.y + 50.0f) < pos->y ||
        pos->z < (colCtx->minBounds.z - 50.0f) || (colCtx->maxBounds.z + 50.0f) < pos->z) {
        return false;
    }
    return true;
}

// Raycast Toward Floor
// returns the yIntersect of the nearest poly found directly below `pos`, or BGCHECK_Y_MIN if no floor detected
// returns the poly found in `outPoly`, and the bgId of the entity in `outBgId`
f32 func_8003C614(GlobalContext* globalCtx, CollisionContext* colCtx, u16 xpFlags, CollisionPoly** outPoly,
                  s32* outBgId, Vec3f* pos, Actor* actor, u32 arg7, f32 chkDist) {

    f32 yIntersectDyna;
    s32* temp_a0;
    Lookup* lookupTbl;
    Vec3f checkPos;
    Lookup* lookup;
    s8003FBF4 sp6C;
    f32 yIntersect;

    *outBgId = BGCHECK_SCENE;
    *outPoly = NULL;
    lookupTbl = colCtx->lookupTbl;
    yIntersect = BGCHECK_Y_MIN;
    checkPos = *pos;

    while (true) {
        if (checkPos.y < colCtx->minBounds.y) {
            break;
        }
        if (func_80038600(&checkPos, "../z_bgcheck.c", 4410)) {
            if (actor != NULL) {
                osSyncPrintf("こいつ,pself_actor->name %d\n", actor->id);
            }
        }
        lookup = func_8003AD00(colCtx, lookupTbl, &checkPos);
        if (lookup == NULL) {
            checkPos.y -= colCtx->unitSize.y;
            continue;
        }
        yIntersect = func_8003992C(lookup, colCtx, xpFlags, outPoly, pos, arg7, chkDist, BGCHECK_Y_MIN);
        if (BGCHECK_Y_MIN < yIntersect) {
            break;
        }
        checkPos.y -= colCtx->unitSize.y;
    }

    sp6C.colCtx = colCtx;
    sp6C.xpFlags = xpFlags;
    sp6C.yIntersect = yIntersect;
    sp6C.pos = pos;
    sp6C.actor = actor;
    sp6C.unk_20 = arg7;
    sp6C.chkDist = chkDist;
    sp6C.globalCtx = globalCtx;
    sp6C.resultPoly = outPoly;
    sp6C.bgId = outBgId;

    yIntersectDyna = func_8003FDDC(&sp6C);

    if (yIntersect < yIntersectDyna) {
        yIntersect = yIntersectDyna;
    }

    if (yIntersect != BGCHECK_Y_MIN) {
        if (func_80041EC8(colCtx, *outPoly, *outBgId) != 0) {
            yIntersect -= 1.0f;
        }
    }
    return yIntersect;
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003C834(CollisionContext* colCtx, CollisionPoly** outPoly, Vec3f* pos) {
    s32 bgId;

    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_CAMERA, outPoly, &bgId, pos, NULL, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003C890(CollisionContext* colCtx, CollisionPoly** outPoly, Vec3f* pos) {
    s32 bgId;

    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, &bgId, pos, NULL, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003C8EC(GlobalContext* globalCtx, CollisionContext* colCtx, CollisionPoly** outPoly, Vec3f* pos) {
    s32 bgId;

    return func_8003C614(globalCtx, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, &bgId, pos, NULL, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003C940(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, NULL, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003C9A4(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, actor, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CA0C(GlobalContext* globalCtx, CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor,
                  Vec3f* pos) {
    return func_8003C614(globalCtx, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, actor, 0x1C, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CA64(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos, f32 chkDist) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, actor, 0x1C, chkDist);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CAC8(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, actor, 0x06, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CB30(CollisionContext* colCtx, CollisionPoly* outPoly, Vec3f* pos) {
    CollisionPoly* tempPoly;
    f32 result;
    s32 bgId;

    result = func_8003C614(NULL, colCtx, COLPOLY_IGNORE_NONE, &tempPoly, &bgId, pos, NULL, 0x1C, 1.0f);
    if (tempPoly != NULL) {
        *outPoly = *tempPoly;
    }
    return result;
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CBE8(CollisionContext* colCtx, CollisionPoly* outPoly, s32* bgId, Vec3f* pos) {
    CollisionPoly* tempPoly;
    f32 result;

    result = func_8003C614(NULL, colCtx, COLPOLY_IGNORE_NONE, &tempPoly, bgId, pos, NULL, 0x1C, 1.0f);
    if (tempPoly != NULL) {
        *outPoly = *tempPoly;
    }
    return result;
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CCA4(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_CAMERA, outPoly, bgId, pos, NULL, 0x06, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CD08(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Actor* actor, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, actor, 0x02, 1.0f);
}

// Public raycast toward floor
// returns yIntersect of the poly found, or BGCHECK_Y_MIN if no poly detected
f32 func_8003CD70(CollisionContext* colCtx, CollisionPoly** outPoly, s32* bgId, Vec3f* pos) {
    return func_8003C614(NULL, colCtx, COLPOLY_IGNORE_ENTITY, outPoly, bgId, pos, NULL, 0x06, 1.0f);
}

// NTSC 1.0 8002F8E0
s32 func_8003CDD4(CollisionContext* colCtx, u16 xpFlags, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 arg5,
                  CollisionPoly** outPoly, s32* outBgId, Actor* actor, f32 checkHeight, u8 argA) {
    Lookup* lookupTbl;
    f32 temp_f0;
    s32 result;
    CollisionPoly* poly;
    f32 dx, dy, dz; // change between posPrev to posNext
    Vec3f spB8;
    s32 spB4;
    Vec3f spA8;
    s32 bgId;
    f32 temp_f0_2;
    f32 f32temp;
    f32 nx2, nz2;
    Vec3f sp88;
    Vec3f sp7C;
    f32 temp_f14;
    f32 temp_f14_2;
    f32 nx3, nz3;
    s32 phi_v0;
    Vec3f sp5C;
    s32 bgId2;
    f32 nx, ny, nz; // unit normal of polygon

    result = false;
    *outBgId = BGCHECK_SCENE;
    *outPoly = NULL;
    lookupTbl = colCtx->lookupTbl;
    *posResult = *posNext;
    dx = posNext->x - posPrev->x;
    dy = posNext->y - posPrev->y;
    dz = posNext->z - posPrev->z;
    if (func_80038600(posNext, "../z_bgcheck.c", 4831) == 1 || func_80038600(posPrev, "../z_bgcheck.c", 4832) == 1) {
        if (actor != NULL) {
            osSyncPrintf("こいつ,pself_actor->name %d\n", actor->id);
        }
    }
    if (dx != 0.0f || dz != 0.0f) {
        if ((argA & 1) == 0) {
            if ((checkHeight + dy) < 5.0f) {
                result = func_8003D7F0(colCtx, xpFlags, 0, posPrev, posNext, &spA8, &poly, &bgId, actor, 1.0f, 0x1B);
                if (result != false) {
                    ny = COLPOLY_GET_NORM(poly->norm.y);
                    if (0.5f < ny) {
                        posResult->x = spA8.x;
                        if (1.0f < checkHeight) {
                            posResult->y = spA8.y - 1.0f;
                        } else {
                            posResult->y = spA8.y - checkHeight;
                        }
                        posResult->z = spA8.z;
                    } else {
                        nx = COLPOLY_GET_NORM(poly->norm.x);
                        nz = COLPOLY_GET_NORM(poly->norm.z);
                        posResult->x = arg5 * nx + spA8.x;
                        posResult->y = arg5 * ny + spA8.y;
                        posResult->z = arg5 * nz + spA8.z;
                    }
                    *outPoly = poly;
                    *outBgId = bgId;
                }
            } else {
                phi_v0 = SQ(arg5) < (SQ(dx) + SQ(dz)) ? 0x1B : 0x19;
                sp88 = *posNext;
                sp88.y += checkHeight;
                sp7C = *posPrev;
                sp7C.y = sp88.y;
                result = func_8003D7F0(colCtx, xpFlags, 0, &sp7C, &sp88, &spA8, &poly, &bgId, actor, 1.0f, phi_v0);

                if (result != false) {
                    nx2 = COLPOLY_GET_NORM(poly->norm.x);
                    nz2 = COLPOLY_GET_NORM(poly->norm.z);
                    temp_f14 = sqrtf(SQ(nx2) + SQ(nz2));
                    if (!IS_ZERO(temp_f14)) {
                        f32temp = (1.0f / temp_f14);
                        temp_f0 = arg5 * f32temp;
                        posResult->x = temp_f0 * nx2 + spA8.x;
                        posResult->z = temp_f0 * nz2 + spA8.z;
                        *outPoly = poly;
                        *outBgId = bgId;
                        result = true;
                    }
                }
            }
        }
    }
    spB8 = *posResult;
    spB4 = false;
    spB8.y += checkHeight;
    if (func_800409A8(colCtx, xpFlags, &posResult->x, &posResult->z, &spB8, arg5, outPoly, outBgId, actor)) {
        result = true;
        spB4 = true;
        spB8 = *posResult;
        spB8.y += checkHeight;
    }
    if (func_8003C55C(colCtx, posNext) == true &&
        func_80039AEC(func_8003AC54(colCtx, lookupTbl, posResult), colCtx, xpFlags, &posResult->x, &posResult->z, &spB8,
                      arg5, outPoly) != 0) {
        *outBgId = BGCHECK_SCENE;
        result = true;
    }
    if (spB4 == true || *outBgId != BGCHECK_SCENE) {
        if (func_8003D7F0(colCtx, xpFlags, 0, posPrev, posResult, &sp5C, &poly, &bgId2, actor, 1.0f, 9)) {
            nx3 = COLPOLY_GET_NORM(poly->norm.x);
            nz3 = COLPOLY_GET_NORM(poly->norm.z);
            temp_f14_2 = sqrtf(SQ(nx3) + SQ(nz3));

            if (!IS_ZERO(temp_f14_2)) {
                f32temp = 1.0f / temp_f14_2;
                temp_f0_2 = arg5 * f32temp;
                posResult->x = temp_f0_2 * nx3 + sp5C.x;
                posResult->z = temp_f0_2 * nz3 + sp5C.z;
                *outPoly = poly;
                *outBgId = bgId2;
                result = true;
            }
        }
    }
    return result;
}

s32 func_8003D464(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 arg4,
                  CollisionPoly** outPoly, f32 checkHeight) {
    s32 bgId;

    return func_8003CDD4(colCtx, COLPOLY_IGNORE_ENTITY, posResult, posNext, posPrev, arg4, outPoly, &bgId, NULL,
                         checkHeight, 0);
}

s32 func_8003D4C8(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 arg4,
                  CollisionPoly** outPoly, s32* outBgId, f32 checkHeight) {
    return func_8003CDD4(colCtx, COLPOLY_IGNORE_ENTITY, posResult, posNext, posPrev, arg4, outPoly, outBgId, NULL,
                         checkHeight, 0);
}

s32 func_8003D52C(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 arg4,
                  CollisionPoly** outPoly, s32* outBgId, Actor* actor, f32 checkHeight) {
    return func_8003CDD4(colCtx, COLPOLY_IGNORE_ENTITY, posResult, posNext, posPrev, arg4, outPoly, outBgId, actor,
                         checkHeight, 0);
}

s32 func_8003D594(CollisionContext* colCtx, Vec3f* posResult, Vec3f* posNext, Vec3f* posPrev, f32 arg4,
                  CollisionPoly** outPoly, s32* outBgId, Actor* actor, f32 checkHeight) {
    return func_8003CDD4(colCtx, COLPOLY_IGNORE_ENTITY, posResult, posNext, posPrev, arg4, outPoly, outBgId, actor,
                         checkHeight, 1);
}

s32 func_8003D600(CollisionContext* colCtx, u16 xpFlags, f32* yIntersect, Vec3f* pos, f32 arg4, CollisionPoly** outPoly,
                  s32* outBgId, Actor* actor) {
    Lookup* lookupTbl;
    Lookup* lookup;
    s32 result;
    Vec3f sp40;
    f32 sp3C;

    *outBgId = BGCHECK_SCENE;
    *yIntersect = pos->y;
    if (func_80038600(pos, "../z_bgcheck.c", 5206) == true) {
        if (actor != NULL) {
            osSyncPrintf("こいつ,pself_actor->name %d\n", actor->id);
        }
    }
    lookupTbl = colCtx->lookupTbl;
    if (func_8003C55C(colCtx, pos) == false) {
        return false;
    }

    lookup = func_8003AC54(colCtx, lookupTbl, pos);
    result = func_8003A3E0(lookup, xpFlags, colCtx, yIntersect, pos, arg4, outPoly);

    sp40 = *pos;
    sp40.y = *yIntersect;
    sp3C = *yIntersect;

    if (func_80040E40(colCtx, xpFlags, &sp3C, &sp40, arg4, outPoly, outBgId, actor) != 0) {
        *yIntersect = sp3C;
        result = true;
    }
    return result;
}

s32 func_8003D754(CollisionContext* colCtx, f32* arg1, Vec3f* arg2, f32 arg3) {
    CollisionPoly* poly;
    s32 bgId;

    return func_8003D600(colCtx, COLPOLY_IGNORE_NONE, arg1, arg2, arg3, &poly, &bgId, NULL);
}

s32 func_8003D7A0(CollisionContext* colCtx, f32* arg1, Vec3f* arg2, f32 arg3, CollisionPoly** outPoly, s32* outBgId,
                  Actor* actor) {
    return func_8003D600(colCtx, COLPOLY_IGNORE_ENTITY, arg1, arg2, arg3, outPoly, outBgId, actor);
}

#ifdef NON_MATCHING
// arg3 = posA
// arg4 = posB
// arg5 = posFinal?
// arg7 = bgId
// regalloc, issues with spCC/spC0 for loop
s32 func_8003D7F0(CollisionContext* colCtx, u16 arg1, u16 arg2, Vec3f* arg3, Vec3f* arg4, Vec3f* arg5,
                  CollisionPoly** arg6, s32* arg7, Actor* arg8, f32 arg9, s32 argA) {
    Lookup* phi_a3; // spD8
    Vec3i spCC;     // posA sector
    Vec3i spC0;     // posB sector
    s32 spBC;       // phi_t0
    s32 spB8;       // result
    f32 spB4;
    Vec3f spA8; // posB temp

    Vec3f sp9C;     // minSector //*temp_s3
    Vec3f sp90;     // maxSector //temp_s4
    s32 phi_a2;     // sp84, y
    Lookup* phi_a1; // sp80
    s32 temp_lo;    // s32 sp6C;

    s32 temp_a1; // swapA
    s32 temp_a2; // swapB

    Lookup* temp_s1; // colCtx->lookupTbl
    s32* phi_v1;
    s32* phi_v0;
    s32 phi_t0;     // x
    Lookup* phi_s0; // lookupCur
    s32 phi_s1;     // z

    temp_s1 = colCtx->lookupTbl;
    spA8 = *arg4;
    *arg7 = BGCHECK_SCENE;
    if ((func_80038600(arg3, "../z_bgcheck.c", 5334) == true) ||
        (func_80038600(arg4, "../z_bgcheck.c", 5335) == true)) {
        if (arg8 != NULL) {
            osSyncPrintf("こいつ,pself_actor->name %d\n", arg8->id);
        } else {
            osSyncPrintf("pself_actor == NULLで犯人不明\n");
        }
    }
    func_80041978(&colCtx->polyNodes, colCtx->colHeader->nbPolygons);
    func_8003ADC8(colCtx, arg3, &spCC);
    func_8003ADC8(colCtx, &spA8, &spC0);
    *arg5 = *arg4;
    spB8 = false;
    spB4 = 1.0e38f;
    *arg6 = NULL;

    if (spCC.x != spC0.x || spCC.y != spC0.y || spCC.z != spC0.z) {
        // AB4B0C
        for (phi_v1 = &spC0, phi_v0 = &spCC; phi_v0 < (s32*)&spCC + 3; phi_v0++, phi_v1++) {

            // loop_8:
            temp_a1 = *phi_v1;
            temp_a2 = *phi_v0;
            if (temp_a1 < temp_a2) {
                *phi_v1 = temp_a2;
                *phi_v0 = temp_a1;
            }
        }
        // ab4b38

        temp_lo = colCtx->subdivisions.x * colCtx->subdivisions.y;
        sp9C.z = spCC.z * colCtx->unitSize.z + colCtx->minBounds.z; // temp_f4
        sp90.z = colCtx->unitSize.z + sp9C.z;

        phi_a3 = spCC.z * temp_lo + temp_s1;

        // ab4bbc //loop_13:
        for (phi_t0 = spCC.z; phi_t0 < spC0.z + 1; phi_t0++) {
            phi_a1 = spCC.y * colCtx->subdivisions.x + phi_a3;
            sp9C.y = spCC.y * colCtx->unitSize.y + colCtx->minBounds.y; // temp_f8
            sp90.y = colCtx->unitSize.y + sp9C.y;
            // loop_15:
            for (phi_a2 = spCC.y; phi_a2 < spC0.y + 1; phi_a2++) {
                sp9C.x = spCC.x * colCtx->unitSize.x + colCtx->minBounds.x; // temp_f16
                sp90.x = colCtx->unitSize.x + sp9C.x;
                phi_s0 = spCC.x + phi_a1;
                // loop_17:

                // ab4c7c
                for (phi_s1 = spCC.x; phi_s1 < spC0.x + 1; phi_s1++) {
                    if (Math3D_LineVsCube(&sp9C, &sp90, arg3, &spA8) == true &&
                        func_8003A7D8(phi_s0, colCtx, arg1, arg2, arg3, &spA8, arg5, arg6, arg9, &spB4, argA) != 0) {
                        spB8 = true;
                    }
                    phi_s0 += 1;
                    sp9C.x += colCtx->unitSize.x;
                    sp90.x += colCtx->unitSize.x;
                }
                // ab4d28
                phi_a1 += colCtx->subdivisions.x;
                sp9C.y += colCtx->unitSize.y;
                sp90.y += colCtx->unitSize.y;
            }

            phi_a3 += temp_lo;
            sp9C.z += colCtx->unitSize.z;
            sp90.z += colCtx->unitSize.z;
        }

    }
    // ab4db8
    else {
        if (func_8003C55C(colCtx, arg3) == 0) {
            return false;
        }
        spB8 = func_8003A7D8(func_8003AC54(colCtx, temp_s1, arg3), colCtx, arg1, arg2, arg3, &spA8, arg5, arg6, arg9,
                             &spB4, argA);
        if (spB8 == true) {
            spB4 = Math3D_Vec3fDistSq(arg5, arg3);
        }
    }
    // ab4e40
    if ((argA & 0x10) && func_80041240(colCtx, arg1, arg3, &spA8, arg5, arg6, &spB4, arg7, arg8, arg9, argA)) {
        spB8 = true;
    }
    return spB8;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8003D7F0.s")
#endif

u32 func_8003DD28(u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4) {
    u32 result;

    result = 0;
    if (arg0 != 0) {
        result = 1;
    }
    if (arg1 != 0) {
        result |= 2;
    }
    if (arg2 != 0) {
        result |= 4;
    }
    if (arg3 != 0) {
        result |= 8;
    }
    if (arg4 != 0) {
        result |= 0x10;
    }
    return result;
}

s32 func_8003DD6C(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, u32 arg5,
                  u32 arg6, u32 arg7, u32 arg8, s32* bgId) {
    return func_8003D7F0(colCtx, 1, 0, arg1, arg2, arg3, outPoly, bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003DDF8(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, u32 arg5,
                  u32 arg6, u32 arg7, u32 arg8, s32* bgId) {
    return func_8003D7F0(colCtx, 0, 1, arg1, arg2, arg3, outPoly, bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003DE84(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, u32 arg5,
                  u32 arg6, u32 arg7, u32 arg8, s32* bgId) {
    return func_8003D7F0(colCtx, 2, 0, arg1, arg2, arg3, outPoly, bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003DF10(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5,
                  s32 arg6, s32 arg7, s32 arg8, s32* bgId, Actor* actor) {
    return func_8003D7F0(colCtx, 2, 0, arg1, arg2, arg3, outPoly, bgId, actor, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003DFA0(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5,
                  s32 arg6, s32 arg7, s32 arg8, s32* bgId, Actor* actor, f32 argB) {
    return func_8003D7F0(colCtx, 2, 0, arg1, arg2, arg3, outPoly, bgId, actor, argB,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003E02C(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5,
                  s32 arg6, s32 arg7, s32 arg8, s32* bgId) {
    return func_8003D7F0(colCtx, 4, 0, arg1, arg2, arg3, outPoly, bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003E0B8(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5) {
    return func_8003E0FC(colCtx, arg1, arg2, arg3, outPoly, 1, 1, 1, arg5);
}

// arg1 is actor pos (torch slug +24)
// arg2 is ? (torch slug + 264)
s32 func_8003E0FC(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5,
                  s32 arg6, s32 arg7, s32 arg8) {
    s32 bgId;

    return func_8003D7F0(colCtx, 0, 0, arg1, arg2, arg3, outPoly, &bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003E188(CollisionContext* colCtx, Vec3f* arg1, Vec3f* arg2, Vec3f* arg3, CollisionPoly** outPoly, s32 arg5,
                  s32 arg6, s32 arg7, s32 arg8, s32* bgId) {
    return func_8003D7F0(colCtx, 0, 0, arg1, arg2, arg3, outPoly, bgId, NULL, 1.0f,
                         func_8003DD28(arg5, arg6, arg7, arg8, 1));
}

s32 func_8003E214(CollisionContext* colCtx, u16 xpFlags, CollisionPoly** outPoly, s32* outBgId, Vec3f* center,
                  f32 radius, Actor* actor, u16 xpoFlags) {
    Lookup* lookup;

    *outBgId = BGCHECK_SCENE;
    if (func_80038600(center, "../z_bgcheck.c", 5852) == true) {
        if (actor != NULL) {
            osSyncPrintf("こいつ,pself_actor->name %d\n", actor->id);
        }
    }
    lookup = func_8003AD00(colCtx, colCtx->lookupTbl, center);
    if (lookup == NULL) {
        return false;
    } else {
        if (func_8003AB28(lookup, xpFlags, colCtx, center, radius, outPoly, xpoFlags) ||
            func_80041648(colCtx, xpFlags, outPoly, outBgId, center, radius, actor, xpoFlags)) {
            return true;
        }
    }
    return false;
}

s32 func_8003E30C(CollisionContext* colCtx, Vec3f* center, f32 radius) {
    CollisionPoly* poly;
    s32 bgId;

    return func_8003E214(colCtx, 0, &poly, &bgId, center, radius, NULL, 0);
}

s32 func_8003E350(CollisionContext* colCtx, Vec3f* center, f32 radius) {
    CollisionPoly* poly;
    s32 bgId;

    return func_8003E214(colCtx, 0, &poly, &bgId, center, radius, NULL, COLPOLY_IGNORE_FLOOR | COLPOLY_IGNORE_CEILING);
}

// init SSNodeList
void func_8003E398(SSNodeList* this) {
    this->max = 0;
    this->count = 0;
    this->tbl = NULL;
    this->polyCheckTbl = NULL;
}

// Allocate SSNodeList
// tblMax is the number of SSNode records to allocate
// numPolys is the number of polygons defined within the CollisionHeader
void func_8003E3AC(GlobalContext* globalCtx, SSNodeList* this, s32 tblMax, s32 numPolys) {
    this->max = tblMax;
    this->count = 0;
    this->tbl = THA_AllocEndAlign(&globalCtx->state.tha, tblMax * sizeof(SSNode), -2);

    if (!(this->tbl != NULL)) {
        __assert("this->short_slist_node_tbl != NULL", "../z_bgcheck.c", 5975);
    }
    this->polyCheckTbl = GameState_Alloc(&globalCtx->state, numPolys, "../z_bgcheck.c", 5979);
    if (!(this->polyCheckTbl != NULL)) {
        __assert("this->polygon_check != NULL", "../z_bgcheck.c", 5981);
    }
}

// Get next SSNodeList SSNode
SSNode* func_8003E458(SSNodeList* this) {
    SSNode* result = &this->tbl[this->count];
    this->count++;

    if (!(this->count < this->max)) {
        __assert("this->short_slist_node_last_index < this->short_slist_node_size", "../z_bgcheck.c", 5998);
    }
    if (!(this->count < this->max)) {
        return NULL;
    }
    return result;
}

// Get SSNodeList Next
u16 func_8003E4DC(SSNodeList* this) {
    u16 new_index = this->count++;

    if (!(new_index < this->max)) {
        __assert("new_index < this->short_slist_node_size", "../z_bgcheck.c", 6021);
    }
    return new_index;
}

void func_8003E530(ScaleRotPos* srp) {
    srp->scale.x = srp->scale.y = srp->scale.z = 1.0f;
    srp->pos.x = srp->pos.y = srp->pos.z = 0.0f;
    srp->rot.x = srp->rot.y = srp->rot.z = 0;
}

void func_8003E568(ScaleRotPos* srp, Vec3f* scale, Vec3s* rot, Vec3f* pos) {
    srp->scale = *scale;
    srp->rot = *rot;
    srp->pos = *pos;
}

// ScaleRotPos equality test
s32 func_8003E5B4(ScaleRotPos* a, ScaleRotPos* b) {
    if (a->scale.x != b->scale.x || a->scale.y != b->scale.y || a->scale.z != b->scale.z || a->rot.x != b->rot.x ||
        a->rot.y != b->rot.y || a->rot.z != b->rot.z || a->pos.x != b->pos.x || a->pos.y != b->pos.y ||
        a->pos.z != b->pos.z) {
        return false;
    }
    return true;
}

void func_8003E688(DynaLookup* dynaLookup) {
    func_8003871C(&dynaLookup->ceiling);
    func_8003871C(&dynaLookup->wall);
    func_8003871C(&dynaLookup->floor);
}

void func_8003E6C4(DynaLookup* dynaLookup) {
    dynaLookup->polyStartIndex = 0;
    func_8003E688(dynaLookup);
}

// Init vtxStartIndex
void func_8003E6E4(u16* vtxStartIndex) {
    *vtxStartIndex = 0;
}

// Initialize ActorMesh
void func_8003E6EC(GlobalContext* globalCtx, ActorMesh* bgActor) {
    bgActor->actor = NULL;
    bgActor->colHeader = NULL;
    func_8003E530(&bgActor->srp1);
    func_8003E530(&bgActor->srp2);
    func_8003E6C4(&bgActor->dynaLookup);
    func_8003E6E4(&bgActor->vtxStartIndex);
    bgActor->boundingSphere.center.x = bgActor->boundingSphere.center.y = bgActor->boundingSphere.center.z = 0;
    bgActor->boundingSphere.radius = 0;
}

// setActor internal
void func_8003E750(ActorMesh* bgActor, Actor* actor, CollisionHeader* colHeader) {
    bgActor->actor = actor;
    bgActor->colHeader = colHeader;
    bgActor->srp1.scale = actor->scale;
    bgActor->srp1.rot = actor->shape.rot;
    bgActor->srp1.rot.x--;
    bgActor->srp1.pos = actor->posRot.pos;
    bgActor->srp2.scale = actor->scale;
    bgActor->srp2.rot = actor->shape.rot;
    bgActor->srp2.pos = actor->posRot.pos;
}

s32 func_8003E804(ActorMesh* arg0) {
    return func_8003E5B4(&arg0->srp1, &arg0->srp2);
}

// null polyList
void func_8003E82C(CollisionPoly** polyList) {
    *polyList = NULL;
}

// Allocate dyna.polyList
void func_8003E834(GlobalContext* globalCtx, CollisionPoly** polyList, s32 numPolys) {
    *polyList = THA_AllocEndAlign(&globalCtx->state.tha, numPolys * sizeof(CollisionPoly), -2);
    if (!(*polyList != NULL)) {
        __assert("ptbl->pbuf != NULL", "../z_bgcheck.c", 6247);
    }
}

// null vtxList
void func_8003E888(Vec3s** vtxList) {
    *vtxList = NULL;
}

// Allocate dyna.vtxList
void func_8003E890(GlobalContext* globalCtx, Vec3s** vtxList, s32 numVtx) {
    *vtxList = THA_AllocEndAlign(&globalCtx->state.tha, numVtx * sizeof(Vec3s), -2);
    if (!(*vtxList != NULL)) {
        __assert("ptbl->pbuf != NULL", "../z_bgcheck.c", 6277);
    }
}

void func_8003E8EC(GlobalContext* globalCtx, ActorMesh* arg1) {
    arg1->srp1 = arg1->srp2;
}

// Is BgActor/DynaPoly
s32 func_8003E934(s32 bgId) {
    if (bgId < 0 || bgId >= BG_ACTOR_MAX) {
        return false;
    }
    return true;
}

void func_8003E954(GlobalContext* globalCtx, DynaCollisionContext* dyna) {
    dyna->unk_00 = 1;
    func_8003E82C(&dyna->polyList);
    func_8003E888(&dyna->vtxList);
    func_800387FC(globalCtx, &dyna->polyNodes);
}

// Set DynaCollisionContext
void func_8003E9A0(GlobalContext* globalCtx, DynaCollisionContext* dyna) {
    s32 i;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        func_8003E6EC(globalCtx, &dyna->bgActors[i]);
        dyna->flags[i] = 0;
    }
    func_8003E82C(&dyna->polyList);
    func_8003E834(globalCtx, &dyna->polyList, dyna->polyListMax);

    func_8003E888(&dyna->vtxList);
    func_8003E890(globalCtx, &dyna->vtxList, dyna->vtxListMax);

    func_800387FC(globalCtx, &dyna->polyNodes);
    func_8003880C(globalCtx, &dyna->polyNodes, dyna->polyNodesMax);
}

// original name: DynaPolyInfo_setActor
s32 func_8003EA74(GlobalContext* globalCtx, DynaCollisionContext* dyna, Actor* actor, CollisionHeader* colHeader) {
    s32 bgId;
    s32 foundSlot;

    foundSlot = false;
    for (bgId = 0; bgId < BG_ACTOR_MAX; bgId++) {
        if (!(dyna->flags[bgId] & 1)) {
            dyna->flags[bgId] |= 1;
            foundSlot = true;
            break;
        }
    }

    if (foundSlot == false) {
        osSyncPrintf(VT_FGCOL(RED));
        osSyncPrintf("DynaPolyInfo_setActor():ダイナミックポリゴン 空きインデックスはありません\n");
        osSyncPrintf(VT_RST);
        return BG_ACTOR_MAX;
    }

    func_8003E750(&dyna->bgActors[bgId], actor, colHeader);
    dyna->unk_00 |= 1;

    dyna->flags[bgId] &= ~2;
    osSyncPrintf(VT_FGCOL(GREEN));
    osSyncPrintf("DynaPolyInfo_setActor():index %d\n", bgId);
    osSyncPrintf(VT_RST);
    return bgId;
}

// we previously had this named as DynaPolyInfo_GetActor
Actor* func_8003EB84(CollisionContext* colCtx, s32 bgId) {
    if (!func_8003E934(bgId) || !(colCtx->dyna.flags[bgId] & 1) || colCtx->dyna.flags[bgId] & 2) {
        return NULL;
    }
    return colCtx->dyna.bgActors[bgId].actor;
}

void func_8003EBF8(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId) {
    if (func_8003E934(bgId)) {
        dyna->flags[bgId] |= 4;
        dyna->unk_00 |= 1;
    }
}

void func_8003EC50(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId) {
    if (func_8003E934(bgId)) {
        dyna->flags[bgId] &= ~4;
        dyna->unk_00 |= 1;
    }
}

void func_8003ECA8(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId) {
    if (func_8003E934(bgId)) {
        dyna->flags[bgId] |= 8;
        dyna->unk_00 |= 1;
    }
}

void func_8003ED00(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId) {
    if (func_8003E934(bgId)) {
        dyna->flags[bgId] &= ~8;
        dyna->unk_00 |= 1;
    }
}

// original name: DynaPolyInfo_delReserve
void func_8003ED58(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId) {
    DynaPolyActor* actor;

    osSyncPrintf(VT_FGCOL(GREEN));
    osSyncPrintf("DynaPolyInfo_delReserve():index %d\n", bgId);
    osSyncPrintf(VT_RST);
    if (func_8003E934(bgId) == false) {

        if (bgId == -1) {
            osSyncPrintf(VT_FGCOL(GREEN));
            osSyncPrintf(
                "DynaPolyInfo_delReserve():削除されているはずの(?)\nインデックス(== -1)のため,処理を中止します。\n");
            // The index that should have been deleted(? ) was(== -1), processing aborted.
            osSyncPrintf(VT_RST);
            return;
        } else {
            osSyncPrintf(VT_FGCOL(RED));
            osSyncPrintf("DynaPolyInfo_delReserve():"
                         "確保していない／出来なかったインデックスの解放のため、処理を中止します。index == %d\n",
                         bgId);
            // Unable to deallocate index / index unallocated, processing aborted.
            osSyncPrintf(VT_RST);
            return;
        }
    }
    actor = (DynaPolyActor*)func_8003EB84(&globalCtx->colCtx, bgId);
    if (actor != NULL) {

        actor->dynaPolyId = -1;
        dyna->bgActors[bgId].actor = NULL;
        dyna->flags[bgId] |= 2;
    }
}

void func_8003EE6C(GlobalContext* globalCtx, DynaCollisionContext* dyna) {
    dyna->unk_00 |= 1;
}

// original name: DynaPolyInfo_expandSRT
#ifdef NON_MATCHING
void func_8003EE80(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId, s32* vtxStartIndex,
                   s32* polyStartIndex) {
    MtxF mtx;    // sp128
    f32 temp_f0; // f0
    f32 numVtxInverse;
    f32 temp_ret;
    f32 newNormMagnitude;
    CollisionPoly* newPoly; // s0
    Vec3f sp108;
    Sphere16* sphere; // s5
    Vec3s* dvtxList;
    Vec3s* point;         // v0
    Vec3f newCenterPoint; // spF0
    f32 newRadiusSq;      // f2 spEC;
    CollisionHeader* pbgdata;
    Vec3f spDC;
    Vec3f spD0;
    Vec3f spC4;
    Vec3f spB8;
    Vec3f newNorm; // spAC
    s32 pi;        // s0
    s32 i;         // s3
    s16 padding;
    s16 spA0;
    s16 sp9E;
    s16 sp9C;
    Vec3f sp90;
    Vec3f sp84;
    Actor* actor;
    s16 sp76;
    s16 sp74;
    s16 sp72;

    //_6880
    pbgdata = dyna->bgActors[bgId].colHeader;
    actor = dyna->bgActors[bgId].actor;
    dyna->bgActors[bgId].dynaLookup.polyStartIndex = (u16)*polyStartIndex;
    dyna->bgActors[bgId].vtxStartIndex = (u16)*vtxStartIndex;
    sp108 = actor->posRot.pos;
    sp108.y += actor->shape.unk_08 * actor->scale.y;

    //_6934 ab60d4
    func_8003E568(&dyna->bgActors[bgId].srp2, &actor->scale, &actor->shape.rot, &sp108);

    //_6950 ab60f0
    if (dyna->flags[bgId] & 4) {
        return;
    }
    //_6970 ab6110
    if (!(dyna->polyListMax >= *polyStartIndex + pbgdata->nbPolygons)) {
        osSyncPrintf(VT_FGCOL(RED));
        osSyncPrintf("DynaPolyInfo_expandSRT():polygon over %dが%dを越えるとダメ\n",
                     *polyStartIndex + pbgdata->nbPolygons, dyna->polyListMax);
    }
    //_69bc ab615c
    if (!(dyna->vtxListMax >= *vtxStartIndex + pbgdata->nbVertices)) {
        osSyncPrintf(VT_FGCOL(RED));
        osSyncPrintf("DynaPolyInfo_expandSRT():vertex over %dが%dを越えるとダメ\n",
                     *vtxStartIndex + pbgdata->nbVertices, dyna->vtxListMax);
    }
    //_69f0
    (dyna->polyListMax >= *polyStartIndex + pbgdata->nbPolygons)
        ? (void)0
        : __assert("pdyna_poly_info->poly_num >= *pstart_poly_index + pbgdata->poly_num", "../z_bgcheck.c", 6687);
    (dyna->vtxListMax >= *vtxStartIndex + pbgdata->nbVertices)
        ? (void)0
        : __assert("pdyna_poly_info->vert_num >= *pstart_vert_index + pbgdata->vtx_num", "../z_bgcheck.c", 6688);

    // _6a74
    if (!((dyna->unk_00 & 1) || func_8003E804(&dyna->bgActors[bgId]) != true)) {

        for (pi = *polyStartIndex; pi < *polyStartIndex + pbgdata->nbPolygons; pi++) {
            CollisionPoly* poly = &dyna->polyList[pi];

            if (poly->norm.y >= 0x4000) {
                spA0 = pi;
                // _6ADC
                func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.floor, &spA0);
            } else if (poly->norm.y <= -0x6666) {
                if (!(dyna->flags[bgId] & 8)) {
                    sp9E = pi;
                    // _6B20
                    func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.ceiling, &sp9E);
                }
            } else {
                sp9C = pi;
                //_6B44
                func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.wall, &sp9C);
            }
        }
        //_6B6C
        *polyStartIndex += pbgdata->nbPolygons;
        *vtxStartIndex += pbgdata->nbVertices;
        return;
    }
    //_6BCC
    SkinMatrix_SetScaleRotateYRPTranslate(
        &mtx, dyna->bgActors[bgId].srp2.scale.x, dyna->bgActors[bgId].srp2.scale.y, dyna->bgActors[bgId].srp2.scale.z,
        dyna->bgActors[bgId].srp2.rot.x, dyna->bgActors[bgId].srp2.rot.y, dyna->bgActors[bgId].srp2.rot.z,
        dyna->bgActors[bgId].srp2.pos.x, dyna->bgActors[bgId].srp2.pos.y, dyna->bgActors[bgId].srp2.pos.z);

    // ab6374
    numVtxInverse = 1.0f / pbgdata->nbVertices;

    newCenterPoint.x = newCenterPoint.y = newCenterPoint.z = 0.0f;
    for (i = 0; i < pbgdata->nbVertices; i++) {
        //_6c34
        Math_Vec3s_ToVec3f(&sp90, &pbgdata->vtxList[i]);
        //_6c44
        SkinMatrix_Vec3fMtxFMultXYZ(&mtx, &sp90, &sp84);
        func_800388E8(&dyna->vtxList[*vtxStartIndex + i], &sp84);

        if (i == 0) {
            dyna->bgActors[bgId].minY = dyna->bgActors[bgId].maxY = sp84.y;
        } else if (sp84.y < dyna->bgActors[bgId].minY) {
            dyna->bgActors[bgId].minY = sp84.y;
        } else if (dyna->bgActors[bgId].maxY < sp84.y) {
            dyna->bgActors[bgId].maxY = sp84.y;
        }
        newCenterPoint.x += sp84.x;
        newCenterPoint.y += sp84.y;
        newCenterPoint.z += sp84.z;
    }

    sphere = &dyna->bgActors[bgId].boundingSphere;
    newCenterPoint.x *= numVtxInverse;
    newCenterPoint.y *= numVtxInverse;
    newCenterPoint.z *= numVtxInverse;
    sphere->center.x = (s16)newCenterPoint.x;
    sphere->center.y = (s16)newCenterPoint.y;
    sphere->center.z = (s16)newCenterPoint.z;
    newRadiusSq = -100.0f;

    //_6d10
    for (i = 0; i < pbgdata->nbVertices; i++) {

        spDC.x = dyna->vtxList[*vtxStartIndex + i].x;
        spDC.y = dyna->vtxList[*vtxStartIndex + i].y;
        spDC.z = dyna->vtxList[*vtxStartIndex + i].z;
        temp_ret = Math3D_Vec3fDistSq(&spDC, &newCenterPoint);

        if (newRadiusSq < temp_ret) {
            newRadiusSq = temp_ret;
        }
    }

    //_6E68
    sphere->radius = (s16)(sqrtf(newRadiusSq) * 1.1f);

    for (i = 0; i < pbgdata->nbPolygons; i++) {
        newPoly = &dyna->polyList[*polyStartIndex + i];
        *newPoly = pbgdata->polyList[i];

        newPoly->flags_vIA = (newPoly->flags_vIA & 0xE000) | (VTX_INDEX(newPoly->flags_vIA) + *vtxStartIndex);
        newPoly->flags_vIB = (newPoly->flags_vIB & 0xE000) | (VTX_INDEX(newPoly->flags_vIB) + *vtxStartIndex);
        newPoly->vIC = (*vtxStartIndex + newPoly->vIC);
        dvtxList = dyna->vtxList;
        spD0.x = dvtxList[VTX_INDEX(newPoly->flags_vIA)].x;
        spD0.y = dvtxList[VTX_INDEX(newPoly->flags_vIA)].y;
        spD0.z = dvtxList[VTX_INDEX(newPoly->flags_vIA)].z;
        spC4.x = dvtxList[VTX_INDEX(newPoly->flags_vIB)].x;
        spC4.y = dvtxList[VTX_INDEX(newPoly->flags_vIB)].y;
        spC4.z = dvtxList[VTX_INDEX(newPoly->flags_vIB)].z;
        spB8.x = dvtxList[newPoly->vIC].x;
        spB8.y = dvtxList[newPoly->vIC].y;
        spB8.z = dvtxList[newPoly->vIC].z;
        Math3D_SurfaceNorm(&spD0, &spC4, &spB8, &newNorm);
        newNormMagnitude = Math3D_Vec3fMagnitude(&newNorm);

        if (!IS_ZERO(newNormMagnitude)) {
            temp_f0 = 1.0f / newNormMagnitude;
            newNorm.x *= temp_f0;
            newNorm.y *= temp_f0;
            newNorm.z *= temp_f0;
            newPoly->norm.x = (s16)(newNorm.x * 32767.0f);
            newPoly->norm.y = (s16)(newNorm.y * 32767.0f);
            newPoly->norm.z = (s16)(newNorm.z * 32767.0f);
        }

        point = &dyna->vtxList[VTX_INDEX(newPoly->flags_vIA)]; // needs to be dvtxList

        //_7190
        newPoly->dist = (s16) - (newNorm.x * point->x + newNorm.y * point->y + point->z * newNorm.z);
        if (0.5f < newNorm.y) {
            sp76 = *polyStartIndex + i;
            //_7214
            func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.floor, &sp76);
        } else if (newNorm.y < -0.8f) {
            sp74 = *polyStartIndex + i;
            //_7254
            func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.ceiling, &sp74);
        } else {
            sp72 = *polyStartIndex + i;
            //_7274
            func_80038780(&dyna->polyNodes, &dyna->bgActors[bgId].dynaLookup.wall, &sp72);
        }
    }
    *polyStartIndex = *polyStartIndex + pbgdata->nbPolygons;
    *vtxStartIndex = *vtxStartIndex + pbgdata->nbVertices;
}
#else
void func_8003EE80(GlobalContext* globalCtx, DynaCollisionContext* dyna, s32 bgId, s32* vtxStartIndex,
                   s32* polyStartIndex);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8003EE80.s")
#endif

void func_8003F8EC(GlobalContext* globalCtx, DynaCollisionContext* dyna, Actor* actor) {
    Actor* dynaActor;
    s32 i;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if ((dyna->flags[i] & 1) != 0) {
            dynaActor = func_8003EB84(&globalCtx->colCtx, i);
            if (dynaActor != NULL && dynaActor == actor) {
                func_800434A0(actor);
                return;
            }
        }
    }
}

// DynaPolyInfo_setup
void func_8003F984(GlobalContext* globalCtx, DynaCollisionContext* dyna) {
    DynaPolyActor* actor;
    s32 sp60;
    s32 sp5C;
    s32 i;

    func_80038870(&dyna->polyNodes);

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        func_8003E688(&dyna->bgActors[i].dynaLookup);
    }

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (dyna->flags[i] & 2) {

            osSyncPrintf(VT_FGCOL(GREEN));
            osSyncPrintf("DynaPolyInfo_setup():削除 index=%d\n", i);
            osSyncPrintf(VT_RST);

            dyna->flags[i] = 0;
            func_8003E6EC(globalCtx, &dyna->bgActors[i]);
            dyna->unk_00 |= 1;
        }
        if (dyna->bgActors[i].actor != NULL && dyna->bgActors[i].actor->update == NULL) {
            osSyncPrintf(VT_FGCOL(GREEN));
            osSyncPrintf("DynaPolyInfo_setup():削除 index=%d\n", i);
            osSyncPrintf(VT_RST);
            actor = (DynaPolyActor*)func_8003EB84(&globalCtx->colCtx, i);
            if (actor == NULL) {
                return;
            }
            actor->dynaPolyId = -1;
            dyna->flags[i] = 0;

            func_8003E6EC(globalCtx, &dyna->bgActors[i]);
            dyna->unk_00 |= 1;
        }
    }
    sp60 = 0;
    sp5C = 0;
    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (dyna->flags[i] & 1) {
            func_8003EE80(globalCtx, dyna, i, &sp60, &sp5C);
        }
    }
    dyna->unk_00 &= ~1;
}

void func_8003FB64(GlobalContext* globalCtx, DynaCollisionContext* dyna) {
    s32 i;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (dyna->flags[i] & 1) {
            func_8003E8EC(globalCtx, &dyna->bgActors[i]);
        }
    }
}

f32 func_8003FBF4(s8003FBF4* arg0, s32 arg1) {
    CollisionPoly* polyList;
    SSNode* curNode;
    f32 result;
    f32 sp70;
    s16 id;
    u16 next;

    result = arg0->yIntersect;
    next = *arg0->unk_2C;
    if (SS_NULL == next) {
        return result;
    }
    polyList = arg0->dyna->polyList;
    curNode = &arg0->dyna->polyNodes.tbl[next];

    while (true) {
        id = curNode->polyId;
        if (VIA_FLAG_TEST(polyList[id].flags_vIA, arg0->xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &arg0->dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if ((arg1 & 6) && (arg0->unk_20 & 0x10) && COLPOLY_GET_NORM(polyList[id].norm.y) < 0.0f) {

            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &arg0->dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if (func_80038D48(&polyList[id], arg0->dyna->vtxList, arg0->pos->x, arg0->pos->z, &sp70, arg0->chkDist) ==
                true &&
            sp70 < arg0->pos->y && result < sp70) {

            result = sp70;
            *arg0->resultPoly = arg0->dyna->polyList + id;
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &arg0->dyna->polyNodes.tbl[curNode->next];
            continue;
        }
    }
    return result;
}

#ifdef NON_MATCHING
// codegen. First for loop is mostly matching, save regalloc and an issue with colCtx ref. type access issues at ab71f4
f32 func_8003FDDC(s8003FBF4* arg0) {

    CollisionPoly* temp_s3;
    DynaPolyActor* v0_test;
    ScaleRotPos* temp_v0_2;
    s32 phi_s2;
    f32 phi_f20;
    CollisionPoly* polyMin;
    s32 i_27;
    Vec3f spE0[3];
    Vec3f spD4;
    Vec3f* phi_s1;
    f32 a7;
    MtxF sp8C; // to spCC
    f32 temp_f0;
    Vec3s* sp84; // vtxList
    f32 temp_f12;
    Vec3f sp74;
    f32 sp70;
    u16 dynaLookupStart;

    phi_f20 = BGCHECK_Y_MIN;
    *arg0->bgId = BGCHECK_SCENE;

    for (phi_s2 = 0; phi_s2 < BG_ACTOR_MAX; phi_s2++) {
        if ((arg0->colCtx->dyna.flags[phi_s2] & 1) != 0) {

            if (arg0->actor == arg0->colCtx->dyna.bgActors[phi_s2].actor ||
                arg0->pos->y < arg0->colCtx->dyna.bgActors[phi_s2].minY ||
                Math3D_XZInSphere(&arg0->colCtx->dyna.bgActors[phi_s2].boundingSphere, arg0->pos->x, arg0->pos->z) ==
                    0) {
                continue;
            }

            arg0->dyna = &arg0->colCtx->dyna;
            if ((arg0->unk_20 & 4) != 0) {

                arg0->unk_2C = &arg0->colCtx->dyna.bgActors[phi_s2].dynaLookup.floor;
                temp_f0 = func_8003FBF4(arg0, 1);

                if (arg0->yIntersect < temp_f0) {

                    arg0->yIntersect = temp_f0;
                    *arg0->bgId = phi_s2;
                    phi_f20 = temp_f0;
                }
            }
            if ((arg0->unk_20 & 2) != 0 || (*arg0->resultPoly == NULL && (arg0->unk_20 & 8) != 0)) {

                arg0->unk_2C = &arg0->colCtx->dyna.bgActors[phi_s2].dynaLookup.wall;
                temp_f0 = func_8003FBF4(arg0, 2);
                if (arg0->yIntersect < temp_f0) {

                    arg0->yIntersect = temp_f0;
                    *arg0->bgId = phi_s2;
                    phi_f20 = temp_f0;
                }
            }

            if ((arg0->unk_20 & 1) != 0) {

                arg0->unk_2C = &arg0->colCtx->dyna.bgActors[phi_s2].dynaLookup.ceiling;
                temp_f0 = func_8003FBF4(arg0, 4);
                if (arg0->yIntersect < temp_f0) {

                    arg0->yIntersect = temp_f0;
                    *arg0->bgId = phi_s2;
                    phi_f20 = temp_f0;
                }
            }
        }
    }
    // 7154 loop_1 end;

    v0_test = (DynaPolyActor*)func_8003EB84(arg0->colCtx, *arg0->bgId);
    if (!(phi_f20 == BGCHECK_Y_MIN)) {
        if (v0_test != NULL) {
            if (arg0->globalCtx != NULL) {
                s32 v0_pause = arg0->globalCtx->pauseCtx.state != 0;
                if (v0_pause == 0) {
                    v0_pause = arg0->globalCtx->pauseCtx.flag != 0;
                }
                // block_24:
                if (!v0_pause) {
                    // 71b8

                    if (arg0->colCtx->dyna.flags[*arg0->bgId] & 2) {
                        // ab71f4
                        ActorMesh* bgActor = &arg0->dyna->bgActors[*arg0->bgId];
                        dynaLookupStart = bgActor->dynaLookup.polyStartIndex;
                        temp_v0_2 = &bgActor->srp2;
                        polyMin = dynaLookupStart + arg0->dyna->polyList;
                        temp_s3 = *arg0->resultPoly - polyMin + bgActor->colHeader->polyList;
                        SkinMatrix_SetScaleRotateYRPTranslate(
                            &sp8C, temp_v0_2->scale.x, temp_v0_2->scale.y, temp_v0_2->scale.z, temp_v0_2->rot.x,
                            temp_v0_2->rot.y, temp_v0_2->rot.z, temp_v0_2->pos.x, temp_v0_2->pos.y, temp_v0_2->pos.z);
                        sp84 = arg0->dyna->bgActors[*arg0->bgId].colHeader->vtxList;

                        for (i_27 = 0; i_27 < 3; i_27++) { //~ 72a8
                            // loop_27:
                            Math_Vec3s_ToVec3f(&sp74, (temp_s3->vtxData[i_27] & 0x1FFF) + sp84);
                            SkinMatrix_Vec3fMtxFMultXYZ(&sp8C, &sp74, &spE0[i_27]);
                        }
                        Math3D_SurfaceNorm(&spE0[0], &spE0[1], &spE0[2], &spD4);
                        temp_f12 = Math3D_Vec3fMagnitude(&spD4);
                        // ab7330
                        if (!IS_ZERO(temp_f12)) {
                            // ab7378
                            spD4.x *= 1.0f / temp_f12;
                            spD4.y *= 1.0f / temp_f12;
                            spD4.z *= 1.0f / temp_f12;
                            a7 = -(spD4.x * spE0[0].x + spD4.y * spE0[0].y + spD4.z * spE0[0].z);
                            if (Math3D_TriChkPointParaYIntersectInsideTri(&spE0[0], &spE0[1], &spE0[2], spD4.x, spD4.y,
                                                                          spD4.z, a7, arg0->pos->z, arg0->pos->x, &sp70,
                                                                          arg0->chkDist) != 0) {

                                if (fabsf(sp70 - phi_f20) < 1.0f) {

                                    phi_f20 = sp70;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return phi_f20;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8003FDDC.s")
#endif

#ifdef NON_MATCHING
// Performs collision detection on a ActorMesh's wall polys on sphere `pos`, `radius`
// returns true if a collision was detected
// `outX` `outZ` return the displaced x,z coordinates
// `outPoly` returns the pointer to the nearest poly collided with, or NULL
// `outBgId` returns `bgId` if the poly SurfaceType's wall damage flag is not set, else ?
//
// regalloc
s32 func_80040284(CollisionContext* colCtx, u16 xpFlags, DynaCollisionContext* dyna, u16* nodeId, f32* outX, f32* outZ,
                  CollisionPoly** outPoly, s32* outBgId, Vec3f* pos, f32 radius, s32 bgId) {
    s32 padding;
    f32 intersect;      // spD0
    s32 result = false; // spCC
    CollisionPoly* poly;
    SSNode* curNode; // curNode s1
    f32 nx;          //  spC0
    f32 ny;          // spBC
    f32 nz;          // spB8
    Vec3f resultPos; // spAC;
    s16 polyId;
    f32 zTemp;     // f0
    f32 xTemp;     // f0
    f32 ac_size;   // f20
    f32 temp_f16;  // sp70
    f32 planeDist; // f24
    f32 temp_f18;  // sp90
    f32 temp_f2;   // spD0 - spAC.z
    f32 temp_f2_2; // spD0 - spAC.z
    f32 zMin;      // f2
    f32 zMax;      // f12
    f32 xMin;      // f2
    f32 xMax;      // f12

    if (SS_NULL == *nodeId) {
        return result;
    }
    resultPos = *pos;
    curNode = &dyna->polyNodes.tbl[*nodeId];

    while (true) {
        polyId = curNode->polyId;
        poly = &dyna->polyList[polyId];
        func_800389D4(poly, &nx, &ny, &nz);
        ac_size = sqrtf(SQ(nx) + SQ(nz));
        (!IS_ZERO(ac_size)) ? (void)0 : __assert("!IS_ZERO(ac_size)", "../z_bgcheck.c", 7382);

        planeDist = Math3D_DistPlaneToPos(nx, ny, nz, poly->dist, &resultPos);
        if (radius < fabsf(planeDist) || VIA_FLAG_TEST(poly->flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        temp_f16 = 1.0f / ac_size;
        temp_f18 = fabsf(nz) * temp_f16;
        if (temp_f18 < 0.4f) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        // ab75e8

        // compute poly zMin/zMax
        zMax = zMin = dyna->vtxList[VTX_INDEX(poly->flags_vIA)].z; // 7610
        zTemp = dyna->vtxList[VTX_INDEX(poly->flags_vIB)].z;

        if (zTemp < zMin) { // 7630
            zMin = zTemp;
        } else if (zMax < zTemp) {
            zMax = zTemp;
        }
        zTemp = dyna->vtxList[poly->vIC].z;
        if (zTemp < zMin) {
            zMin = zTemp;
        } else if (zMax < zTemp) { // 76A0
            zMax = zTemp;
        }

        zMin -= radius;
        zMax += radius;
        if (resultPos.z < zMin || zMax < resultPos.z) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if (func_80039000(poly, dyna->vtxList, resultPos.x, pos->y, &intersect)) {
            temp_f2 = intersect - resultPos.z;
            if (fabsf(temp_f2) <= radius / temp_f18) {
                if (temp_f2 * nz <= 4.0f) {
                    // ab779c
                    if (func_80039A3C(colCtx, poly, &resultPos.x, &resultPos.z, nx, ny, nz, temp_f16, planeDist, radius,
                                      outPoly)) {
                        *outBgId = bgId;
                    }
                    result = true;
                }
            }
        }
        // ab77b4
        if (SS_NULL == curNode->next) {
            break;
        }
        curNode = &dyna->polyNodes.tbl[curNode->next];
    }

    // ab77d0
    curNode = &dyna->polyNodes.tbl[*nodeId];
    while (true) {
        poly = &dyna->polyList[curNode->polyId];
        func_800389D4(poly, &nx, &ny, &nz);
        ac_size = sqrtf(SQ(nx) + SQ(nz));
        (!IS_ZERO(ac_size)) ? (void)0 : __assert("!IS_ZERO(ac_size)", "../z_bgcheck.c", 7489);

        planeDist = Math3D_DistPlaneToPos(nx, ny, nz, poly->dist, &resultPos);
        if (radius < fabsf(planeDist) || VIA_FLAG_TEST(poly->flags_vIA, xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        temp_f16 = 1.0f / ac_size;
        temp_f18 = fabsf(nx) * temp_f16;
        if (temp_f18 < 0.4f) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }

        // compute poly xMin/xMax
        xMin = xMax = dyna->vtxList[VTX_INDEX(poly->flags_vIA)].x;
        xTemp = dyna->vtxList[VTX_INDEX(poly->flags_vIB)].x;

        if (xTemp < xMin) {
            xMin = xTemp;
        } else if (xMax < xTemp) {
            xMax = xTemp;
        }
        xTemp = dyna->vtxList[poly->vIC].x;
        if (xTemp < xMin) {
            xMin = xTemp;
        } else if (xMax < xTemp) {
            xMax = xTemp;
        }

        xMin -= radius;
        xMax += radius;
        if (resultPos.x < xMin || xMax < resultPos.x) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        // 7a2c
        if (func_80038F60(poly, dyna->vtxList, pos->y, resultPos.z, &intersect)) {
            temp_f2_2 = intersect - resultPos.x;
            if (fabsf(temp_f2_2) <= radius / temp_f18) {
                if (temp_f2_2 * nx <= 4.0f) {
                    // ab7ac8
                    if (func_80039A3C(colCtx, poly, &resultPos.x, &resultPos.z, nx, ny, nz, temp_f16, planeDist, radius,
                                      outPoly)) {
                        *outBgId = bgId;
                    }
                    result = true;
                }
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &dyna->polyNodes.tbl[curNode->next];
            continue;
        }
    }
    *outX = resultPos.x;
    *outZ = resultPos.z;
    return result;
}
#else
s32 func_80040284(CollisionContext* colCtx, u16 xpFlags, DynaCollisionContext* dyna, u16* nodeId, f32* outX, f32* outZ,
                  CollisionPoly** outPoly, s32* outBgId, Vec3f* pos, f32 radius, s32 bgId);
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_80040284.s")
#endif

#ifdef NOT_MATCHING
// Performs collision detection on all dyna poly walls using sphere `pos`, `radius`
// returns true if a collision was detected
// `outX` `outZ` return the displaced x,z coordinates
// `outPoly` returns the pointer to the nearest poly collided with, or NULL
// `outBgId` returns the index of the ActorMesh that owns `outPoly`
// If `actor` is not NULL, an ActorMesh bound to that actor will be ignored
//
// Codegen Issues
s32 func_800409A8(CollisionContext* colCtx, u16 xpFlags, f32* outX, f32* outZ, Vec3f* pos, f32 radius,
                  CollisionPoly** outPoly, s32* outBgId, Actor* actor) {
    Vec3f resultPos; // sp94
    s32 result;      // sp90;
    f32 r;           // f0
    f32 dz;          // f12
    f32 dx;          // f2
    // s16 temp_s2;
    ActorMesh* bgActor; // s0
    // Sphere16* temp_s1;
    s32 i; // s4
    ActorMesh* list;

    result = false;
    resultPos = *pos;
    list = colCtx->dyna.bgActors;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (colCtx->dyna.flags[i] & 1) {

            if (actor != list[i].actor) {
                bgActor = &colCtx->dyna.bgActors[i];

                if (resultPos.y < colCtx->dyna.bgActors[i].minY || bgActor->maxY < resultPos.y) {
                    continue;
                }

                bgActor->boundingSphere.radius += (s16)radius;

                r = bgActor->boundingSphere.radius;
                dx = bgActor->boundingSphere.center.x - resultPos.x;
                dz = bgActor->boundingSphere.center.z - resultPos.z;
                if (SQ(r) < (SQ(dx) + SQ(dz)) ||
                    (!Math3D_XYInSphere(&bgActor->boundingSphere, resultPos.x, resultPos.y) &&
                     !Math3D_YZInSphere(&bgActor->boundingSphere, resultPos.y, resultPos.z))) {
                    bgActor->boundingSphere.radius -= (s16)radius;
                } else {
                    bgActor->boundingSphere.radius -= (s16)radius;
                    if (func_80040284(colCtx, xpFlags, &colCtx->dyna, &colCtx->dyna.bgActors[i].dynaLookup.wall, outX,
                                      outZ, outPoly, outBgId, &resultPos, radius, i)) {
                        resultPos.x = *outX;
                        resultPos.z = *outZ;
                        result = true;
                    }
                }
            }
        }
    }
    return result;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_800409A8.s")
#endif

s32 func_80040BE4(CollisionContext* colCtx, u16 arg1, DynaCollisionContext* dyna, u16* nodeId, f32* outY, Vec3f* arg5,
                  f32 arg6, CollisionPoly** outPoly) {
    s16 polyId;
    SSNode* curNode;
    CollisionPoly* poly;
    Vec3f sp98;
    f32 sp94;
    f32 phi_f0;
    f32 nx;
    f32 ny;
    f32 nz;
    s32 result;
    f32 temp_f0;
    u16 next;

    result = false;
    next = *nodeId;
    if (SS_NULL == next) {
        return false;
    }
    curNode = &dyna->polyNodes.tbl[next];
    sp98 = *arg5;

    while (true) {
        polyId = curNode->polyId;
        poly = &dyna->polyList[polyId];
        if (VIA_FLAG_TEST(poly->flags_vIA, arg1)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        func_800389D4(poly, &nx, &ny, &nz);
        if (arg6 < Math3D_UDistPlaneToPos(nx, ny, nz, poly->dist, &sp98)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = &dyna->polyNodes.tbl[curNode->next];
                continue;
            }
        }
        if (func_80038F20(poly, dyna->vtxList, sp98.x, sp98.z, &sp94)) {
            temp_f0 = sp94 - sp98.y;
            if (sp98.y < sp94 && temp_f0 < arg6 && temp_f0 * ny <= 0.0f) {
                phi_f0 = (0.0f <= ny) ? 1.0f : -1.0f;

                sp98.y = (phi_f0 * arg6) + sp94;
                result = true;
                *outPoly = poly;
            }
        }
        if (SS_NULL == curNode->next) {
            break;
        } else {
            curNode = &dyna->polyNodes.tbl[curNode->next];
            continue;
        }
    }
    *outY = sp98.y;
    return result;
}

#ifdef NON_MATCHING
// minor codegen issues
s32 func_80040E40(CollisionContext* colCtx, u16 arg1, f32* arg2, Vec3f* arg3, f32 arg4, CollisionPoly** outPoly,
                  s32* outBgId, Actor* actor) {

    s32 i; // s1
    s32 sp78 = false;
    f32 phi_f20;
    f32 sp70;
    ActorMesh* bgActor;
    CollisionPoly* sp68;

    phi_f20 = sp70 = arg3->y + arg4;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (!(colCtx->dyna.flags[i] & 1)) {
            continue;
        }
        if (actor != colCtx->dyna.bgActors[i].actor &&
            Math3D_XZInSphere(&colCtx->dyna.bgActors[i].boundingSphere, arg3->x, arg3->z) &&
            func_80040BE4(colCtx, arg1, &colCtx->dyna, &colCtx->dyna.bgActors[i].dynaLookup.ceiling, &sp70, arg3, arg4,
                          &sp68) == true &&
            sp70 < phi_f20) {

            phi_f20 = sp70;
            *outPoly = sp68;
            *outBgId = i;
            sp78 = true;
        }
    }
    *arg2 = phi_f20;
    return sp78;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_80040E40.s")
#endif

s32 func_80040FA4(s80041128* arg0) {
    f32 distSq;
    u16 nodeId;
    CollisionPoly* curPoly;
    SSNode* curNode;
    Vec3f polyIntersect;
    s16 polyId;
    s32 result;

    nodeId = *arg0->dynaLookupId;
    if (SS_NULL == nodeId) {
        return false;
    }

    curNode = arg0->dyna->polyNodes.tbl + nodeId;
    result = false;

    while (true) {
        polyId = curNode->polyId;
        curPoly = arg0->dyna->polyList + polyId;
        if (VIA_FLAG_TEST(curPoly->flags_vIA, arg0->xpFlags)) {
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = arg0->dyna->polyNodes.tbl + curNode->next;
            }
        } else {
            if (func_800390A0(curPoly, arg0->dyna->vtxList, arg0->pointA, arg0->pointB, &polyIntersect, arg0->unk20,
                              arg0->chkDist)) {
                distSq = Math3D_Vec3fDistSq(arg0->pointA, &polyIntersect);
                if (distSq < *arg0->distSq) {
                    *arg0->distSq = distSq;
                    *arg0->unk18 = polyIntersect;
                    *arg0->pointB = polyIntersect;
                    *arg0->resultPoly = curPoly;
                    result = true;
                }
            }
            if (SS_NULL == curNode->next) {
                break;
            } else {
                curNode = arg0->dyna->polyNodes.tbl + curNode->next;
            }
        }
    }
    return result;
}

s32 func_80041128(CollisionContext* colCtx, u16 xpFlags, Vec3f* pointA, Vec3f* pointB, Vec3f* arg4,
                  CollisionPoly** outPoly, f32* distSq, s32 bgId, f32 chkDist, s32 arg9) {
    s32 result = false;
    s80041128 sp20;

    sp20.colCtx = colCtx;
    sp20.xpFlags = xpFlags;
    sp20.dyna = &colCtx->dyna;
    sp20.pointA = pointA;
    sp20.pointB = pointB;
    sp20.unk18 = arg4;
    sp20.resultPoly = outPoly;
    sp20.unk20 = (arg9 & 8) != 0;
    sp20.distSq = distSq;
    sp20.chkDist = chkDist;

    sp20.dynaLookupId = &colCtx->dyna.bgActors[bgId].dynaLookup.wall;
    if (arg9 & 1) {
        if (func_80040FA4(&sp20)) {
            result = true;
        }
    }
    sp20.dynaLookupId = &colCtx->dyna.bgActors[bgId].dynaLookup.floor;
    if (arg9 & 2) {
        if (func_80040FA4(&sp20)) {
            result = true;
        }
    }
    sp20.dynaLookupId = &colCtx->dyna.bgActors[bgId].dynaLookup.ceiling;
    if (arg9 & 4) {
        if (func_80040FA4(&sp20)) {
            result = true;
        }
    }
    return result;
}

s32 func_80041240(CollisionContext* colCtx, u16 xpFlags, Vec3f* pointA, Vec3f* pointB, Vec3f* arg4,
                  CollisionPoly** outPoly, f32* distSq, s32* outBgId, Actor* actor, f32 arg9, s32 argA) {
    s32 temp_s0;
    s32 i;
    s32 result = false;
    Linef line;
    f32 ay, by;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (colCtx->dyna.flags[i] & 1) {
            if (actor != colCtx->dyna.bgActors[i].actor) {
                ay = pointA->y;
                by = pointB->y;
                if (!(ay < colCtx->dyna.bgActors[i].minY) || !(by < colCtx->dyna.bgActors[i].minY)) {
                    if (!(colCtx->dyna.bgActors[i].maxY < ay) || !(colCtx->dyna.bgActors[i].maxY < by)) {
                        line.a = *pointA;
                        line.b = *pointB;
                        if (Math3D_LineVsSph(&colCtx->dyna.bgActors[i].boundingSphere, &line) != 0) {
                            if (func_80041128(colCtx, xpFlags, pointA, pointB, arg4, outPoly, distSq, i, arg9, argA) ==
                                1) {
                                *outBgId = i;
                                result = true;
                            }
                        }
                    }
                }
            }
        }
    }
    return result;
}

s32 func_800413F8(CollisionContext* colCtx, u16 arg1, CollisionPoly** outPoly, Vec3f* center, f32 radius,
                  u16* ssNodeId) {
    u16 nextId;
    CollisionPoly* curPoly;
    DynaCollisionContext* dyna;
    SSNode* node;

    nextId = *ssNodeId;
    if (SS_NULL == nextId) {
        return false;
    }
    dyna = &colCtx->dyna;
    node = &dyna->polyNodes.tbl[nextId];
    while (true) {
        s32 polyId = node->polyId;
        curPoly = &dyna->polyList[polyId];
        if (VIA_FLAG_TEST(curPoly->flags_vIA, arg1)) {
            if (SS_NULL == node->next) {
                break;
            } else {
                node = &dyna->polyNodes.tbl[node->next];
                continue;
            }
        }
        if (func_8003937C(curPoly, dyna->vtxList, center, radius) != 0) {
            *outPoly = curPoly;
            return true;
        }
        if (SS_NULL == node->next) {
            break;
        } else {
            node = &dyna->polyNodes.tbl[node->next];
            continue;
        }
    }
    return false;
}

// arg1 is poly exclusion flags
// arg6 is poly orientation exclusion flags
s32 func_80041510(CollisionContext* colCtx, u16 xpFlags, CollisionPoly** outPoly, Vec3f* center, f32 radius, s32 bgId,
                  u16 xpoFlags) {
    if ((xpoFlags & COLPOLY_IGNORE_CEILING) == 0) {
        if (func_800413F8(colCtx, xpFlags, outPoly, center, radius, &colCtx->dyna.bgActors[bgId].dynaLookup.ceiling)) {
            return true;
        }
    }
    if ((xpoFlags & COLPOLY_IGNORE_WALL) == 0) {
        if (func_800413F8(colCtx, xpFlags, outPoly, center, radius, &colCtx->dyna.bgActors[bgId].dynaLookup.wall)) {
            return true;
        }
    }
    if ((xpoFlags & COLPOLY_IGNORE_FLOOR) == 0) {
        if (func_800413F8(colCtx, xpFlags, outPoly, center, radius, &colCtx->dyna.bgActors[bgId].dynaLookup.floor)) {
            return true;
        }
    }
    return false;
}

#ifdef NON_MATCHING
// loop codegen issues
s32 func_80041648(CollisionContext* colCtx, u16 xpFlags, CollisionPoly** outPoly, s32* outBgId, Vec3f* center,
                  f32 radius, Actor* actor, u16 xpoFlags) {
    s32 i;
    Sphere16 sp64;

    for (i = 0; i < BG_ACTOR_MAX; i++) {
        if (colCtx->dyna.flags[i] & 1) {
            if (colCtx->dyna.bgActors[i].actor) {
                sp64.center.x = (s16)center->x;
                sp64.center.y = (s16)center->y;
                sp64.center.z = (s16)center->z;
                sp64.radius = (s16)radius;
                if (Math3D_SphVsSph(&sp64, &colCtx->dyna.bgActors[i].boundingSphere)) {
                    if (func_80041510(colCtx, xpFlags, outPoly, center, radius, i, xpoFlags) != 0) {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_80041648.s")
#endif

void func_800417A0(CollisionHeader* colHeader) {
    colHeader->vtxList = SEGMENTED_TO_VIRTUAL(colHeader->vtxList);
    colHeader->polyList = SEGMENTED_TO_VIRTUAL(colHeader->polyList);
    colHeader->polygonTypes = SEGMENTED_TO_VIRTUAL(colHeader->polygonTypes);
    colHeader->cameraData = SEGMENTED_TO_VIRTUAL(colHeader->cameraData);
    colHeader->waterBoxes = SEGMENTED_TO_VIRTUAL(colHeader->waterBoxes);
}

// Convert CollisionHeader Segmented to Virtual addressing
void func_80041880(void* colHeader, CollisionHeader** dest) {
    *dest = SEGMENTED_TO_VIRTUAL(colHeader);
    func_800417A0(*dest);
}

void func_800418D0(CollisionContext* colCtx, GlobalContext* globalCtx) {
    DynaCollisionContext* dynaColCtx;
    s32 i;
    u16 flag;

    dynaColCtx = &colCtx->dyna;
    for (i = 0; i < BG_ACTOR_MAX; i++) {
        flag = dynaColCtx->flags[i];
        if ((flag & 1) && !(flag & 2)) {
            Actor_SetObjectDependency(globalCtx, dynaColCtx->bgActors[i].actor);
            func_800417A0(dynaColCtx->bgActors[i].colHeader);
        }
    }
}

// Reset SSNodeList polyCheckTbl
void func_80041978(SSNodeList* nodeList, s32 numPolys) {
    u8* t;

    for (t = nodeList->polyCheckTbl; t < nodeList->polyCheckTbl + numPolys; t++) {
        *t = 0;
    }
}

// Get SurfaceType property set
u32 func_800419B0(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId, s32 surfacePropId) {
    CollisionHeader* colHeader;
    SurfaceType* surfaceTypes;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL || poly == NULL) {
        return 0;
    }
    surfaceTypes = colHeader->polygonTypes;
    if ((u32)surfaceTypes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return surfaceTypes[poly->type].data[surfacePropId];
}

// SurfaceType, return CamData Index
u32 func_80041A28(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {

    return func_800419B0(colCtx, poly, bgId, 0) & 0xFF;
}

u16 func_80041A4C(CollisionContext* colCtx, u32 camId, s32 bgId) {
    u16 result;
    CollisionHeader* colHeader;
    CamData* camData;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }
    camData = colHeader->cameraData;
    result = camData[camId].cameraSType;
    return result;
}

u16 func_80041A94(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    CollisionHeader* colHeader;
    CamData* camData;
    SurfaceType* surfaceTypes;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }
    camData = colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    surfaceTypes = colHeader->polygonTypes;
    if ((u32)surfaceTypes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return func_80041A4C(colCtx, func_80041A28(colCtx, poly, bgId), bgId);
}

u16 func_80041B24(CollisionContext* colCtx, u32 camId, s32 bgId) {
    CollisionHeader* colHeader;
    CamData* camData;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }

    camData = colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return camData[camId].numCameras;
}

u16 func_80041B80(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    CollisionHeader* colHeader;
    CamData* camData;
    SurfaceType* surfaceTypes;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }
    camData = colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    surfaceTypes = colHeader->polygonTypes;
    if ((u32)surfaceTypes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return func_80041B24(colCtx, func_80041A28(colCtx, poly, bgId), bgId);
}

CamPosData* func_80041C10(CollisionContext* colCtx, s32 camId, s32 bgId) {
    CollisionHeader* colHeader;
    CamData* camData;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }
    camData = colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return (CamPosData*)SEGMENTED_TO_VIRTUAL(camData[camId].camPosDataSeg);
}

CamPosData* func_80041C98(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    CollisionHeader* colHeader;
    CamData* camData;
    SurfaceType* surfaceTypes;

    colHeader = func_8003C4C4(colCtx, bgId);
    if (colHeader == NULL) {
        return 0;
    }
    camData = colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    surfaceTypes = colHeader->polygonTypes;
    if ((u32)surfaceTypes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }
    return func_80041C10(colCtx, func_80041A28(colCtx, poly, bgId), bgId);
}

u32 func_80041D28(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 8 & 0x1F;
}

u32 func_80041D4C(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 13 & 0x1F;
}

u32 func_80041D70(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 18 & 7;
}

// SurfaceType Get Wall Property (Internal)
u32 func_80041D94(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 21 & 0x1F;
}

// SurfaceType Get Wall Flags
s32 func_80041DB8(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return D_80119D90[func_80041D94(colCtx, poly, bgId)];
}

// SurfaceType Is Wall Flag (1 << 0) Set
s32 func_80041DE4(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return (func_80041DB8(colCtx, poly, bgId) & 1) ? true : false;
}

// SurfaceType Is Wall Flag (1 << 1) Set
s32 func_80041E18(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return (func_80041DB8(colCtx, poly, bgId) & 2) ? true : false;
}

// SurfaceType Is Wall Flag (1 << 2) Set
s32 func_80041E4C(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return (func_80041DB8(colCtx, poly, bgId) & 4) ? true : false;
}

// unused
u32 func_80041E80(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 26 & 0xF;
}

// SurfaceType Get Floor Property
u32 func_80041EA4(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 26 & 0xF;
}

// SurfaceType Is Floor Minus 1
u32 func_80041EC8(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 30 & 1;
}

// SurfaceType Is Horse Blocked
u32 func_80041EEC(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 0) >> 31 & 1;
}

u32 func_80041F10(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) & 0xF;
}

// Get Poly Sfx
u16 func_80041F34(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    s32 temp_v0;

    temp_v0 = func_80041F10(colCtx, poly, bgId);
    if (temp_v0 < 0 || temp_v0 > 13) {
        return 0;
    }
    return D_80119E10[temp_v0];
}

u32 func_80041F7C(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 4 & 3;
}

u32 func_80041FA0(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 6 & 0x1F;
}

u32 func_80041FC4(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 11 & 0x3F;
}

u32 func_80041FE8(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 17 & 1;
}

s32 func_8004200C(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    u32 flags;
    if (func_8003C4C4(colCtx, bgId) == NULL) {
        return true;
    }
    flags = poly->flags_vIA & 0x4000;
    return !!flags;
}

s32 func_80042048(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    u32 flags;
    if (func_8003C4C4(colCtx, bgId) == NULL) {
        return true;
    }
    flags = poly->flags_vIA & 0x8000;
    return !!flags;
}

s32 func_80042084(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    u32 flags;
    if (func_8003C4C4(colCtx, bgId) == NULL) {
        return true;
    }
    flags = poly->flags_vIB & 0x2000;
    return !!flags;
}

u32 func_800420C0(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 18 & 7;
}

u32 func_800420E4(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return func_800419B0(colCtx, poly, bgId, 1) >> 21 & 0x3F;
}

u32 func_80042108(CollisionContext* colCtx, CollisionPoly* poly, s32 bgId) {
    return (func_800419B0(colCtx, poly, bgId, 1) & 0x8000000) ? 1 : 0;
}

// Zora's Domain WaterBox in King Zora's Room
WaterBox zdWaterBox = { -348, 877, -1746, 553, 780, 0x2104 };

// WaterBox's effective bounding box
f32 zdWaterBoxMinX = -348.0f;
f32 zdWaterBoxMinY = 777.0f;
f32 zdWaterBoxMinZ = -1746.0f;
f32 zdWaterBoxMaxX = 205.0f;
f32 zdWaterBoxMaxY = 977.0f;
f32 zdWaterBoxMaxZ = -967.0f;

// Tests if xyz position is within the x/z boundaries of a waterbox, returning the ySurface and WaterBox if true
// ySurface doubles as position y input
s32 func_8004213C(GlobalContext* globalCtx, CollisionContext* colCtx, f32 x, f32 z, f32* ySurface,
                  WaterBox** outWaterBox) {
    if (globalCtx->sceneNum == SCENE_SPOT07) {
        if (zdWaterBoxMinX < x && x < zdWaterBoxMaxX && zdWaterBoxMinY < *ySurface && *ySurface < zdWaterBoxMaxY &&
            zdWaterBoxMinZ < z && z < zdWaterBoxMaxZ) {
            *outWaterBox = &zdWaterBox;
            *ySurface = zdWaterBox.ySurface;
            return true;
        }
    }
    return func_80042244(globalCtx, colCtx, x, z, ySurface, outWaterBox);
}

s32 func_80042244(GlobalContext* globalCtx, CollisionContext* colCtx, f32 x, f32 z, f32* ySurface,
                  WaterBox** outWaterBox) {
    CollisionHeader* colHeader;
    u32 room;
    WaterBox* curWaterBox;

    colHeader = colCtx->colHeader;
    if (colHeader->nbWaterBoxes == 0 || (u32)colHeader->waterBoxes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return false;
    }

    for (curWaterBox = colHeader->waterBoxes; curWaterBox < colHeader->waterBoxes + colHeader->nbWaterBoxes;
         curWaterBox++) {
        room = (curWaterBox->properties >> 13) & 0x3F;
        if (room == globalCtx->roomCtx.curRoom.num || room == 0x3F) {
            if ((curWaterBox->properties & 0x80000) == 0) {
                if (curWaterBox->xMin < x && x < curWaterBox->xMin + curWaterBox->xLength) {
                    if (curWaterBox->zMin < z && z < curWaterBox->zMin + curWaterBox->zLength) {
                        *outWaterBox = curWaterBox;
                        *ySurface = curWaterBox->ySurface;
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

#ifdef NON_MATCHING
// regalloc
s32 func_8004239C(GlobalContext* globalCtx, CollisionContext* colCtx, Vec3f* arg2, f32 arg3, WaterBox** outWaterBox) {
    CollisionHeader* colHeader;
    // s32 temp_a0;
    s32 room; // a1

    s32 phi_a0;
    WaterBox* phi_v0;

    colHeader = colCtx->colHeader;
    if (colHeader->nbWaterBoxes == 0 || (u32)colHeader->waterBoxes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        *outWaterBox = NULL;
        return -1;
    }

    for (phi_a0 = 0; phi_a0 < colHeader->nbWaterBoxes; phi_a0++) {
        phi_v0 = colHeader->waterBoxes + phi_a0;

        room = (phi_v0->properties >> 13) & 0x3F;
        if (room == globalCtx->roomCtx.curRoom.num || room == 0x3F) {
            if ((phi_v0->properties & 0x80000) == 0) {
                if (!colHeader->nbWaterBoxes) {}
                if (phi_v0->xMin < arg2->x && arg2->x < phi_v0->xMin + phi_v0->xLength) {
                    if (phi_v0->zMin < arg2->z && arg2->z < phi_v0->zMin + phi_v0->zLength) {
                        if (arg2->y - arg3 < phi_v0->ySurface && phi_v0->ySurface < arg2->y + arg3) {
                            if (phi_v0->xLength) {}
                            *outWaterBox = phi_v0;
                            return phi_a0;
                        }
                    }
                }
            }
        }
    }

    *outWaterBox = NULL;
    return -1;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_bgcheck/func_8004239C.s")
#endif

// WaterBox get CamData index
u32 func_80042538(CollisionContext* colCtx, WaterBox* waterBox) {
    u32 prop = waterBox->properties >> 0;
    return prop & 0xFF;
}

// WaterBox get CamData cameraSType
u16 func_80042548(CollisionContext* colCtx, WaterBox* waterBox) {
    s32 v;
    CamData* camData;

    v = func_80042538(colCtx, waterBox);

    camData = colCtx->colHeader->cameraData;
    if ((u32)camData == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return 0;
    }

    return colCtx->colHeader->cameraData[v].cameraSType;
}

u32 func_8004259C(CollisionContext* colCtx, WaterBox* waterBox) {
    u32 prop = waterBox->properties >> 8;
    return prop & 0x1F;
}

// same as 80042244, but tests if WaterBox properties & 0x80000 != 0
s32 func_800425B0(GlobalContext* globalCtx, CollisionContext* colCtx, f32 x, f32 z, f32* ySurface,
                  WaterBox** outWaterBox) {
    CollisionHeader* colHeader;
    u32 room;
    WaterBox* curWaterBox;

    colHeader = colCtx->colHeader;
    if (colHeader->nbWaterBoxes == 0 || (u32)colHeader->waterBoxes == PHYSICAL_TO_VIRTUAL(gSegments[0])) {
        return false;
    }

    for (curWaterBox = colHeader->waterBoxes; curWaterBox < colHeader->waterBoxes + colHeader->nbWaterBoxes;
         curWaterBox++) {
        room = (curWaterBox->properties >> 0xD) & 0x3F;
        if ((room == globalCtx->roomCtx.curRoom.num) || (room == 0x3F)) {
            if ((curWaterBox->properties & 0x80000) != 0) {
                if (curWaterBox->xMin < x && x < (curWaterBox->xMin + curWaterBox->xLength)) {
                    if (curWaterBox->zMin < z && z < (curWaterBox->zMin + curWaterBox->zLength)) {
                        *outWaterBox = curWaterBox;
                        *ySurface = curWaterBox->ySurface;
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

s32 func_80042708(CollisionPoly* polyA, CollisionPoly* polyB, Vec3f* arg2, Vec3f* arg3) {
    f32 n1X;
    f32 n1Y;
    f32 n1Z;
    f32 n2X;
    f32 n2Y;
    f32 n2Z;

    func_800389D4(polyA, &n1X, &n1Y, &n1Z);
    func_800389D4(polyB, &n2X, &n2Y, &n2Z);
    return Math3D_PlaneVsPlaneVsLineClosestPoint(n1X, n1Y, n1Z, (f32)polyA->dist, n2X, n2Y, n2Z, (f32)polyB->dist, arg2,
                                                 arg3);
}

s32 func_800427B4(CollisionPoly* polyA, CollisionPoly* polyB, Vec3f* arg2, Vec3f* arg3, Vec3f* arg4) {
    f32 n1X;
    f32 n1Y;
    f32 n1Z;
    f32 n2X;
    f32 n2Y;
    f32 n2Z;
    s32 result;

    func_800389D4(polyA, &n1X, &n1Y, &n1Z);
    func_800389D4(polyB, &n2X, &n2Y, &n2Z);
    result = Math3D_PlaneVsLineSegClosestPoint(n1X, n1Y, n1Z, (f32)polyA->dist, n2X, n2Y, n2Z, (f32)polyB->dist, arg2,
                                               arg3, arg4);
    return result;
}

void func_80042868(GlobalContext* globalCtx, CollisionContext* colCtx, DynaCollisionContext* dyna, u16* arg3, u8 r,
                   u8 g, u8 b) {
    u16 nextId;
    CollisionPoly* poly;
    SSNode* curNode;
    Vec3f vA;
    Vec3f vB;
    Vec3f vC;
    f32 nX;
    f32 nY;
    f32 nZ;

    nextId = *arg3;
    if (nextId != SS_NULL) {
        curNode = dyna->polyNodes.tbl + nextId;
        while (true) {
            s16 polyId = curNode->polyId;
            poly = &dyna->polyList[polyId];
            func_800388A8(VTX_INDEX(poly->flags_vIA) + dyna->vtxList, &vA);
            func_800388A8(VTX_INDEX(poly->flags_vIB) + dyna->vtxList, &vB);
            func_800388A8((s32)(poly->vIC) + dyna->vtxList, &vC);
            if (AREG(26)) {
                nX = COLPOLY_GET_NORM(poly->norm.x);
                nY = COLPOLY_GET_NORM(poly->norm.y);
                nZ = COLPOLY_GET_NORM(poly->norm.z);
                vA.x += AREG(26) * nX;
                vA.y += AREG(26) * nY;
                vA.z += AREG(26) * nZ;
                vB.x += AREG(26) * nX;
                vB.y += AREG(26) * nY;
                vB.z += AREG(26) * nZ;
                vC.x += AREG(26) * nX;
                vC.y += AREG(26) * nY;
                vC.z += AREG(26) * nZ;
            }
            func_8005B2AC(globalCtx->state.gfxCtx, &vA, &vB, &vC, r, g, b);
            if (SS_NULL == curNode->next) {
                break;
            }
            curNode = dyna->polyNodes.tbl + curNode->next;
        }
    }
}

void func_80042B2C(GlobalContext* globalCtx, CollisionContext* colCtx, s32 bgId) {
    if (AREG(21)) {
        func_80042868(globalCtx, colCtx, &colCtx->dyna, &colCtx->dyna.bgActors[bgId].dynaLookup.ceiling, 255, 0, 0);
    }
    if (AREG(22)) {
        func_80042868(globalCtx, colCtx, &colCtx->dyna, &colCtx->dyna.bgActors[bgId].dynaLookup.wall, 0, 255, 0);
    }
    if (AREG(23)) {
        func_80042868(globalCtx, colCtx, &colCtx->dyna, &colCtx->dyna.bgActors[bgId].dynaLookup.floor, 0, 0, 255);
    }
}

void func_80042C3C(GlobalContext* globalCtx, CollisionContext* colCtx) {
    s32 bgId;

    do {
        for (bgId = 0; bgId < BG_ACTOR_MAX; bgId++) {

            if (colCtx->dyna.flags[bgId] & 1) {
                func_80042B2C(globalCtx, colCtx, bgId);
            }
        }
    } while (0);
}

void func_80042CB8(GlobalContext* globalCtx, CollisionContext* colCtx, CollisionPoly* poly, u8 r, u8 g, u8 b) {
    Vec3f vA;
    Vec3f vB;
    Vec3f vC;
    f32 nX;
    f32 nY;
    f32 nZ;

    func_800388A8(VTX_INDEX(poly->flags_vIA) + colCtx->colHeader->vtxList, &vA);
    func_800388A8(VTX_INDEX(poly->flags_vIB) + colCtx->colHeader->vtxList, &vB);
    func_800388A8(poly->vIC + colCtx->colHeader->vtxList, &vC);
    if (AREG(26) != 0) {
        nX = COLPOLY_GET_NORM(poly->norm.x);
        nY = COLPOLY_GET_NORM(poly->norm.y);
        nZ = COLPOLY_GET_NORM(poly->norm.z);
        vA.x += AREG(26) * nX;
        vA.y += AREG(26) * nY;
        vA.z += AREG(26) * nZ;
        vB.x += AREG(26) * nX;
        vB.y += AREG(26) * nY;
        vB.z += AREG(26) * nZ;
        vC.x += AREG(26) * nX;
        vC.y += AREG(26) * nY;
        vC.z += AREG(26) * nZ;
    }
    func_8005B2AC(globalCtx->state.gfxCtx, &vA, &vB, &vC, r, g, b);
}

void func_80042EF8(GlobalContext* globalCtx, CollisionContext* colCtx, u16* ssNodeId, u8 r, u8 g, u8 b) {
    SSNode* curNode;
    CollisionPoly* polyList;
    u16 nextId;

    polyList = colCtx->colHeader->polyList;
    nextId = *ssNodeId;
    if (SS_NULL != nextId) {
        curNode = &colCtx->polyNodes.tbl[nextId];
        while (true) {
            s16 polyId = curNode->polyId;
            func_80042CB8(globalCtx, colCtx, &polyList[polyId], r, g, b);
            if (SS_NULL == curNode->next) {
                break;
            }
            curNode = &colCtx->polyNodes.tbl[curNode->next];
        }
    }
}

// Draw scene collision
void func_80042FC4(GlobalContext* globalCtx, CollisionContext* colCtx) {
    Player* player;
    Lookup* lookup;

    player = PLAYER;
    lookup = func_8003AC54(colCtx, colCtx->lookupTbl, &player->actor.posRot.pos);
    if (AREG(23) != 0) {
        func_80042EF8(globalCtx, colCtx, &lookup->floor, 0, 0, 255);
    }
    if (AREG(22) != 0) {
        func_80042EF8(globalCtx, colCtx, &lookup->wall, 0, 255, 0);
    }
    if (AREG(21) != 0) {
        func_80042EF8(globalCtx, colCtx, &lookup->ceiling, 255, 0, 0);
    }
}
