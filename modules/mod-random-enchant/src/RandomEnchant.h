#pragma once
#include "Item.h"
#include "Player.h"


struct CustomEnchant {
    int enchantId;
    int allowableClass;
    // 0 - All Items - 1 - Stuff PvP/Raids - 2 raids mythic / pvp r2.
    int level;
};

class RandomEnchant {

public: 
    static std::map<uint32 /* spellId */, CustomEnchant> mEnchants;
    static std::map<ObjectGuid, std::vector<uint32>> lastestEnchants;
    static void ApplyRandomEnchant(Item* item, uint32 enchantId, Player* player);
    static uint32 GetRandomEnchant(Player* player, Item* item, bool spellId = false);
    static uint32 SpellIdToEnchantId(uint32 spellId);
    static uint32 GetItemEnchantSpellId(Player* player, uint32 bags, uint32 slotId);
    static Item* GetItemByPosition(Player* player, uint32 bags, uint32 slotId);
    // static uint32 GetEnchant(uint32 classId, uint32 statsType);
    static std::vector<uint32> GetStats(const ItemTemplate* item);
    static std::vector<uint32> GetPossibleEnchantsToApply(Player* player, uint32 bag, uint32 slotId);
    static void PreloadAllEnchants();
};
