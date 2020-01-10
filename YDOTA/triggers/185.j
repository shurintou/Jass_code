
//===========================================================================
// Trigger: 未命名触发器 185
//===========================================================================
function Trig_185_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3791" )
endfunction

//===========================================================================
function InitTrig_185 takes nothing returns nothing
    set gg_trg_185 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_185, 50.00 )
    call TriggerAddAction( gg_trg_185, function Trig_185_Actions )
endfunction
