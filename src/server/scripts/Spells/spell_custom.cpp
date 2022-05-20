#include "Battlefield.h"
#include "BattlefieldMgr.h"
#include "Battleground.h"
#include "BattlegroundMgr.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Chat.h"
#include "GameTime.h"
#include "GridNotifiers.h"
#include "Group.h"
#include "InstanceScript.h"
#include "Pet.h"
#include "ReputationMgr.h"
#include "ScriptMgr.h"
#include "SkillDiscovery.h"
#include "SpellAuraEffects.h"
#include "SpellScript.h"
#include "Unit.h"
#include "Vehicle.h"
#include <array>


std::vector<uint32> spells = { 12294, 12809, 6343, 12292, 12975, 17962, 20473, 3674, 53301, 53209, 49206, 33831, 48505, 5217, 19574, 3045, 11129, 12472, 12042, 12043, 31661, 60103, 51505,
            51505, 13877, 51713, 51690, 49016, 49222, 51052, 31884, 17116, 740, 47241, 50796, 46968, 1680, 8092, 47540 };

class spell_reset_cooldown_mortal_strike : public SpellScript
{
    PrepareSpellScript(spell_reset_cooldown_mortal_strike);

    bool Load() override
    {
        return GetCaster()->GetTypeId() == TYPEID_PLAYER;
    }

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo({ 12294 });
    }

    void HandleScript(SpellEffIndex /*effIndex*/)
    {
        Player* caster = GetCaster()->ToPlayer();
        if (caster->HasSpellCooldown(12294)) {
            caster->GetGlobalCooldownMgr().CancelGlobalCooldown(sSpellMgr->GetSpellInfo(12294));
            caster->RemoveSpellCooldown(12294, true);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_reset_cooldown_mortal_strike::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};


void AddSC_generic_spell_custom()
{
    RegisterSpellScript(spell_reset_cooldown_mortal_strike);
}
