#pragma once
#pragma once
#include "Player.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Chat.h"


class PerksManager {

public:

    struct PerkPoll {
        uint32 spellId;
        uint32 specId;
        bool isChosen;
        bool operator==(uint32 spcId) {
            return specId == spcId && isChosen == false;
        }
    };


    struct CharacterPerk {
        std::string uuid;
        uint32 spellId;
        bool inQueue;
        uint8 category;
        bool isAura;
        bool isChosen;
        uint32 specId;
        bool isDefault;
        bool operator () (const CharacterPerk& m) const
        {
            return m.uuid == m.uuid;
        }
    };

    struct Perk {
        uint32 spellId;
        bool isUnique;
        int32 allowableClass;
        bool isPermanent;
        uint8 chance;
        uint8 category;
        bool isAura;
        uint32 groupId;
    };

    static void PreloadAllPoll();
    static void PreloadAllPrestige();
    static void PreloadAllPerks();
    static void PreloadAllCharacterPerks();
    static std::vector < PerksManager::Perk > PerksV;
    static std::map <uint32, PerksManager::Perk > Perks;
    static std::map<uint64, std::vector < CharacterPerk >> CharacterPerks;
    static std::map<uint64, std::vector < PerkPoll >> CharacterPerksPoll;
    static std::map<uint32 /*accountId*/, uint32> CharacterPrestige;
    static void InsertNewPerksForLevelUp(Player* player, std::string uuid);
    static void OnLevelUp(Player* player, uint8 oldLevel);
    static void SetSelectPerk(Player* player, std::string UUID, uint32 spellId);
    static void OnChangeSpec(Player* player, uint8 specId);
    static void OnCharDelete(ObjectGuid guid);
    static void ApplyAuraPerk(Player* player);
    static void ApplyPerkHeroClass(Player* player);
    static void ResetCharacter(Player* player);
    static void SavePollPerks(Player* player);
    static bool isPrestigeActive(Player* player);
    static bool FoundSimilar(Player* player, std::string uuid, uint32 spellId);
    static uint32 GetPrestigeLevel(Player* player);
    static void LevelUpPrestige(Player* player);
    static void ResetCharacterEquipment(Player* player);

    static PerksManager::PerkPoll GetRandomPrestigeSpell(Player* player);

    static uint32 GetCountPerks(Player* player, uint8 specId);
    static uint32 GetCountPerk(Player* player, uint32 spellId, uint8 specId);
    static void InsertOnePerk(Player* player, std::string uuid, uint32 spellId, bool isAura, uint8 isDefault);
    static std::vector < CharacterPerk > GetLastestPerk(Player* player, uint8 category);
    static std::vector < CharacterPerk > GetPlayerPerks(Player* player);
    static std::vector < CharacterPerk > GetPendingPlayerPerks(Player* player);
    static std::vector < PerkPoll > GetLastPlayersPerks(Player* player);

    static bool hasAlreadyPerkGroup(Player* player, uint32 spellId);
    static bool IsSpellInPoll(Player* player, uint32 spellId);

    static PerksManager::Perk GetPerk(uint32 spellId);

};
