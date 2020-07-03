
//===========================================================================
// Trigger: 未命名触发器 081
//===========================================================================
function Trig_081_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_1943" )
endfunction

//===========================================================================
function InitTrig_081 takes nothing returns nothing
    set gg_trg_081 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_081, 300.00 )
    call TriggerAddAction( gg_trg_081, function Trig_081_Actions )
endfunction
