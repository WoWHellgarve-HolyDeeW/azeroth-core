#include "PerkManager.h"
#include <algorithm>
#include <random>
#include <boost/lexical_cast.hpp>
#include <boost/uuid/uuid_io.hpp>
#include <boost/uuid/uuid.hpp>
#include <boost/uuid/random_generator.hpp>
#include "ObjectMgr.h"
#include "WorldSession.h"
#include "GameTime.h"
#include "Item.h"
#include "Mail.h"
#include "Bag.h"
#include "Gamemode.h"

std::map < uint32, PerksManager::Perk> PerksManager::Perks = {};
std::vector < PerksManager::Perk> PerksManager::PerksV = {};
std::map < uint64, std::vector < PerksManager::PerkPoll >> PerksManager::CharacterPerksPoll = {};
std::map < uint64, std::vector < PerksManager::CharacterPerk >> PerksManager::CharacterPerks = {};
std::map < uint32 /*accountId*/, uint32> PerksManager::CharacterPrestige = {};

void PerksManager::PreloadAllPerks()
{
    QueryResult result = WorldDatabase.Query("SELECT * FROM bonuses");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 spellId = fields[0].Get<uint32>();
            bool isUnique = fields[1].Get<int>() == 0 ? false : true;
            int32 allowableClass = fields[2].Get<int>();
            bool isPermanent = fields[3].Get<int>() == 0 ? false : true;
            uint8 chance = fields[4].Get<uint8>();
            uint8 category = fields[5].Get<uint8>();
            bool isAura = fields[6].Get<int>() == 0 ? false : true;
            uint32 groupId = fields[7].Get<int>();
            PerksManager::Perks[spellId] = { spellId, isUnique, allowableClass, isPermanent, chance, category, isAura, groupId };
            PerksManager::PerksV.push_back({ spellId, isUnique, allowableClass, isPermanent, chance, category, isAura, groupId });
        } while (result->NextRow());
    }
}

void PerksManager::PreloadAllPoll()
{
    QueryResult result = CharacterDatabase.Query("SELECT * FROM character_active_poll_perks");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint64 guid = fields[0].Get<uint64>();
            uint32 spellId = fields[1].Get<uint32>();
            uint32 specId = fields[2].Get<uint32>();
            bool isChosen = fields[3].Get<int>() == 0 ? false : true;
            PerksManager::Perk perk = GetPerk(spellId);
            if (perk.spellId) {
                PerksManager::CharacterPerksPoll[guid].push_back({spellId, specId, isChosen});
            }
        } while (result->NextRow());
    }
}

void PerksManager::PreloadAllPrestige()
{
    QueryResult result = CharacterDatabase.Query("SELECT * FROM character_prestiges");

    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 accountId = fields[0].Get<uint32>();
            uint32 level = fields[1].Get<uint32>();
            PerksManager::CharacterPrestige[accountId] = level;
        } while (result->NextRow());
    }
}

void PerksManager::PreloadAllCharacterPerks()
{
    QueryResult result = CharacterDatabase.Query("SELECT * FROM character_bonuses");
    if (result) {
        do
        {
            Field* fields = result->Fetch();
            std::string uuid = fields[0].Get<std::string>();
            uint64 guid = fields[1].Get<uint64>();
            uint32 spellId = fields[2].Get<uint32>();
            bool inQueue = fields[3].Get<bool>();
            uint8 category = fields[4].Get<uint8>();
            bool isAura = fields[5].Get<bool>();
            uint32 specId = fields[6].Get<uint8>();
            bool isChosen = fields[7].Get<bool>();
            bool isDefault = fields[8].Get<bool>();
            PerksManager::CharacterPerks[guid].push_back({uuid, spellId, inQueue, category, isAura, isChosen, specId, isDefault});
        } while (result->NextRow());
    }
}

