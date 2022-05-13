/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "ScriptMgr.h"
#include "Player.h"
#include "Config.h"
#include "Chat.h"
#include "PerkManager.h"

class PS_PerksManager : public PlayerScript
{
public:
    PS_PerksManager() : PlayerScript("PS_PerksManager") { }

    void OnChangeSpec(Player* player, uint8 specId)
    {
        PerksManager::OnChangeSpec(player, specId);
    }

    void OnLogin(Player* player)
    {
        PerksManager::ApplyAuraPerk(player);
    }

    void OnDelete(ObjectGuid guid, uint32 accountId)
    {
        PerksManager::OnCharDelete(guid);
    }
    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        PerksManager::OnLevelUp(player, oldLevel);
    }
};
class WS_PerksManager : public WorldScript
{
public:
    WS_PerksManager() : WorldScript("WS_PerksManager") { }

    void OnAfterConfigLoad(bool reload) override
    {
        PerksManager::PreloadAllCharacterPerks();
        PerksManager::PreloadAllPerks();
        PerksManager::PreloadAllPoll();
        PerksManager::PreloadAllPrestige();
    }

    void OnStartup() override
    {
        PerksManager::PreloadAllCharacterPerks();
        PerksManager::PreloadAllPerks();
        PerksManager::PreloadAllPoll();
        PerksManager::PreloadAllPrestige();
    }
};

// Add all scripts in one
void AddSC_Perk()
{
    new WS_PerksManager();
    new PS_PerksManager();
}
