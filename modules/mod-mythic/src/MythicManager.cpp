#include "MythicManager.h"

std::map<uint32 /* bossId */, std::vector<PossibleLoot> /* possibleLoot*/> MythicManager::loots = {};
std::vector<Completion> MythicManager::completions = {};
std::map<uint32, uint32> MythicManager::requierements = {};
std::map<uint32, MythicManager::Mythic> MythicManager::encounters = {};
std::map<uint32 /* creatureId */, Modifier /* Modifier */> MythicManager::creaturesModifiers = {};

void MythicManager::CreateLoot(Player* player, uint32 bossId, Creature* boss)
{
    if (!player)
        return;

    uint32 instanceId = player->GetMap()->GetInstanceId();

    if (!IsInMythic(instanceId))
        return;

    boss->loot.items.clear();

    Mythic mythic = GetMythicEncounter(instanceId);

    if (mythic.isRaid) {
        std::vector<LootStoreItem> loots = GenerateMythicLoot(player, bossId);
        for (auto& item : loots) {
            boss->loot.AddItem(item);
        }
    }

    RewardEmblemsPlayers(player, mythic.isRaid);
}

void MythicManager::CreateLoot(Player* player, uint32 bossId, GameObject* go)
{
    if (!player)
        return;

    uint32 instanceId = player->GetMap()->GetInstanceId();

    if (!IsInMythic(instanceId))
        return;

    go->loot.items.clear();

    Mythic mythic = GetMythicEncounter(instanceId);

    if (mythic.isRaid) {
        std::vector<LootStoreItem> loots = GenerateMythicLoot(player, bossId);
        for (auto& item : loots) {
            go->loot.AddItem(item);
        }
    }

    RewardEmblemsPlayers(player, mythic.isRaid);
}

void MythicManager::StartMythic(Player* player, uint8 level)
{
    Group* group = player->GetGroup();

    if (!group) {
        ChatHandler(player->GetSession()).PSendSysMessage("You need to be in group to start this dungeon on Mythic Difficulty.");
        return;
    }

    if (group->GetLeaderGUID() != player->GetGUID()) {
        ChatHandler(player->GetSession()).PSendSysMessage("You need to be the group leader to start this dungeon on Mythic Difficulty.");
        return;
    }

    Map* map = player->GetMap();

    Group::MemberSlotList const& members = group->GetMemberSlots();
    uint32 instanceId = map->GetInstanceId();
    std::vector<uint64> playerGuidsDoNotMeetRequierement = {};

   /* for (auto itr = members.begin(); itr != members.end(); ++itr) {
        Player* GroupMember = ObjectAccessor::GetPlayer(map, itr->guid);
        if (!GroupMember) {
            ChatHandler(player->GetSession()).PSendSysMessage("Someone in your group is disconnected.");
            return;
        }
    }

    for (auto itr = members.begin(); itr != members.end(); ++itr) {
        if (Player* GroupMember = ObjectAccessor::GetPlayer(map, itr->guid)) {
            if (!CanDoMythic(GroupMember, map->GetId()))
                playerGuidsDoNotMeetRequierement.push_back(GroupMember->GetGUID().GetCounter());
        }
    }

    if (playerGuidsDoNotMeetRequierement.size() > 0) {
        std::string names = "";
        for (auto guid : playerGuidsDoNotMeetRequierement) {
            if (Player* GroupMember = ObjectAccessor::GetPlayer(map, ObjectGuid(guid)))
                names += GroupMember->GetName() + (playerGuidsDoNotMeetRequierement.size() > 1 ? ", " :  ".");
        }

        ChatHandler(player->GetSession()).PSendSysMessage("Theses player(s) in your group do not meet the requirements to start : %s", names);
        return;
    } */

    for (auto itr = members.begin(); itr != members.end(); ++itr) {
        Player* GroupMember = ObjectAccessor::FindPlayer(itr->guid);
        if (GroupMember)
            ChatHandler(GroupMember->GetSession()).PSendSysMessage("Your group leader started %s on Mythic difficulty.", map->GetMapName());
    }

    bool isRaid = map->IsRaid();
    MythicManager::encounters[map->GetInstanceId()] = { map, group->GetGUID().GetCounter(), player, isRaid, {}, level};
}

void MythicManager::AddKillCreditBoss(Player* player, uint32 bossId)
{
    auto completion = std::find_if(MythicManager::completions.begin(), MythicManager::completions.end(), [&](Completion const& completion)
    {
        return completion.bossId == bossId;
    });

    if (completion == MythicManager::completions.end()) {
        completions.push_back({ player->GetGUID().GetCounter(), bossId });
        CharacterDatabase.Query("INSERT mythic_completions (guid, bossId) VALUES ({}, {})", player->GetGUID().GetCounter(), bossId);
    }
}

void MythicManager::PreloadAllLoot()
{
    QueryResult result = WorldDatabase.Query("SELECT * FROM mythic_loot");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 bossId = fields[0].Get<uint32>();
            uint32 itemId = fields[1].Get<uint32>();
            uint32 quantity = fields[2].Get<uint32>();
            MythicManager::loots[bossId].push_back({ itemId, quantity });
        } while (result->NextRow());
    }
}

void MythicManager::PreloadAllCompletions()
{
    QueryResult result = CharacterDatabase.Query("SELECT * FROM mythic_completions");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint64 guid = fields[0].Get<uint64>();
            uint32 bossId = fields[1].Get<uint32>();
            MythicManager::completions.push_back({ guid, bossId });
        } while (result->NextRow());
    }
}

