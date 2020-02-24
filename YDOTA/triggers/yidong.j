
//===========================================================================
// Trigger: yidong
//===========================================================================
function Trig_yidong_Actions takes nothing returns nothing
    call SetUnitPositionLocFacingBJ( udg_Niutou, PolarProjectionBJ(GetUnitLoc(udg_Niutou), 10.00, GetUnitFacing(udg_Niutou)), GetUnitFacing(udg_Niutou) )
    call TriggerSleepAction( 1.00 )
    call SetUnitPathing( udg_Niutou, true )
    call IssueImmediateOrder( udg_Niutou, "stomp" )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_yidong takes nothing returns nothing
    set gg_trg_yidong = CreateTrigger(  )
    call DisableTrigger( gg_trg_yidong )
    call TriggerRegisterTimerEventPeriodic( gg_trg_yidong, 0.01 )
    call TriggerAddAction( gg_trg_yidong, function Trig_yidong_Actions )
endfunction
