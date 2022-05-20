#include "RandomEnchant.h"
#include "Log.h"
#include "SpellInfo.h"
#include "DBCStore.h"
#include "DBCStores.h"
#include "SpellMgr.h"
#include "Bag.h"
std::map<uint32, CustomEnchant> RandomEnchant::mEnchants = {};
std::map<ObjectGuid, std::vector<uint32>> RandomEnchant::lastestEnchants = {};

void RandomEnchant::ApplyRandomEnchant(Item* item, uint32 enchantId, Player* player)
{
    player->ApplyEnchantment(item, BONUS_ENCHANTMENT_SLOT, false);
    item->SetEnchantment(BONUS_ENCHANTMENT_SLOT, enchantId, 0, 0, player->GetGUID());
    player->ApplyEnchantment(item, BONUS_ENCHANTMENT_SLOT, true);
}

uint32 RandomEnchant::GetItemEnchantSpellId(Player* player, uint32 bag, uint32 slotId)
{
   if (Item* pItem = GetItemByPosition(player, bag, slotId)) {
        uint32 enchantId = pItem->GetEnchantmentId(BONUS_ENCHANTMENT_SLOT);

        if (!enchantId)
            return 0;  

        SpellItemEnchantmentEntry const* pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchantId);

        if (!pEnchant)
            return 0;

        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(pEnchant->spellid[0]);

        if (!spellInfo)
            return 0;

        return spellInfo->Id;
    }
    return 0;
}

Item* RandomEnchant::GetItemByPosition(Player* player, uint32 bag, uint32 slotId)
{
    Item* pItem = nullptr;
    if (bag == 255) {
        pItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slotId);
    }
    else if (bag == 0) {
        pItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slotId);
    }
    else {
        pItem = player->GetItemByPos(bag, slotId);
    }
    return pItem;
}

uint32 RandomEnchant::SpellIdToEnchantId(uint32 spellId)
{
    auto it = mEnchants.find(spellId);

    if (it != mEnchants.end())
        return it->second.enchantId;

    return 0;
}

uint32 RandomEnchant::GetRandomEnchant(Player* player, Item* item, bool spellId)
{
    const ItemTemplate* itemTemplate = item->GetTemplate();
    std::vector<uint32> enchants = {};
    int allowableClass = player->getClass();

    if (itemTemplate->Class != 2 && itemTemplate->Class != 4)
        return 0;

    for (auto& enchant : mEnchants) {
        if ((enchant.second.allowableClass & player->getClassMask()) != 0)
        {
          enchants.push_back(spellId ? enchant.first : enchant.second.enchantId);
        }
    }

    uint32 previousEnchantId = item->GetEnchantmentId(BONUS_ENCHANTMENT_SLOT);

    if (previousEnchantId) {
        enchants.erase(std::remove(enchants.begin(), enchants.end(), previousEnchantId), enchants.end());
    }

    if (enchants.size() == 0)
        return 0;

    int random = rand() % enchants.size();
    return enchants[random];
}

std::vector<uint32> RandomEnchant::GetStats(const ItemTemplate* item)
{
    std::vector<uint32> stats = {};
    return stats;
}

std::vector<uint32> RandomEnchant::GetPossibleEnchantsToApply(Player* player, uint32 bag, uint32 slotId)
{

    /* if (player->GetItemCount(40752) == 0)
        return {};
    player->DestroyItemCount(40752, 1, true);*/

    Item* item = GetItemByPosition(player, bag, slotId);

    if (!item)
        return {};

    auto it = lastestEnchants.find(player->GetGUID());

    if (it != lastestEnchants.end())
        lastestEnchants.erase(it);

    uint32 enchantId = GetRandomEnchant(player, item, true);

    if (enchantId == 0)
        return {};

    uint32 previousEnchantId = item->GetEnchantmentId(BONUS_ENCHANTMENT_SLOT);

    if (!previousEnchantId)
        return {};

    SpellItemEnchantmentEntry const* pEnchant = sSpellItemEnchantmentStore.LookupEntry(previousEnchantId);

    if (!pEnchant)
        return {};

    lastestEnchants[player->GetGUID()].push_back(pEnchant->spellid[0]);
    lastestEnchants[player->GetGUID()].push_back(enchantId);

    return lastestEnchants[player->GetGUID()];
}


void RandomEnchant::PreloadAllEnchants()
{
    QueryResult result = WorldDatabase.Query("SELECT * FROM custom_enchants");
    if (result) {
        do
        {
            Field* fields = result->Fetch();
            int enchantId = fields[0].Get<int>();
            int allowableClass = fields[1].Get<int>();
            int level = fields[2].Get<int>();
            uint32 spellId = fields[3].Get<uint32>();
            mEnchants[spellId] = { enchantId, allowableClass, level };
        } while (result->NextRow());
    }
    LOG_INFO("server.loading", "loaded %u bonus...", mEnchants.size());
}

void RandomEnchant::onLogin(Player* player)
{
}

void RandomEnchant::onLogout(Player* player)
{
    player->_ApplyAllLevelScaleItemMods(false);
}