void PerksManager::InsertNewPerksForLevelUp(Player* player, std::string uuid)
{
    std::vector<PerksManager::CharacterPerk> perks = {};
    std::vector<PerksManager::Perk> tempPerks = PerksManager::PerksV;
    std::shuffle(tempPerks.begin(), tempPerks.end(), std::random_device());
    uint8 maxPerks = isPrestigeActive(player) ? 2 : 3;
    uint8 totalPerks = 0;

    for (auto const& possiblePerk : tempPerks) {
        if (totalPerks >= maxPerks)
            break;

        if (!PerksManager::hasAlreadyPerkGroup(player, possiblePerk.spellId) && ((!PerksManager::IsSpellInPoll(player, possiblePerk.spellId) || !possiblePerk.isUnique) && !FoundSimilar(player, uuid, possiblePerk.spellId))
            && (!player->HasSpell(possiblePerk.spellId) || possiblePerk.isUnique) && (((possiblePerk.allowableClass & player->getClassMask()) != 0) || possiblePerk.allowableClass == -1)) {
            PerksManager::InsertOnePerk(player, uuid, possiblePerk.spellId, possiblePerk.isAura, 0);
            totalPerks++;
        }
    }

    if (isPrestigeActive(player)) {
        PerksManager::PerkPoll perkPoll = GetRandomPrestigeSpell(player);
        PerksManager::Perk perk = PerksManager::GetPerk(perkPoll.spellId);
        PerksManager::InsertOnePerk(player, uuid, perk.spellId, perk.isAura, 0);
    }
}

void PerksManager::OnLevelUp(Player* player, uint8 oldLevel)
{
    uint32 previousLevel = player->getLevel() - oldLevel;
    uint32 currentLevel = player->getLevel();
    if (previousLevel > 80)
        return;

    if (previousLevel > 1)
        for (size_t i = 0; i < previousLevel; i++)
        {
            if (i % 2 == 0) {
                boost::uuids::uuid uuid = boost::uuids::random_generator()();
                auto uuidString = boost::lexical_cast<std::string>(uuid);
                PerksManager::InsertNewPerksForLevelUp(player, uuidString);
            }
        }
    else
        if (currentLevel % 2 == 0) {
            boost::uuids::uuid uuid = boost::uuids::random_generator()();
            auto uuidString = boost::lexical_cast<std::string>(uuid);
            PerksManager::InsertNewPerksForLevelUp(player, uuidString);
        }

    ApplyPerkHeroClass(player);
}

void PerksManager::SetSelectPerk(Player* player, std::string UUID, uint32 spellId)
{
    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return;

    auto perk = std::find_if(
        CharacterPerks[player->GetGUID().GetCounter()].begin(),
        CharacterPerks[player->GetGUID().GetCounter()].end(),
        [UUID, spellId](const PerksManager::CharacterPerk& perk)
    { return perk.uuid == UUID && perk.inQueue && perk.spellId == spellId; });

    if (perk != CharacterPerks[player->GetGUID().GetCounter()].end()) {
        if (perk->isAura)
            player->AddAura(spellId, player);
        else
            player->learnSpell(spellId, false);
        perk->isChosen = true;
        CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
        CharacterDatabasePreparedStatement* insStmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHARACTER_PERK);
        insStmt->SetData(0, UUID);
        insStmt->SetData(1, spellId);
        trans->Append(insStmt);
        CharacterDatabase.CommitTransaction(trans);
    }

    for (auto perk = PerksManager::CharacterPerks[player->GetGUID().GetCounter()].begin(); perk != PerksManager::CharacterPerks[player->GetGUID().GetCounter()].end(); ++perk) {
        if (perk->uuid == UUID && perk->inQueue) {
            CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
            CharacterDatabasePreparedStatement* insStmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHARACTER_PERK_QUEUE);
            insStmt->SetData(0, UUID);
            insStmt->SetData(1, spellId);
            trans->Append(insStmt);
            CharacterDatabase.CommitTransaction(trans);
            perk->inQueue = false;
        }
    }
}

void PerksManager::OnChangeSpec(Player* player, uint8 specId)
{
    std::vector<PerksManager::CharacterPerk> characterFirstSpec = {};
    std::vector<PerksManager::CharacterPerk> characterSecondSpec = {};

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return;

    uint32 level = player->getLevel();
    float leftPerks = (level / 2) - GetCountPerks(player, specId);
    uint32 left = std::floor(leftPerks);

    for (auto const& playerPerk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (playerPerk.isChosen) {
            PerksManager::Perk perk = GetPerk(playerPerk.spellId);
            if (perk.isAura)
                player->RemoveAura(playerPerk.spellId);
            if (!perk.isAura)
                player->removeSpell(playerPerk.spellId, 0, player);
        }
    }

    ApplyAuraPerk(player);

    if (left > 0)
        ChatHandler(player->GetSession()).PSendSysMessage("|cff8FCE00You have %u perk(s) left(s) on this specialization.", left);

    for (size_t i = 0; i < left; i++)
    {
        boost::uuids::uuid uuid = boost::uuids::random_generator()();
        auto uuidString = boost::lexical_cast<std::string>(uuid);
        PerksManager::InsertNewPerksForLevelUp(player, uuidString);
    }
}

