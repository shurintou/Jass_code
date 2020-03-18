
//===========================================================================
// Trigger: 未命名触发器 123
//===========================================================================
function Trig_123_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3150" )
endfunction

//===========================================================================
function InitTrig_123 takes nothing returns nothing
    set gg_trg_123 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_123, 150.00 )
    call TriggerAddAction( gg_trg_123, function Trig_123_Actions )
endfunction
