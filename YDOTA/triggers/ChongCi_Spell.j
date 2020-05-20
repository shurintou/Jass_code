
//===========================================================================
// Trigger: ChongCi Spell
//===========================================================================
function Trig_ChongCi_Spell_Func002001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Func003001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Func004001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Func005001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Func006001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Func007001 takes nothing returns boolean
    return ( udg_Chongci_distance == 700.00 )
endfunction

function Trig_ChongCi_Spell_Actions takes nothing returns nothing
    call DestroyEffect( udg_Chongci_SE )
    if ( Trig_ChongCi_Spell_Func002001() ) then
        call ShowUnitShow( udg_Chongci_Unit[1] )
    else
        call DoNothing(  )
    endif
    if ( Trig_ChongCi_Spell_Func003001() ) then
        call SetUnitPositionLoc( udg_Chongci_Unit[1], GetUnitLoc(udg_Chongci_Unit[2]) )
    else
        call DoNothing(  )
    endif
    if ( Trig_ChongCi_Spell_Func004001() ) then
        call RemoveUnit( udg_Chongci_Unit[2] )
    else
        call DoNothing(  )
    endif
    if ( Trig_ChongCi_Spell_Func005001() ) then
        call DisableTrigger( GetTriggeringTrigger() )
    else
        call DoNothing(  )
    endif
    if ( Trig_ChongCi_Spell_Func006001() ) then
        set udg_Chongci_distance = 0.00
    else
        call DoNothing(  )
    endif
    if ( Trig_ChongCi_Spell_Func007001() ) then
        return
    else
        call DoNothing(  )
    endif
    call IssuePointOrderLoc( udg_Chongci_Unit[2], "move", PolarProjectionBJ(GetUnitLoc(udg_Chongci_Unit[2]), udg_Chongci_distance, udg_Chongci_Jiaodu) )
    set udg_Chongci_distance = ( udg_Chongci_distance + 50.00 )
    call CreateNUnitsAtLoc( 1, 'u00W', GetOwningPlayer(udg_Chongci_Unit[1]), GetUnitLoc(udg_Chongci_Unit[2]), udg_Chongci_Jiaodu )
    call UnitApplyTimedLifeBJ( 1.00, 'BTLF', GetLastCreatedUnit() )
    set udg_Chongci_SE = GetLastCreatedEffectBJ()
    call CreateNUnitsAtLoc( 1, 'u00X', GetOwningPlayer(udg_Chongci_Unit[1]), GetUnitLoc(udg_Chongci_Unit[2]), udg_Chongci_Jiaodu )
    call SetUnitAbilityLevelSwapped( 'A0C5', GetLastCreatedUnit(), GetUnitAbilityLevelSwapped('A0C4', udg_Chongci_Unit[1]) )
    call UnitApplyTimedLifeBJ( 1.00, 'BTLF', GetLastCreatedUnit() )
    call IssueImmediateOrder( GetLastCreatedUnit(), "thunderclap" )
endfunction

//===========================================================================
function InitTrig_ChongCi_Spell takes nothing returns nothing
    set gg_trg_ChongCi_Spell = CreateTrigger(  )
    call DisableTrigger( gg_trg_ChongCi_Spell )
    call TriggerRegisterTimerEventPeriodic( gg_trg_ChongCi_Spell, 0.25 )
    call TriggerAddAction( gg_trg_ChongCi_Spell, function Trig_ChongCi_Spell_Actions )
endfunction
