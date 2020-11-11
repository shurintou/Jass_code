
//===========================================================================
// Trigger: shanghai 复制
//===========================================================================
function Trig_shanghai_u_Actions takes nothing returns nothing
    call CreateNUnitsAtLoc( 1, 'u00T', GetOwningPlayer(udg_Niutou), GetUnitLoc(udg_Niutou), bj_UNIT_FACING )
    call UnitApplyTimedLifeBJ( 3.00, 'BHwe', GetLastCreatedUnit() )
    call IssueImmediateOrder( GetLastCreatedUnit(), "stomp" )
    call TriggerSleepAction( 1.00 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_shanghai_u takes nothing returns nothing
    set gg_trg_shanghai_u = CreateTrigger(  )
    call DisableTrigger( gg_trg_shanghai_u )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shanghai_u, 0.05 )
    call TriggerAddAction( gg_trg_shanghai_u, function Trig_shanghai_u_Actions )
endfunction
