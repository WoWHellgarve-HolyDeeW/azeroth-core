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

    void OnCreateItem(Player* player, Item* item, uint32 /*count*/) override
    {
        uint32 enchantId = RandomEnchant::GetRandomEnchant(player, item);
        if (enchantId != 0)
            RandomEnchant::ApplyRandomEnchant(item, enchantId, player);
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
