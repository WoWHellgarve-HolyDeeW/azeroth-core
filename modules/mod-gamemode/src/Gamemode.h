#pragma once

#include "Player.h"
#include "World.h"
#include "WorldSession.h"
#include "Map.h"
#include "DBCStores.h"
#include "DBCStore.h"
#include "Creature.h"
#include "ObjectMgr.h"
#include "Log.h"
#include "CreatureAI.h"
#include "GameObject.h"
#include "TemporarySummon.h"
#include "Unit.h"
#include "MotionMaster.h"
#include "SmartAI.h"
#include "SmartScript.h"

enum GameModeList
{
    HARDCORE = 1000000,
    CLASSIC = 1000001,
    IRON_MAN = 1000004,
    BLOOD_THIRSTY = 1000005,
};

class Gamemode {
public:
    static std::map<ObjectGuid /*guid*/, uint32 /*level*/> PlayersMode;
    static void PreloadAllModesPlayers();
    static void SetGameMode(Player* player, uint32 gamemodeId);
    static void OnDeath(Player* player, Player* killer);
    static void RemoveGamemode(Player* player);
    static bool CanAddGroupPlayer(Player* player, Player* invitingPlayer);
    static bool CanSendMail(ObjectGuid receveirGuid);
    static void OnLevelUp(Player* player);
    static bool CanJoinRDF(Player* player);
    static bool CanTrade(Player* player);
    static bool CanAddQuest(ObjectGuid guid);
    static uint32 GetGameMode(ObjectGuid guid);
};
