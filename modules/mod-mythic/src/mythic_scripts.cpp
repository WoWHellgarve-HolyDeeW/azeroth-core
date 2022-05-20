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
        AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, gossip, 0, 0);
        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        MythicManager::StartMythic(player, 0);
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

        if ((creature->IsHunterPet() || creature->IsPet() || creature->IsSummon()) && creature->IsControlledByPlayer())
            return;

        if (!creature->IsAlive())
            return;
            
        if (!creature->isWorldBoss() || !creature->IsDungeonBoss())
            return;

        if (creature->IsInCombat())
            return;

        if (!creature->IsDungeonBoss())
            return;

        if (!MythicManager::IsInMythic(creature->GetMap()->GetInstanceId()))
            return;

        if (MythicManager::creatureAlreadyCalculated(creature->GetMap()->GetInstanceId(), creature->GetGUID().GetCounter()))
            return;

        MythicManager::Mythic mythic = MythicManager::GetMythicEncounter(creature->GetMap()->GetInstanceId());

        CreatureBaseStats const* origCreatureStats = sObjectMgr->GetCreatureBaseStats(creature->getLevel(), creature->GetCreatureTemplate()->unit_class);
        uint32 baseHealth = origCreatureStats->GenerateHealth(creature->GetCreatureTemplate());
        uint32 baseMana = origCreatureStats->GenerateMana(creature->GetCreatureTemplate());
        uint32 playersCounts = mythic.map->GetPlayersCountExceptGMs() == 0 ? 1 : mythic.map->GetPlayersCountExceptGMs();;

        float scaleWithPlayers = 0.0f;
        float scaledHealth = 0.0f;
        float scaledMana = 0.0f;

        Modifier modifier = MythicManager::GetModifier(creature->GetEntry());

        if (mythic.isRaid) {
            scaleWithPlayers = modifier.healthCofficient ? modifier.healthCofficient : 0.10f * playersCounts;
            scaledHealth = round(((float)baseHealth * 2.0f) * scaleWithPlayers);
            scaledMana = round(((float)baseMana * 2.0f) * scaleWithPlayers);
        }
        else {
            float multiplier = 2.5f;
            scaledHealth = round(((float)baseHealth * multiplier));
            scaledMana = round(((float)baseMana * multiplier));
        }

        creature->SetMaxHealth(scaledHealth);
        creature->SetHealth(scaledHealth);
        creature->SetMaxPower(POWER_MANA, scaledMana);
        creature->SetPower(POWER_MANA, scaledMana);

        MythicManager::AddCreatureCalculated(creature->GetMap()->GetInstanceId(), creature->GetGUID().GetCounter());
;    }
};


class AutoBalance_UnitScript : public UnitScript
{
public:
    AutoBalance_UnitScript()
        : UnitScript("AutoBalance_UnitScript", true)
    {
    }

    uint32 DealDamage(Unit* AttackerUnit, Unit* playerVictim, uint32 damage, DamageEffectType /*damagetype*/) override
    {
        return _Modifer_DealDamage(playerVictim, AttackerUnit, damage);
    }

    void ModifyPeriodicDamageAurasTick(Unit* target, Unit* attacker, uint32& damage) override
    {
        damage = _Modifer_DealDamage(target, attacker, damage);
    }

    void ModifySpellDamageTaken(Unit* target, Unit* attacker, int32& damage) override
    {
        damage = _Modifer_DealDamage(target, attacker, damage);
    }

    void ModifyMeleeDamage(Unit* target, Unit* attacker, uint32& damage) override
    {
        damage = _Modifer_DealDamage(target, attacker, damage);
    }

    void ModifyHealRecieved(Unit* target, Unit* attacker, uint32& damage) override {
        damage = _Modifer_DealDamage(target, attacker, damage);
    }

    uint32 _Modifer_DealDamage(Unit* target, Unit* attacker, uint32 damage)
    {

        if (!MythicManager::IsInMythic(target->GetMap()->GetInstanceId()))
            return damage;

        if (!attacker->ToCreature())
            return damage;

        if (!attacker->ToCreature()->isWorldBoss() || !attacker->ToCreature()->IsDungeonBoss())
            return damage;


        if (!attacker || attacker->GetTypeId() == TYPEID_PLAYER || !attacker->IsInWorld())
            return damage;


        MythicManager::Mythic mythic = MythicManager::GetMythicEncounter(attacker->GetMap()->GetInstanceId());


        float damageMultiplier = mythic.isRaid ? 1.5f : 3.5f; // default in mythic

        Modifier modifier = MythicManager::GetModifier(attacker->GetEntry());

        if (modifier.meleeMultiplier)
            damageMultiplier = modifier.meleeMultiplier;

        if ((attacker->IsHunterPet() || attacker->IsPet() || attacker->IsSummon()) && attacker->IsControlledByPlayer())
            return damage;

        return damage * damageMultiplier;
    }
};


class PS_Mythic : public PlayerScript
{
public:
    PS_Mythic() : PlayerScript("PS_Mythic") { }

    void OnMapChanged(Player* player) {
        if (Group* group = player->GetGroup()) {
            MythicManager::ResetMythic(group, false);
        }
    }
};

class GS_Mythic : public GroupScript
{
public:
    GS_Mythic() : GroupScript("GS_Mythic") { }

    void OnDisband(Group* group) {
        MythicManager::ResetMythic(group, true);
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

        return true;
    }
};

class US_Mythic : public UnitScript
{
public:
    US_Mythic() : UnitScript("CS_Mythic") { }

    void OnBossCompleted(Unit* unit, Creature* creature, GameObject* go, uint32 bossId) {

        Player* player = unit->ToPlayer();
        Group* group = player->GetGroup();

        if (player->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || player->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC) {
            Group::MemberSlotList const& members = group->GetMemberSlots();
            for (auto itr = members.begin(); itr != members.end(); ++itr) {
                if (Player* GroupMember = ObjectAccessor::FindPlayer(itr->guid))
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
        }
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
