
//===========================================================================
// Trigger: 未命名触发器 101
//===========================================================================
function Trig_101_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_101_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellTargetUnit()), "Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualCaster.mdl" )
    call AddLightningLoc( "MBUR", GetUnitLoc(GetSpellAbilityUnit()), GetUnitLoc(GetSpellTargetUnit()) )
    call TerrainDeformationCraterBJ( 1.50, false, GetUnitLoc(GetSpellTargetUnit()), 512, 80.00 )
    set udg_shandianguangxiao = GetLastCreatedLightningBJ()
    set udg_guangzinengliangtexiao = GetLastCreatedEffectBJ()
    call PolledWait( 5.00 )
    call DestroyEffect( udg_guangzinengliangtexiao )
    call DestroyLightning( udg_shandianguangxiao )
endfunction

//===========================================================================
function InitTrig_101 takes nothing returns nothing
    set gg_trg_101 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_101, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_101, Condition( function Trig_101_Conditions ) )
    call TriggerAddAction( gg_trg_101, function Trig_101_Actions )
endfunction
