/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "ScriptMgr.h"
#include "Player.h"
#include "Config.h"
#include "Chat.h"
#include "Gamemode.h"

class WS_Gamemode : public WorldScript
{
public:
    WS_Gamemode() : WorldScript("WS_Gamemode") { }

    void OnAfterConfigLoad(bool reload) override
    {
        Gamemode::PreloadAllModesPlayers();
    }

    void OnStartup() override
    {
        Gamemode::PreloadAllModesPlayers();
    }
};

class PS_Gamemode : public PlayerScript
{
public:
    PS_Gamemode() : PlayerScript("PS_Gamemode") { }

    bool CanSendMail(Player* player, ObjectGuid receiverGuid, ObjectGuid mailbox, std::string& subject, std::string& body, uint32 money, uint32 COD, Item* item)
    {
        if (!Gamemode::CanSendMail(receiverGuid)) {
            ChatHandler(player->GetSession()).PSendSysMessage("Your receveir can't receive mail while in his game mode.");
            return false;
        }
        return true;
    }

    bool CanJoinLfg(Player* player, uint8 roles, lfg::LfgDungeonSet& dungeons, const std::string& comment)
    {
        if (!Gamemode::CanJoinRDF(player)) {
            ChatHandler(player->GetSession()).PSendSysMessage("You can't accept while in your game mode.");
            return false;
        }
        return true;
    }

    bool CanGroupAccept(Player* player, Group* group)
    {
        if (!Gamemode::CanAddGroupPlayer(player, group->GetLeader())) {
            ChatHandler(player->GetSession()).PSendSysMessage("You can't accept while in your game mode.");
            return false;
        }
        return true;
    }

    bool CanAddQuest(Player* player)
    {
        if (!Gamemode::CanAddQuest(player->GetGUID())) {
            ChatHandler(player->GetSession()).PSendSysMessage("You can't add quest while in your game mode.");
            return false;
        }
        return true;
    }

    bool CanInitTrade(Player* player, Player* target)
    {
        if (!Gamemode::CanTrade(player)) {
            ChatHandler(player->GetSession()).PSendSysMessage("You can't trade while in your game mode.");
            return false;
        }
        return true;
    }

    bool CanEnterMap(Player* player, MapEntry const* entry, InstanceTemplate const* instance, MapDifficulty const* mapDiff, bool loginCheck)
    {
        if (entry->IsDungeon() && !Gamemode::CanJoinRDF(player)) {
            ChatHandler(player->GetSession()).PSendSysMessage("You can't enter in dungeon while in your game mode.");
            return false;
        }
        return true;
    }
};
void AddSC_Gamemode()
{
    new PS_Gamemode();
    new WS_Gamemode();
}
