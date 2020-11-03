
//===========================================================================
// Trigger: 未命名触发器 083
//===========================================================================
function Trig_083_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A058' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == 'H007' ) ) then
        return false
    endif
    return true
endfunction

function Trig_083_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl" )
    call AddSpecialEffectLocBJ( GetSpellTargetLoc(), "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl" )
    call SetUnitPositionLoc( GetSpellAbilityUnit(), GetSpellTargetLoc() )
endfunction

//===========================================================================
function InitTrig_083 takes nothing returns nothing
    set gg_trg_083 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_083, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_083, Condition( function Trig_083_Conditions ) )
    call TriggerAddAction( gg_trg_083, function Trig_083_Actions )
endfunction
