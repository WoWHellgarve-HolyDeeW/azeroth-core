/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "ScriptMgr.h"
#include "Player.h"
#include "Config.h"
#include "Chat.h"
#include "RandomEnchant.h"

class RandomEnchantsPlayer : public PlayerScript {
public:

    RandomEnchantsPlayer() : PlayerScript("RandomEnchantsPlayer") { }


    void applyingEnchant(Player* player, bool apply, Item* item = nullptr) {

        if (item) {
            return;
        }

        for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
        {
            Item* itemEquiped = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
            if (itemEquiped) {
                uint32 enchantId = itemEquiped->GetEnchantmentId(BONUS_ENCHANTMENT_SLOT);
                if (enchantId) {
                    player->ApplyEnchantment(itemEquiped, BONUS_ENCHANTMENT_SLOT, apply);
                }
            }
        }
    }

    void OnCreateItem(Player* player, Item* item, uint32 /*count*/) override
    {
        uint32 enchantId = RandomEnchant::GetRandomEnchant(player, item);
        if (enchantId != 0)
            RandomEnchant::ApplyRandomEnchant(item, enchantId, player); 
    }

    void OnEquip(Player* player, Item* item, uint8 /*bag*/, uint8 /*slot*/, bool /*update*/) {
        applyingEnchant(player, false);
        applyingEnchant(player, true);
    }

    void OnUnEquip(Player* player, Item* item) {
        uint32 enchantId = item->GetEnchantmentId(BONUS_ENCHANTMENT_SLOT);
        if (enchantId) {
            SpellItemEnchantmentEntry const* pEnchant = sSpellItemEnchantmentStore.LookupEntry(enchantId);
            SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(pEnchant->spellid[0]);
            if(spellInfo)
                player->RemoveAuraFromStack(spellInfo->Id);
        }
    }

    void OnLogin(Player* player) {
        applyingEnchant(player, false);
        applyingEnchant(player, true);
    }

};


class WS_RE : public WorldScript
{
public:
    WS_RE() : WorldScript("WS_RE") { }

    void OnAfterConfigLoad(bool reload) override
    {
        RandomEnchant::PreloadAllEnchants();
    }
};

// Add all scripts in one
void AddSC_RandomEnchant()
{
    new WS_RE();
    new RandomEnchantsPlayer();
}