void PerksManager::OnCharDelete(ObjectGuid guid)
{
    CharacterDatabase.Query("DELETE FROM character_bonuses WHERE guid = {}", guid.GetCounter());
    CharacterDatabase.Query("DELETE FROM character_active_poll_perks WHERE guid = {}", guid.GetCounter());
    CharacterDatabase.Query("DELETE FROM character_modes WHERE guid = {}", guid.GetCounter());
}

void PerksManager::ApplyAuraPerk(Player* player)
{
    if (!player)
        return;

    uint32 level = GetPrestigeLevel(player);
    player->RemoveAura(1000006);
    for (size_t i = 0; i < level; i++)
        player->AddAura(1000006, player);

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return;

    std::vector<PerksManager::CharacterPerk> perks = PerksManager::CharacterPerks[player->GetGUID().GetCounter()];

    for (auto playerPerk : perks) {
        if (playerPerk.isChosen && (playerPerk.specId == player->GetActiveSpec())) {
            PerksManager::Perk perk = GetPerk(playerPerk.spellId);
            if (perk.isAura) {
                uint32 count = GetCountPerk(player, playerPerk.spellId, player->GetActiveSpec());
                uint32 auraCount = player->GetAuraCount(playerPerk.spellId);
                if (auraCount < count)
                    for (size_t i = 0; i < count; i++)
                        player->AddAura(playerPerk.spellId, player) ;
            }
            if (!perk.isAura && !player->HasSpell(playerPerk.spellId))
                player->learnSpell(playerPerk.spellId, player);
        }
    }
}

void PerksManager::ApplyPerkHeroClass(Player* player)
{
    if (!player)
        return;

    if (player->getLevel() < 80)
        return;

    if (player->getClass() == CLASS_DEATH_KNIGHT) {
        if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
            return;
        for (size_t i = 0; i < 26; i++)
        {
            boost::uuids::uuid uuid = boost::uuids::random_generator()();
            auto uuidString = boost::lexical_cast<std::string>(uuid);
            PerksManager::InsertNewPerksForLevelUp(player, uuidString);
        }
    }
}

void PerksManager::ResetCharacter(Player* player)
{
    if (!player)
        return;

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return;

    for (auto const& playerPerk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (playerPerk.isChosen) {
            PerksManager::Perk perk = GetPerk(playerPerk.spellId);
            if (perk.isAura)
                player->RemoveAura(playerPerk.spellId);
            if (!perk.isAura)
                player->removeSpell(playerPerk.spellId, 0, false);
        }
    }

    OnCharDelete(player->GetGUID());
    SavePollPerks(player);

    if (player->getClass() == CLASS_DEATH_KNIGHT) {
        player->removeSpell(50977, 0, false);
        player->SetLevel(55);
        player->DestroyItemCount(39208, 1, true);
    }
    else
        player->SetLevel(1);

    LevelUpPrestige(player);
    Gamemode::RemoveGamemode(player);
    ResetCharacterEquipment(player);
    player->resetTalents();
    player->ActivateSpec(0);
    player->SetPhaseMask(1, true);
    player->SetUInt32Value(PLAYER_XP, 0);
    PlayerInfo const* info = sObjectMgr->GetPlayerInfo(player->getRace(), player->getClass());
    player->TeleportTo(info->mapId, info->positionX, info->positionY, info->positionZ, info->orientation);
    player->resetSpells();
    player->ClearQuestStatus();
    CharacterPerks[player->GetGUID().GetCounter()].clear();
    // player->GetSession()->LogoutPlayer(true);
}


void PerksManager::SavePollPerks(Player* player)
{
    auto it = CharacterPerksPoll.find(player->GetGUID().GetCounter());
    if (it != CharacterPerksPoll.end()) {
        CharacterPerksPoll[player->GetGUID().GetCounter()].clear();
    }

    CharacterDatabase.Query("DELETE FROM character_active_poll_perks WHERE guid = {}", player->GetGUID().GetCounter());
    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
    CharacterDatabasePreparedStatement* stmt;

    for (auto perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (perk.isChosen) {
            stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHAR_PERK_POLL);
            stmt->SetData(0, player->GetGUID().GetCounter());
            stmt->SetData(1, perk.spellId);
            stmt->SetData(2, perk.specId);
            stmt->SetData(3, false);
            trans->Append(stmt);
            CharacterPerksPoll[player->GetGUID().GetCounter()].push_back({ perk.spellId, perk.specId, false });
        }
    }
    CharacterDatabase.CommitTransaction(trans);
}

