#ifndef UNIT_H
#define UNIT_H

#include "prelude.h"

//#include "bm.h"

#define UNIT_WEAPON_EXP_COUNT 8
#define UNIT_SUPPORT_COUNT 7
#define UNIT_LEVEL_MAX 20

enum
{
    UNIT_AMOUNT_BLUE = 62,
    UNIT_AMOUNT_RED = 50,
    UNIT_AMOUNT_GREEN = 20,
    UNIT_AMOUNT_PURPLE = 5,
};

// flags constants for PInfo::attributes and JInfo::attributes
enum
{
    UNIT_ATTR_MOUNTED = 1 << 0,
    UNIT_ATTR_RE_MOVE = 1 << 1,
    UNIT_ATTR_STEAL = 1 << 2,
    UNIT_ATTR_THIEF = 1 << 3,
    UNIT_ATTR_DANCE = 1 << 4,
    UNIT_ATTR_PLAY = 1 << 5,
    UNIT_ATTR_CRITBONUS = 1 << 6,
    UNIT_ATTR_BALLISTA = 1 << 7,
    UNIT_ATTR_PROMOTED = 1 << 8,
    UNIT_ATTR_SUPPLY = 1 << 9,
    UNIT_ATTR_MOUNT_ICON = 1 << 10,
    UNIT_ATTR_WYVERN_ICON = 1 << 11,
    UNIT_ATTR_PEGASUS_ICON = 1 << 12,
    UNIT_ATTR_LORD = 1 << 13,
    UNIT_ATTR_FEMALE = 1 << 14,
    UNIT_ATTR_BOSS = 1 << 15,
    UNIT_ATTR_LOCK_ROY = 1 << 16,
    UNIT_ATTR_LOCK_MYRM = 1 << 17,
    UNIT_ATTR_LOCK_DRAGON = 1 << 18,
    UNIT_ATTR_LOCK_ZEPHIEL = 1 << 19,
    UNIT_ATTR_20 = 1 << 20,
    UNIT_ATTR_TRIANGLE_ATTACK_PEGASI = 1 << 21,
    UNIT_ATTR_TRIANGLE_ATTACK_ARMORS = 1 << 22,
    UNIT_ATTR_ALT_PINFO = 1 << 23,
    UNIT_ATTR_MAJOR_BOSS = 1 << 24,

    // Helpers
    UNIT_ATTR_REFRESHER = UNIT_ATTR_DANCE | UNIT_ATTR_PLAY,
    UNIT_ATTR_TRIANGLE_ATTACK_ANY = UNIT_ATTR_TRIANGLE_ATTACK_PEGASI | UNIT_ATTR_TRIANGLE_ATTACK_ARMORS,
};

// flag constants for Unit::flags
enum
{
    // this unit shouldn't be displayed
    UNIT_FLAG_HIDDEN = 1 << 0,

    // this units turn properly ended (it is "grayed out")
    UNIT_FLAG_TURN_ENDED = 1 << 1,

    // this unit is currently dead (note that only blue units remain in memory while dead)
    UNIT_FLAG_DEAD = 1 << 2,

    // this unit has not been deployed for this chapter
    UNIT_FLAG_NOT_DEPLOYED = 1 << 3,

    // this unit is rescuing another unit (its ID being found in Unit::rescue)
    UNIT_FLAG_RESCUING = 1 << 4,

    // this unit is being rescued by anther unit (its ID being found in Unit::rescue)
    UNIT_FLAG_RESCUED = 1 << 5,

    // this unit comitted to an action (but may still be in the process of ending its move)
    UNIT_FLAG_HAD_ACTION = 1 << 6,

    // this unit is under a roof
    UNIT_FLAG_UNDER_ROOF = 1 << 7,

    // this unit will fade in/out alongside the map during a map fade (used for rooves and fog)
    UNIT_FLAG_MAPFADE = 1 << 8,

    // this unit is concealed by the fog
    UNIT_FLAG_CONCEALED = 1 << 9,

    // this unit was processed by the AI driver and won't have its turn
    UNIT_FLAG_AI_PROCESSED = 1 << 10,

	US_GROWTH_BOOST = (1 << 13),
    // per unit battle animation config (first bit)
    UNIT_FLAG_SOLOANIM_1   = 1 << 14,

    // per unit battle animation config (second bit)
    UNIT_FLAG_SOLOANIM_2   = 1 << 15,

    US_BIT16        = (1 << 16),
    US_BIT17        = (1 << 17),
    US_BIT18        = (1 << 18),
    US_BIT19        = (1 << 19),
    US_BIT20        = (1 << 20),
    US_BIT21        = (1 << 21),
    US_BIT22        = (1 << 22),
    US_BIT23        = (1 << 23),
    // = (1 << 24),
    US_BIT25 = (1 << 25),
    US_BIT26 = (1 << 26),
    US_BIT27 = (1 << 27),
	