void MythicManager::PreloadAllRequierements()
{
    QueryResult result = WorldDatabase.Query("SELECT * FROM mythic_requierements");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 mapId = fields[0].Get<uint32>();
            uint32 bossId = fields[1].Get<uint32>();
            MythicManager::requierements[mapId] = bossId;
        } while (result->NextRow());
    }
}

void MythicManager::PreloadAllCreaturesIds()
{
    QueryResult result = WorldDatabase.Query("SELECT * FROM mythic_difficulty");
    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 creatureId = fields[0].Get<uint32>();
            float spellMultiplier = fields[1].Get<float>();
            float meleeMultiplier = fields[2].Get<float>();
            float healthMultiplier = fields[3].Get<float>();
            float healthCoefficient = fields[4].Get<float>();
            MythicManager::creaturesModifiers[creatureId] = { spellMultiplier, meleeMultiplier, healthMultiplier, healthCoefficient };
        } while (result->NextRow());
    }
}

bool MythicManager::CanDoMythic(Player* player, uint32 mapId)
{
    auto it = MythicManager::requierements.find(mapId);
    if (it == MythicManager::requierements.end())
        return false;

    uint32 bossId = it->second;

    auto completion = std::find_if(MythicManager::completions.begin(), MythicManager::completions.end(), [&](Completion const& completion)
    {
        return completion.bossId == bossId;
    });

    if (completion == MythicManager::completions.end())
        return false;

    return true;  
}

MythicManager::Mythic MythicManager::GetMythicEncounter(uint32 instanceId)
{
    auto itr = MythicManager::encounters.find(instanceId);
    if (itr != MythicManager::encounters.end())
        return itr->second;

    return {};
}

void MythicManager::ResetMythic(Group* group, bool remove)
{
    for (auto it = MythicManager::encounters.begin(); it != MythicManager::encounters.end(); ++it)
    {
        if (it->second.groupGuid == group->GetGUID().GetCounter()) {
            it->second.creatureGuids.clear();
            if (remove)
                MythicManager::encounters.erase(it);
        }
    }
}

void MythicManager::AddCreatureCalculated(uint32 instanceId, uint64 guid)
{
    MythicManager::encounters[instanceId].creatureGuids.push_back(guid);
}

void MythicManager::RewardEmblemsPlayers(Player* player, bool isRaid)
{
    if (!player)
        return;

    Group* group = player->GetGroup();

    if (!group)
        return;

    uint32 count = isRaid ? 5 : 2;
    uint32 emblemId = sConfigMgr->GetOption<uint32>("RaidEmblemId", 40753);

    Group::MemberSlotList const& members = group->GetMemberSlots();
    for (auto itr = members.begin(); itr != members.end(); ++itr) {
        Player* GroupMember = ObjectAccessor::FindPlayer(itr->guid);
        if (GroupMember) {
            GroupMember->AddItem(emblemId, count);
        }
    }
}

std::vector<LootStoreItem> MythicManager::GenerateMythicLoot(Player* killer, uint32 bossId)
{
    std::vector<LootStoreItem> loots = {};
    std::vector<PossibleLoot> possibleLoots = {};

    auto it = MythicManager::loots.find(bossId);
    if (it != MythicManager::loots.end())
        possibleLoots = it->second;

    if (possibleLoots.size() == 0)
        return loots;

    uint32 playerCount = killer->GetMap()->GetPlayersCountExceptGMs();
    uint32 itemCount = 5;

    for (size_t i = 1; i <= itemCount; i++)
    {
        int random = rand() % possibleLoots.size();
        uint32 itemId = possibleLoots[random].ItemId;
        if (itemId) {
            auto founded = std::find_if(possibleLoots.begin(), possibleLoots.end(), [&](PossibleLoot const& loot)
            {
                return loot.ItemId == itemId;
            });
            possibleLoots.erase(founded);
            LootStoreItem storeItem = LootStoreItem(itemId, 0, 100, 0, LootMethod(killer->GetGroup()->GetLootMethod()), 0, 1, 1);
            loots.push_back(storeItem);
        }
    }

    return loots;
}

Modifier MythicManager::GetModifier(uint32 creatureId)
{
    auto it = MythicManager::creaturesModifiers.find(creatureId);
    if (it != MythicManager::creaturesModifiers.end())
        return it->second;

    return {};
}

bool MythicManager::IsInMythic(uint32 instanceId)
{
    auto it = MythicManager::encounters.find(instanceId);
    if (it != MythicManager::encounters.end())
        return true;
        
    return false;
}

bool MythicManager::IsInMythic(Player* player)
{
    const uint32 instanceId = player->GetMap()->GetInstanceId();
    auto itr = MythicManager::encounters.find(player->GetMap()->GetInstanceId());
    if (itr != MythicManager::encounters.end())
        return true;
    return false;
}

bool MythicManager::creatureAlreadyCalculated(uint32 instanceId, uint64 guid)
{
    auto itr = MythicManager::encounters.find(instanceId);
    if (itr != MythicManager::encounters.end())
        if (std::find(MythicManager::encounters[instanceId].creatureGuids.begin(), MythicManager::encounters[instanceId].creatureGuids.end(), guid)
            != MythicManager::encounters[instanceId].creatureGuids.end())
                return true;

    return false;
}
