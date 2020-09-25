
//===========================================================================
// Trigger: Used Spell
//
// 这个是完全原创的技能，如果想应用到实际地图中，请去掉所有的特效动作，否则可能引起游戏后期一步一卡。]
// --------------
// Zenshin原创
//===========================================================================
function Trig_Used_Spell_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0C4' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Used_Spell_Actions takes nothing returns nothing
    set udg_Chongci_Unit[1] = GetSpellAbilityUnit()
    set udg_ChongCi_Point = GetSpellTargetLoc()
    call ShowUnitHide( udg_Chongci_Unit[1] )
    call CreateNUnitsAtLocFacingLocBJ( 1, 'u00V', GetOwningPlayer(udg_Chongci_Unit[1]), GetUnitLoc(udg_Chongci_Unit[1]), udg_ChongCi_Point )
    set udg_Chongci_Unit[2] = GetLastCreatedUnit()
    set udg_Chongci_Jiaodu = GetUnitFacing(udg_Chongci_Unit[2])
    call EnableTrigger( gg_trg_ChongCi_Spell )
endfunction

//===========================================================================
function InitTrig_Used_Spell takes nothing returns nothing
    set gg_trg_Used_Spell = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Used_Spell, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Used_Spell, Condition( function Trig_Used_Spell_Conditions ) )
    call TriggerAddAction( gg_trg_Used_Spell, function Trig_Used_Spell_Actions )
endfunction