    // Helpers

    UNIT_FLAG_UNAVAILABLE = UNIT_FLAG_DEAD | UNIT_FLAG_NOT_DEPLOYED,
    UNIT_FLAG_SOLOANIM = UNIT_FLAG_SOLOANIM_1 | UNIT_FLAG_SOLOANIM_2,
};

// valid values for Unit::status
enum
{
    UNIT_STATUS_NONE,

    UNIT_STATUS_POISON,
    UNIT_STATUS_SLEEP,
    UNIT_STATUS_SILENCED,
    UNIT_STATUS_BERSERK,
};

// bits of the result of GetUnitUseBits
enum
{
    UNIT_USEBIT_WEAPON = 1 << 0,
    UNIT_USEBIT_STAFF = 1 << 1,
};

// item slot constants
enum
{
    // 0..4 are unit inventory

    ITEMSLOT_INV0,
    ITEMSLOT_INV1,
    ITEMSLOT_INV2,
    ITEMSLOT_INV3,
    ITEMSLOT_INV4,

    ITEMSLOT_INV_COUNT,

    ITEMSLOT_OVERFLOW = ITEMSLOT_INV_COUNT + 0,
    ITEMSLOT_ARENA_PLAYER = ITEMSLOT_INV_COUNT + 1,
    ITEMSLOT_ARENA_OPPONENT = ITEMSLOT_INV_COUNT + 2,
    ITEMSLOT_BALLISTA = ITEMSLOT_INV_COUNT + 3,
};

// valid constants for JInfo::walk_speed
enum
{
    UNIT_WALKSPEED_FAST,
    UNIT_WALKSPEED_SLOW,
};

struct PInfo
{
    /* 00 */ u16 msg_name;
    /* 02 */ u16 msg_desc;
    /* 04 */ u8 id;
    /* 05 */ u8 jid_default;
    /* 06 */ u16 fid;
    /* 08 */ u8 chibi_id;
    /* 09 */ u8 affinity;
    /* 0A */ u8 sort_order_key;

    /* 0B */ i8 base_level;
    /* 0C */ i8 base_hp;
    /* 0D */ i8 base_pow;
    /* 0E */ i8 base_skl;
    /* 0F */ i8 base_spd;
    /* 10 */ i8 base_def;
    /* 11 */ i8 base_res;
    /* 12 */ i8 base_lck;
    /* 13 */ i8 bonus_con;

    /* 14 */ u8 wexp[UNIT_WEAPON_EXP_COUNT];

    /* 1C */ u8 growth_hp;
    /* 1D */ u8 growth_pow;
    /* 1E */ u8 growth_skl;
    /* 1F */ u8 growth_spd;
    /* 20 */ u8 growth_def;
    /* 21 */ u8 growth_res;
    /* 22 */ u8 growth_lck;

    /* 23 */ u8 banim_pal_a;
    /* 24 */ u8 banim_pal_b;
    /* 25 */ // pad

    /* 28 */ u32 attributes;

    /* 2C */ struct SupportInfo const * support_info;
};

struct JInfo
{
    /* 00 */ u16 msg_name;
    /* 02 */ u16 msg_desc;
    /* 04 */ u8 id;
    /* 05 */ u8 jid_promote;
    /* 06 */ u8 map_sprite;
    /* 07 */ u8 walk_speed;
    /* 08 */ u16 fid;
    /* 0A */ u8 sort_order_key;

    /* 0B */ i8 base_hp;
    /* 0C */ i8 base_pow;
    /* 0D */ i8 base_skl;
    /* 0E */ i8 base_spd;
    /* 0F */ i8 base_def;
    /* 10 */ i8 base_res;
    /* 11 */ i8 base_con;
    /* 12 */ i8 base_mov;

    /* 13 */ i8 max_hp;
    /* 14 */ i8 max_pow;
    /* 15 */ i8 max_skl;
    /* 16 */ i8 max_spd;
    /* 17 */ i8 max_def;
    /* 18 */ i8 max_res;
    /* 19 */ i8 max_con;

    /* 1A */ i8 power_level;

    /* 1B */ i8 growth_hp;
    /* 1C */ i8 growth_pow;
    /* 1D */ i8 growth_skl;
    /* 1E */ i8 growth_spd;
    /* 1F */ i8 growth_def;
    /* 20 */ i8 growth_res;
    /* 21 */ i8 growth_lck;
    /* 22 */ // pad

    /* 24 */ u32 attributes;

    /* 28 */ u8 wexp[UNIT_WEAPON_EXP_COUNT];

    /* 30 */ void const * banim_info;

