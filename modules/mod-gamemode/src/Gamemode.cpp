#include "Gamemode.h"


std::map<ObjectGuid /*guid*/, uint32 /*level*/> Gamemode::PlayersMode = {};

void Gamemode::PreloadAllModesPlayers()
{
    QueryResult result = CharacterDatabase.Query("SELECT * FROM character_modes");
    if (result) {
        do
        {
            Field* fields = result->Fetch();
            ObjectGuid guid = ObjectGuid(fields[0].Get<uint64>());
            uint32 id = fields[1].Get<uint32>();
            Gamemode::PlayersMode.insert(std::make_pair(guid, id));
        } while (result->NextRow());
    }
    LOG_INFO("server.loading", "Loaded {} gamemode...", Gamemode::PlayersMode.size());
}

void Gamemode::SetGameMode(Player* player, uint32 gamemodeId)
{
    auto it = PlayersMode.find(player->GetGUID());
    if (it == PlayersMode.end()) {
        PlayersMode[player->GetGUID()] = gamemodeId;
    }
}

void Gamemode::OnDeath(Player* player, Player* killer)
{
    if (!player)
        return;

    uint32 modeId = GetGameMode(player->GetGUID());

    if (modeId == HARDCORE) {
        const char* variants[4] = { "annihilated", "assassinated", "blow away", "destroyed" };
        std::string level = std::to_string(player->getLevel());
        sWorld->SendWorldText(100100, player->GetName().c_str(), variants[urand(0, 3)], killer->GetName().c_str(), level.c_str());
    }
}

void Gamemode::RemoveGamemode(Player* player)
{
    auto it = PlayersMode.find(player->GetGUID());
    if (it != PlayersMode.end()) {
        PlayersMode.erase(it);
        CharacterDatabase.Query("DELETE FROM character_modes WHERE guid = {}", player->GetGUID().GetCounter());
    }
}

bool Gamemode::CanAddGroupPlayer(Player* player, Player* invitingPlayer)
{
    if (!player)
        return false;

    uint32 modeId = GetGameMode(player->GetGUID());
    uint32 modeId2 = GetGameMode(invitingPlayer->GetGUID());

    if (modeId == 0 || modeId2 == 0)
        return true;

    if (modeId2 == IRON_MAN || modeId == IRON_MAN)
        return false;

    if ((modeId2 == HARDCORE && modeId != HARDCORE) || (modeId == HARDCORE && modeId2 != HARDCORE))
        return false;

    return true;
}

bool Gamemode::CanSendMail(ObjectGuid receveirGuid)
{
    uint32 modeId = GetGameMode(receveirGuid);

    if (modeId == IRON_MAN)
        return false;

    return true;
}

void Gamemode::OnLevelUp(Player* player)
{
    if (!player)
        return;

    if (player->getLevel() < 80)
        return;

    uint32 modeId = GetGameMode(player->GetGUID());
    std::string mode = "";
    if (modeId == 0)
        return;

    switch (modeId)
    {
    case HARDCORE:
        mode = "Hardcore";
        break;
    case IRON_MAN:
        mode = "Iron man";
        break;
    case BLOOD_THIRSTY:
        mode = "Blood Thirsty";
        break;
    case CLASSIC:
        mode = "Classic";
        break;
    }

    QueryResult result = CharacterDatabase.Query("SELECT TIMESTAMPDIFF(SECOND, character_modes.createdAt, NOW()) as secondes FROM character_modes WHERE guid = {} LIMIT 1", player->GetGUID().GetCounter());
    if (!result)
        return;
    if (result) {
        do
        {
            Field* fields = result->Fetch();
            uint32 time = fields[0].Get<uint32>();
            time_t seconds(time);
            tm* p = gmtime(&seconds);
            std::ostringstream ss;
            ss << p->tm_yday << "days, " << p->tm_hour << "hours, " << p->tm_min <<  "minutes, " << p->tm_sec << "secondes.";
            sWorld->SendWorldText(100101, player->GetName().c_str(), mode.c_str(), ss.str().c_str());
        } while (result->NextRow());
    }
    RemoveGamemode(player);
}

bool Gamemode::CanJoinRDF(Player* player)
{
    uint32 modeId = GetGameMode(player->GetGUID());

    if (modeId == BLOOD_THIRSTY || modeId == IRON_MAN)
        return false;

    return true;
}

bool Gamemode::CanTrade(Player* player)
{
    uint32 modeId = GetGameMode(player->GetGUID());

    if (modeId == IRON_MAN)
        return false;

    return true;
}

bool Gamemode::CanAddQuest(ObjectGuid guid)
{
    uint32 modeId = GetGameMode(guid);

    if (modeId == BLOOD_THIRSTY)
        return false;

    return true;
}

uint32 Gamemode::GetGameMode(ObjectGuid guid)
{
    auto it = PlayersMode.find(guid);
    if (it != PlayersMode.end())
        return it->second;

    return 0;
}

