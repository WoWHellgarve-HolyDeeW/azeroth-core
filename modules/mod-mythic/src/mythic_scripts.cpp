/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "ScriptMgr.h"
#include "Player.h"
#include "Config.h"
#include "Chat.h"
#include "MythicManager.h"
#include "ScriptedAI/ScriptedCreature.h"
#include "GossipDef.h"
#include "ScriptedGossip.h"
#include "MapMgr.h"
#include "Chat.h"
#include "ScriptMgr.h"

class npc_mythic : public CreatureScript
{
public:
    npc_mythic() : CreatureScript("npc_mythic") { }

    struct npc_mythicAI : ScriptedAI
    {
        npc_mythicAI(Creature* creature) : ScriptedAI(creature) { };
    };

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        Map* map = player->GetMap();
        std::string mapName = map->GetMapName();
        std::string gossip = "Start " + mapName + " on Mythic difficulty.";
        auto itr = MythicManager::encounters.find(player->GetMap()->GetInstanceId());
        if (itr == MythicManager::encounters.end())
            AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, gossip, 0, 0);
        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        MythicManager::StartMythic(player);
        CloseGossipMenuFor(player);
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mythicAI(creature);
    }
};

class AutoBalance_AllCreatureScript : public AllCreatureScript
{
public:
    AutoBalance_AllCreatureScript()
        : AllCreatureScript("AutoBalance_AllCreatureScript")
    {
    }

    void Creature_SelectLevel(const CreatureTemplate* /*creatureTemplate*/, Creature* creature) override
    {
        ModifyCreatureAttributes(creature, true);
    }

    void OnAllCreatureUpdate(Creature* creature, uint32 /*diff*/) override
    {
        ModifyCreatureAttributes(creature);
    }

    void ModifyCreatureAttributes(Creature* creature, bool resetSelLevel = false)
    {

        if (!creature || !creature->GetMap())
            return;

        if (!creature->GetMap()->IsDungeon())
            return;

        if (creature->GetMap()->IsBattleground())
            return;

        if (((creature->IsHunterPet() || creature->IsPet() || creature->IsSummon()) && creature->IsControlledByPlayer()))
        {
            return;
        }

        if (!creature->IsAlive())
            return;

        if (creature->IsInCombat())
            return;

        if (!MythicManager::IsInMythic(creature->GetMap()->GetInstanceId()))
            return;

        if (MythicManager::creatureAlreadyCalculated(creature->GetMap()->GetInstanceId(), creature->GetGUID().GetCounter()))
            return;

        CreatureBaseStats const* origCreatureStats = sObjectMgr->GetCreatureBaseStats(creature->getLevel(), creature->GetCreatureTemplate()->unit_class);
        uint32 baseHealth = origCreatureStats->GenerateHealth(creature->GetCreatureTemplate());
        uint32 baseMana = origCreatureStats->GenerateMana(creature->GetCreatureTemplate());
        uint32 playersCounts = creature->GetMap()->GetPlayersCountExceptGMs() == 0 ? 1 : creature->GetMap()->GetPlayersCountExceptGMs();

        Modifier modifier = MythicManager::GetModifier(creature->GetEntry());
        float mythicDifficulty = MythicManager::mythicDifficulty; // default in mythic
        float healthCofficient = MythicManager::healthCofficient; // Increase by 10% of each new player;
        if (modifier.healthCofficient && modifier.healthMultiplier) {
            healthCofficient = modifier.healthCofficient;
            mythicDifficulty = modifier.healthMultiplier;
        }
        const float scaleWithPlayers = healthCofficient * playersCounts;
        float scaledHealth = round(((float)baseHealth * mythicDifficulty) * scaleWithPlayers);
        float scaledMana = round(((float)baseMana * mythicDifficulty) * scaleWithPlayers);
        creature->SetMaxHealth(scaledHealth);
        creature->SetHealth(scaledHealth);
        creature->SetMaxPower(POWER_MANA, scaledMana);
        creature->SetPower(POWER_MANA, scaledMana);
        MythicManager::encounters[creature->GetMap()->GetInstanceId()].push_back(creature->GetGUID().GetCounter());
;    }
};


class AutoBalance_UnitScript : public UnitScript
{
public:
    AutoBalance_UnitScript()
        : UnitScript("AutoBalance_UnitScript", true)
    {
    }

    uint32 DealDamage(Unit* AttackerUnit, Unit* playerVictim, uint32 damage, DamageEffectType damagetype) override
    {
        return _Modifer_DealDamage(playerVictim, AttackerUnit, damage, damagetype);
    }

    uint32 _Modifer_DealDamage(Unit* target, Unit* attacker, uint32 damage, DamageEffectType damagetype)
    {

        if (!attacker || !attacker->GetMap())
            return damage;

        if (!attacker->GetMap()->IsDungeon())
            return damage;

        if (attacker->GetMap()->IsBattleground())
            return damage;

        if (((attacker->IsHunterPet() || attacker->IsPet() || attacker->IsSummon()) && attacker->IsControlledByPlayer()))
        {
            return damage;
        }

        if (!attacker->IsAlive())
            return damage;

        if (attacker->IsInCombat())
            return damage;

        if (!MythicManager::IsInMythic(attacker->GetMap()->GetInstanceId()))
            return damage;

        if (!attacker || attacker->GetTypeId() == TYPEID_PLAYER || !attacker->IsInWorld())
            return damage;

        float damageMultiplier = 1.3f; // default in mythic

        Modifier modifier = MythicManager::GetModifier(attacker->GetEntry());

        if (modifier.meleeMultiplier && damagetype == DIRECT_DAMAGE) {
            damageMultiplier = modifier.meleeMultiplier;
        }

        if (modifier.spellMultiplier && damagetype == SPELL_DIRECT_DAMAGE) {
            damageMultiplier = modifier.spellMultiplier;
        }

        if (modifier.spellMultiplier && damagetype == DOT) {
            damageMultiplier = modifier.spellMultiplier;
        }

        return damage * damageMultiplier;
    }
};