    /* 34 */ i8 const * mov_table;
    /* 38 */ i8 const * avo_terrain_table;
    /* 3C */ i8 const * def_terrain_table;
    /* 40 */ i8 const * res_terrain_table;

    /* 44 */ void const * unk_44;
};

struct Unit
{
    /* 00 */ struct PInfo const * pinfo;
    /* 04 */ struct JInfo const * jinfo;
    /* 08 */ i8 level;
    /* 09 */ u8 exp;
    /* 0A */ u8 ai_flags;
    /* 0B */ i8 id;
    /* 0C */ u32 flags;
    /* 10 */ i8 x;
    /* 11 */ i8 y;
    /* 12 */ i8 max_hp;
    /* 13 */ i8 hp;
    /* 14 */ i8 pow;
    /* 15 */ i8 skl;
    /* 16 */ i8 spd;
    /* 17 */ i8 def;
    /* 18 */ i8 res;
    /* 19 */ i8 lck;
	
    /* 1A */ i8 bonus_con;
    /* 1B */ u8 rescue;
	/* 1C */ u8 ballistaIndex;
    /* 1D */ i8 bonus_mov;

    /* 1E */ u16 items[ITEMSLOT_INV_COUNT];
    /* 28 */ u8 wexp[UNIT_WEAPON_EXP_COUNT];
	
    /* 30 */ u8 status : 4;
    /* 30 */ u8 status_duration : 4;
    /* 31 */ u8 torch : 4;
    /* 31 */ u8 barrier : 4;
	
    /* 32 */ u8 supports[UNIT_SUPPORT_COUNT];
    /* 39 */ s8 supportBits;
    /* 3A */ u8 _u3A;
    /* 3B */ u8 _u3B;
	
    /* 3C */ struct UnitSprite * map_sprite;
	
    /* 40 */ u16 ai_config;
    /* 42 */ u8 ai_a;
    /* 43 */ u8 ai_a_pc;
    /* 44 */ u8 ai_b;
    /* 45 */ u8 ai_b_pc;
    /* 46 */ u8 ai_counter;
    /* 47 */ // pad?
     // end
};

// UnitInfo is used for constructing new units
struct UnitInfo
{
    /* 00 */ u8 pid;
    /* 01 */ u8 jid;
    /* 02 */ u8 pid_lead;
    /* 03 */ u8 autolevel : 1;
    /* 03 */ u8 faction_id : 2;
    /* 03 */ u8 level : 5;
    /* 04 */ u8 x_load, y_load;
    /* 06 */ u8 x_move, y_move;
    /* 08 */ u8 items[4];
    /* 0C */ u8 ai[4];
};

void InitUnits(void);
void ClearUnit(struct Unit * unit);
void CopyUnit(struct Unit * src, struct Unit * dst);
struct Unit * GetFreeUnit(int faction);
int GetUnitCurrentHp(struct Unit * unit);
int GetUnitMaxHp(struct Unit * unit);
int GetUnitPower(struct Unit * unit);
int GetUnitSkill(struct Unit * unit);
int GetUnitSpeed(struct Unit * unit);
int GetUnitDefense(struct Unit * unit);
int GetUnitResistance(struct Unit * unit);
int GetUnitLuck(struct Unit * unit);
int GetUnitFid(struct Unit * unit);
int GetUnitChibiId(struct Unit * unit);
int GetUnitLeaderPid(struct Unit * unit);
void SetUnitLeaderPid(struct Unit * unit, int pid);
void SetUnitHp(struct Unit * unit, int hp);
void AddUnitHp(struct Unit * unit, int amount);
int GetUnitVision(struct Unit * unit);
char const * GetUnitRescueName(struct Unit * unit);
char const * GetUnitStatusName(struct Unit * unit);
void SetUnitStatus(struct Unit * unit, int status);
struct Unit * GetUnit(int unit_id);
struct JInfo const * GetJInfo(int jid);
struct PInfo const * GetPInfo(int pid);
int GetUnitMapSprite(struct Unit * unit);
bool UnitAddItem(struct Unit * unit, int item);
void UnitRemoveItem(struct Unit * unit, int slot);
void UnitRemoveInvalidItems(struct Unit * unit);
int GetUnitItemCount(struct Unit * unit);
bool UnitHasItem(struct Unit * unit, int item);
int BatchCreateUnits(struct UnitInfo const * info);
struct Unit * CreateUnit(struct UnitInfo const * info);
void UnitInitFromInfo(struct Unit * unit, struct UnitInfo const * info);
void UnitInitStats(struct Unit * unit, struct PInfo const * pinfo);
void func_fe6_08017764(struct Unit * unit);
void UnitInitSupports(struct Unit * unit);
void UnitAutolevelWeaponExp(struct Unit * unit, struct UnitInfo const * info);
void UnitAutolevelCore(struct Unit * unit, u8 jid, int levelCount);
void UnitApplyBonusLevels(struct Unit * unit, int levelCount);
void UnitAutolevel(struct Unit * unit);
void UnitAutolevelPlayer(struct Unit * unit);
void UnitCheckStatOverflow(struct Unit * unit);
struct Unit * GetUnitByPid(int pid);
bool CanUnitCarry(struct Unit * unit, struct Unit * other);
void UnitRescue(struct Unit * unit, struct Unit * other);
void UnitDropRescue(struct Unit * unit, int x, int y);
bool UnitGiveRescue(struct Unit * unit, struct Unit * other);
void KillUnit(struct Unit * unit);
void UnitChangeFaction(struct Unit * unit, int faction);
bool CanUnitCrossTerrain(struct Unit * unit, int terrain);
void UnitSyncMovement(struct Unit * unit);
void UnitGetDropPositionOnDeath(struct Unit * unit, int * x_out, int * y_out);
void UnitBeginAction(struct Unit * unit);
void UnitBeginReMoveAction(struct Unit * unit);
void func_fe6_08017EDC(int x, int y);
void ClearActiveFactionTurnEndedState(void);
void TickActiveFactionTurnAndListStatusHeals(void);
void ClearMapFadeUnits(void);
void UnitUpdateUsedItem(struct Unit * unit, int item_slot);
int GetUnitAid(struct Unit * unit);
int GetUnitMagRange(struct Unit * unit);
bool UnitKnowsMagic(struct Unit * unit);
void func_fe6_080181B0(struct Unit * unit, int x, int y);
int GetUnitKeyItemSlotForTerrain(struct Unit * unit, int terrain);
int GetAidIconFromAttributes(int attributes);
int GetUnitUseBits(struct Unit * unit);
bool CanActiveUnitStillMove(void);

