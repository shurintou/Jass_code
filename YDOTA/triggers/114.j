
//===========================================================================
// Trigger: 未命名触发器 114
//===========================================================================
function Trig_114_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03Y' ) ) then
        return false
    endif
    return true
endfunction

function Trig_114_Actions takes nothing returns nothing
    set udg_heti = GetLastCreatedEffectBJ()
    call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl" )
    call TerrainDeformationRippleBJ( 4, true, GetUnitLoc(GetSpellAbilityUnit()), 1024, 1024, 64, 1, 512 )
    call TriggerSleepAction( 2 )
    call DestroyEffect( udg_heti )
endfunction

//===========================================================================
function InitTrig_114 takes nothing returns nothing
    set gg_trg_114 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_114, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_114, Condition( function Trig_114_Conditions ) )
    call TriggerAddAction( gg_trg_114, function Trig_114_Actions )
endfunction