bool PerksManager::isPrestigeActive(Player* player)
{
    if (!player)
        return false;

    auto it = CharacterPerksPoll.find(player->GetGUID().GetCounter());
    if (it != CharacterPerksPoll.end()) {
        uint32 count = std::count(it->second.begin(), it->second.end(), player->GetActiveSpec());
        if (count > 0)
            return true;
    }

    return false;
}

bool PerksManager::FoundSimilar(Player* player, std::string uuid, uint32 spellId)
{

    auto perk = std::find_if(
        CharacterPerks[player->GetGUID().GetCounter()].begin(),
        CharacterPerks[player->GetGUID().GetCounter()].end(),
        [uuid, spellId](const PerksManager::CharacterPerk& perk)
    { return perk.uuid == uuid && perk.spellId == spellId; });

    if (perk != CharacterPerks[player->GetGUID().GetCounter()].end())
        return true;

    return false;
}


uint32 PerksManager::GetPrestigeLevel(Player* player)
{
    if (!player)
        return 0;

    auto it = CharacterPrestige.find(player->GetSession()->GetAccountId());
    if (it != CharacterPrestige.end())
        return it->second;

    return 0;
}

void PerksManager::LevelUpPrestige(Player* player)
{
    if (!player)
        return;
    uint32 level = 1;
    auto it = CharacterPrestige.find(player->GetSession()->GetAccountId());
    if (it != CharacterPrestige.end())
        level = (it->second + 1);

    CharacterPrestige[player->GetSession()->GetAccountId()] = level;
    CharacterDatabase.Query("REPLACE character_prestiges (accountId, level) VALUES ({}, {})", player->GetSession()->GetAccountId(), level);
}

void PerksManager::ResetCharacterEquipment(Player* player)
{
    for (uint8 i = EQUIPMENT_SLOT_START; i < EQUIPMENT_SLOT_END; i++) {
        if (Item* pItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, i)) {
            ItemPosCountVec sDest;
            InventoryResult msg = player->CanStoreItem(NULL_BAG, NULL_SLOT, sDest, pItem, false);
            if (msg == EQUIP_ERR_OK)
            {
                player->RemoveItem(INVENTORY_SLOT_BAG_0, i, true);
                player->StoreItem(sDest, pItem, true);
            }
        }
    }
}

PerksManager::PerkPoll PerksManager::GetRandomPrestigeSpell(Player* player)
{
    for (auto perk = std::begin(CharacterPerksPoll[player->GetGUID().GetCounter()]); perk != std::end(CharacterPerksPoll[player->GetGUID().GetCounter()]); ++perk) {
        if (perk->specId == player->GetActiveSpec() && !perk->isChosen) {
            perk->isChosen = true;
            CharacterDatabase.Query("UPDATE character_active_poll_perks SET isChosen = 1 WHERE guid = {} and spellId = {} LIMIT 1", player->GetGUID().GetCounter(), perk->spellId);
            return { perk->spellId, perk->specId, perk->isChosen };
        }
    }
    return {};
}

uint32 PerksManager::GetCountPerks(Player* player, uint8 specId)
{
    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return 0;

    std::vector<PerksManager::CharacterPerk> lastestPerks = {};

    for (auto perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        auto it = std::find_if(lastestPerks.begin(),
            lastestPerks.end(),
            [&cm = perk]
        (PerksManager::CharacterPerk& m) -> bool { return cm.uuid == m.uuid; });
        if (perk.specId == specId && it == lastestPerks.end())
            lastestPerks.push_back(perk);
    }

    return lastestPerks.size();
}

uint32 PerksManager::GetCountPerk(Player* player, uint32 spellId, uint8 specId)
{

    uint32 count = 0;
    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return count;

    std::vector<PerksManager::CharacterPerk> lastestPerks = {};

    for (auto perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (perk.specId == specId && perk.spellId == spellId && perk.isChosen) {
            count++;
        }
    }

    return count;
}