//extern struct Unit * CONST_DATA gUnitLut[0x100];

extern struct Unit * gActiveUnit;

extern u8 EWRAM_DATA gActiveUnitId;
extern struct Vec2i EWRAM_DATA gActiveUnitMoveOrigin;

extern struct Unit EWRAM_DATA gUnitArrayBlue[UNIT_AMOUNT_BLUE];
extern struct Unit EWRAM_DATA gUnitArrayRed[UNIT_AMOUNT_RED];
extern struct Unit EWRAM_DATA gUnitArrayGreen[UNIT_AMOUNT_GREEN];
extern struct Unit EWRAM_DATA gUnitArrayPurple[UNIT_AMOUNT_PURPLE];

#define UNIT_FACTION(unit) ((unit)->id & 0xC0)
#define UNIT_PID(unit) ((unit)->pinfo->id)
#define UNIT_JID(unit) ((unit)->jinfo->id)
#define UNIT_ATTRIBUTES(unit) (((unit)->pinfo->attributes) | ((unit)->jinfo->attributes))

#define UNIT_HP_CAP(unit)  (UNIT_FACTION(unit) == FACTION_RED ? 80 : 60)
#define UNIT_POW_CAP(unit) ((unit)->jinfo->max_pow)
#define UNIT_SKL_CAP(unit) ((unit)->jinfo->max_skl)
#define UNIT_SPD_CAP(unit) ((unit)->jinfo->max_spd)
#define UNIT_DEF_CAP(unit) ((unit)->jinfo->max_def)
#define UNIT_RES_CAP(unit) ((unit)->jinfo->max_res)
#define UNIT_LCK_CAP(unit) (30)
#define UNIT_CON_CAP(unit) ((unit)->jinfo->max_con)
#define UNIT_MOV_CAP(unit) (15)

#define UNIT_CON_BASE(unit) ((unit)->jinfo->base_con + (unit)->pinfo->bonus_con)
#define UNIT_MOV_BASE(unit) ((unit)->jinfo->base_mov)

#define UNIT_CON(unit) (UNIT_CON_BASE(unit) + (unit)->bonus_con)
#define UNIT_MOV(unit) ((unit)->bonus_mov + UNIT_MOV_BASE(unit))

// The following macros are helpers for building loops that go through all units
// whether or not those are necessary is debatable

#define FOR_UNITS(begin, end, var_name, body) \
{ \
    int _uid; \
    struct Unit * var_name; \
    for (_uid = (begin); _uid < (end); ++_uid) \
    { \
        var_name = GetUnit(_uid); \
        if (!var_name) \
            continue; \
        if (!var_name->pinfo) \
            continue; \
        body \
    } \
}

#define FOR_UNITS_FACTION(faction, var_name, body) \
    FOR_UNITS((faction) + 1, (faction) + 0x40, var_name, body)

#define FOR_UNITS_ALL(var_name, body) \
    FOR_UNITS(1, 0xC0, var_name, body)

#endif // UNIT_H
