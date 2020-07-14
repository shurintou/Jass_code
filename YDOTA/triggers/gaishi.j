
//===========================================================================
// Trigger: gaishi
//===========================================================================
function Trig_gaishi_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_gaishi_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Doodads\\Cinematic\\IllidanVictoryCinematic\\IllidanVictoryCinematic.mdl" )
    set udg_gaishichuanxincitexiao = GetLastCreatedEffectBJ()
    call TriggerSleepAction( 1.00 )
    call DestroyEffect( udg_gaishichuanxincitexiao )
    call TerrainDeformationWaveBJ( 2.00, GetUnitLoc(GetSpellAbilityUnit()), GetUnitLoc(GetSpellTargetUnit()), 265.00, 105.00, 2.50 )
endfunction

//===========================================================================
function InitTrig_gaishi takes nothing returns nothing
    set gg_trg_gaishi = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_gaishi, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_gaishi, Condition( function Trig_gaishi_Conditions ) )
    call TriggerAddAction( gg_trg_gaishi, function Trig_gaishi_Actions )
endfunction