void PerksManager::InsertOnePerk(Player* player, std::string uuid, uint32 spellId, bool isAura, uint8 isDefault)
{
    PerksManager::CharacterPerks[player->GetGUID().GetCounter()].insert(PerksManager::CharacterPerks[player->GetGUID().GetCounter()].begin(), { uuid, spellId, true, 0, isAura, false, player->GetActiveSpec(), isDefault == 1 ? true : false });
    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
    CharacterDatabasePreparedStatement* insStmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_PERK);
    insStmt->SetData(0, uuid);
    insStmt->SetData(1, player->GetGUID().GetCounter());
    insStmt->SetData(2, spellId);
    insStmt->SetData(3, 1);
    insStmt->SetData(4, 0);
    insStmt->SetData(5, isAura ? 1 : 0);
    insStmt->SetData(6, player->GetActiveSpec());
    insStmt->SetData(7, 0);
    insStmt->SetData(8, isDefault);
    trans->Append(insStmt);
    CharacterDatabase.CommitTransaction(trans);
}


std::vector<PerksManager::CharacterPerk> PerksManager::GetLastestPerk(Player* player, uint8 category)
{
    std::vector<PerksManager::CharacterPerk> lastestPerks = {};

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return lastestPerks;

    std::string lastestUuid = "";
    for (auto perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (perk.inQueue && perk.specId == player->GetActiveSpec()) {
            if (lastestUuid.length() == 0)
                lastestUuid = perk.uuid;

            // On push toute les perks qui ont le même lastest UUID
            if (perk.uuid == lastestUuid)
                lastestPerks.push_back(perk);
        }
    }
    return lastestPerks;
}


std::vector<PerksManager::CharacterPerk> PerksManager::GetPlayerPerks(Player* player)
{
    std::vector<PerksManager::CharacterPerk> playerPerks = {};

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return playerPerks;

    for (auto perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()])
        if (perk.isChosen)
            playerPerks.push_back(perk);

    return playerPerks;
}

std::vector<PerksManager::CharacterPerk> PerksManager::GetPendingPlayerPerks(Player* player)
{
    std::vector<PerksManager::CharacterPerk> playerPerks = {};

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return playerPerks;

    for (auto& perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()])
        if (perk.inQueue) {
            playerPerks.push_back(perk);
        }

    return playerPerks;
}

std::vector<PerksManager::PerkPoll> PerksManager::GetLastPlayersPerks(Player* player)
{
    std::vector<PerksManager::PerkPoll> poll = {};

    for (auto& perk : PerksManager::CharacterPerksPoll[player->GetGUID().GetCounter()])
        if (perk.specId == player->GetActiveSpec())
            poll.push_back(perk);

    return poll;
}

bool PerksManager::hasAlreadyPerkGroup(Player* player, uint32 spellId)
{
    PerksManager::Perk perk = PerksManager::GetPerk(spellId);

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return false;

    uint32 groupId = perk.groupId;
    for (auto& perk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        PerksManager::Perk perkToFind = PerksManager::GetPerk(perk.spellId);
        if (perkToFind.groupId == groupId && groupId != -1 && perk.specId == player->GetActiveSpec())
            return true;
    }

    for (auto& perk : PerksManager::CharacterPerksPoll[player->GetGUID().GetCounter()]) {
        PerksManager::Perk perkToFind = PerksManager::GetPerk(perk.spellId);
        if (perkToFind.groupId == groupId && groupId != -1 && perk.specId == player->GetActiveSpec())
            return true;
    }

    return false;
}

bool PerksManager::IsSpellInPoll(Player* player, uint32 spellId)
{
    std::vector<PerksManager::CharacterPerk> pendingPerks = PerksManager::GetPendingPlayerPerks(player);

    if (PerksManager::CharacterPerks.find(player->GetGUID().GetCounter()) == PerksManager::CharacterPerks.end())
        return false;

    for (auto const& playerPerk : PerksManager::CharacterPerks[player->GetGUID().GetCounter()]) {
        if (spellId == playerPerk.spellId && playerPerk.specId == player->GetActiveSpec())
            return true;
    }

    for (auto const& playerPerk : PerksManager::CharacterPerksPoll[player->GetGUID().GetCounter()]) {
        if (spellId == playerPerk.spellId && playerPerk.specId == player->GetActiveSpec())
            return true;
    }

    return false;
}

PerksManager::Perk PerksManager::GetPerk(uint32 spellId)
{
    PerksManager::Perk perk;
    auto it = PerksManager::Perks.find(spellId);
    if (it != PerksManager::Perks.end()) {
        perk = it->second;
    }
    return perk;
}
