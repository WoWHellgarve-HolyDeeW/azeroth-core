#pragma once
#include "Player.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Chat.h"
#include "Group.h"
#include "Config.h"


struct PossibleLoot {
    uint32 ItemId;
    uint32 Quantity;
};

struct Completion {
    uint64 guid;
    uint32 bossId;
};

struct Modifier {
    float spellMultiplier;
    float meleeMultiplier;
    float healthMultiplier;
    float healthCofficient;
};


class MythicManager {
public:

    struct Mythic {
        Map* map;
        uint64 groupGuid;
        Player* leader;
        bool isRaid;
        std::vector<uint64> creatureGuids;
        uint8 level;
    };
    static void CreateLoot(Player* player, uint32 bossId, Creature* boss);
    static void CreateLoot(Player* player, uint32 bossId, GameObject* go);
    static void StartMythic(Player* player, uint8 level);
    static void StopMythic(Player* player);
    static void AddKillCreditBoss(Player* player, uint32 bossId);
    static bool IsInMythic(uint32 instanceId);
    static bool IsInMythic(Player* player);
    static bool creatureAlreadyCalculated(uint32 instanceId, uint64 guid);
    static Modifier GetModifier(uint32 creatureId);
    static void PreloadAllLoot();
    static void PreloadAllCompletions();
    static void PreloadAllRequierements();
    static void PreloadAllCreaturesIds();
    static Mythic GetMythicEncounter(uint32 instanceId);
    static void ResetMythic(Group* group, bool remove);
    static void AddCreatureCalculated(uint32 instanceId, uint64 guid);

private:


    static void RewardEmblemsPlayers(Player* player, bool isRaid);
    static std::map<uint32 /* bossId */, std::vector<PossibleLoot> /* possibleLoot*/> loots;
    static std::vector<Completion> completions;
    static std::map<uint32 /* mapId */, uint32 /* bossId */> requierements;
    static std::map<uint32 /* creatureId */, Modifier /* Modifier */> creaturesModifiers;
    static std::map<uint32 /* instance Id */, Mythic> encounters;

    static bool CanDoMythic(Player* player, uint32 mapId);
    static std::vector<LootStoreItem> GenerateMythicLoot(Player* killer, uint32 bossId);

};