class PS_Mythic : public PlayerScript
{
public:
    PS_Mythic() : PlayerScript("PS_Mythic") { }

    void OnMapChanged(Player* player) {

        if (player->IsGameMaster())
            return;

        uint32 instanceId = GetMythicInstanceId(player);
        if (instanceId > 0) {
            auto itr = MythicManager::encounters.find(instanceId);
            if (itr != MythicManager::encounters.end())
                itr->second.clear();
            NewPlayer(player);
        }
    }

    uint32 GetMythicInstanceId(Player* player) {

        if (!player->GetGroup())
            return 0;

        Group::MemberSlotList const& members = player->GetGroup()->GetMemberSlots();
        for (auto itr = members.begin(); itr != members.end(); ++itr) {
            Player* GroupMember = ObjectAccessor::FindPlayer(itr->guid);
            if (GroupMember) {
                if (MythicManager::IsInMythic(GroupMember) && GroupMember->GetGUID() != player->GetGUID()) {
                    return GroupMember->GetMap()->GetInstanceId();
                }
            }
        }
        return 0;
    }

    void NewPlayer(Player* player) {
        Group::MemberSlotList const& members = player->GetGroup()->GetMemberSlots();
        for (auto itr = members.begin(); itr != members.end(); ++itr) {
            Player* GroupMember = ObjectAccessor::FindPlayer(itr->guid);
            if (GroupMember)
                ChatHandler(GroupMember->GetSession()).PSendSysMessage("[Mythic message] : You raid is now setup for %u players", GroupMember->GetMap()->GetPlayersCountExceptGMs());
        }
    }

};

class GS_Mythic : public GroupScript
{
public:
    GS_Mythic() : GroupScript("GS_Mythic") { }

    void OnDisband(Group* group) {

        if (!group)
            return;

        Player* leader = group->GetLeader();

        if (!leader)
            return;

        uint32 instanceId = leader->GetMap()->GetInstanceId();
        auto itr = MythicManager::encounters.find(instanceId);
        if (itr != MythicManager::encounters.end()) {
            MythicManager::encounters.erase(itr);
        }
    } 

};


class CS_Mythic : public CommandScript
{
public:
    CS_Mythic() : CommandScript("CS_Mythic") { }

    std::vector<ChatCommand> GetCommands() const
    {
        static Acore::ChatCommands::ChatCommandTable commandTable =
        {
            { "reloadallmythic", HandleResetModifier, SEC_PLAYER, Acore::ChatCommands::Console::No },
        };
        return commandTable;
    }

    static bool HandleResetModifier(ChatHandler* handler, const char* args)
    {
        MythicManager::PreloadAllCompletions();
        MythicManager::PreloadAllCreaturesIds();
        MythicManager::PreloadAllLoot();
        MythicManager::PreloadAllRequierements();
        MythicManager::LoadConfig();
        Player* player = handler->GetPlayer();
        uint32 instanceId = player->GetMap()->GetInstanceId();
        auto itr = MythicManager::encounters.find(instanceId);
        if (itr != MythicManager::encounters.end()) {
            itr->second.clear();
        }
        ChatHandler(handler->GetSession()).PSendSysMessage("Mythic reloaded");
        return true;
    }
};


class US_Mythic : public UnitScript
{
public:
    US_Mythic() : UnitScript("CS_Mythic") { }

    void OnBossCompleted(Unit* unit, Creature* creature, GameObject* go, uint32 bossId) {


        LOG_ERROR("ERROR", "On boss completed");

        Player* player = unit->ToPlayer();
        Group* group = player->GetGroup();

        if (player->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || player->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC) {
            Group::MemberSlotList const& members = group->GetMemberSlots();
            for (auto itr = members.begin(); itr != members.end(); ++itr) {
                if (Player* GroupMember = ObjectAccessor::GetPlayer(player->GetMap(), itr->guid))
                    MythicManager::AddKillCreditBoss(GroupMember, bossId);
            }
        }

        if (go)
            MythicManager::CreateLoot(unit->ToPlayer(), bossId, go);
        else 
            MythicManager::CreateLoot(unit->ToPlayer(), bossId, creature);
    }
};

class WS_Mythic : public WorldScript
{
public:
    WS_Mythic() : WorldScript("WS_Mythic") { }

    void OnAfterConfigLoad(bool reload) override
    {
        if (reload) {
            MythicManager::PreloadAllCompletions();
            MythicManager::PreloadAllCreaturesIds();
            MythicManager::PreloadAllLoot();
            MythicManager::PreloadAllRequierements();
            MythicManager::LoadConfig();
        }
    }

    void OnStartup() override
    {
        MythicManager::PreloadAllCompletions();
        MythicManager::PreloadAllCreaturesIds();
        MythicManager::PreloadAllLoot();
        MythicManager::PreloadAllRequierements();
        MythicManager::LoadConfig();
    }
};

// Add all scripts in one
void AddSC_Mythic()
{
    new PS_Mythic();
    new CS_Mythic();
    new GS_Mythic();
    new US_Mythic();
    new WS_Mythic();
    new npc_mythic();
    new AutoBalance_UnitScript();
    new AutoBalance_AllCreatureScript();
}
