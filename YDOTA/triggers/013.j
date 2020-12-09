
//===========================================================================
// Trigger: 未命名触发器 013
//===========================================================================
function Trig_013_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_810" )
endfunction

//===========================================================================
function InitTrig_013 takes nothing returns nothing
    set gg_trg_013 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_013, 300.00 )
    call TriggerAddAction( gg_trg_013, function Trig_013_Actions )
endfunction
