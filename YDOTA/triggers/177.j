
//===========================================================================
// Trigger: 未命名触发器 177
//===========================================================================
function Trig_177_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3332" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3965" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3966" )
    call DisableTrigger( gg_trg_shili1 )
    call DisableTrigger( gg_trg_shili2 )
    call DisableTrigger( gg_trg_shili1deyanshen )
    call DisableTrigger( gg_trg_shili2deyanshen )
    call DisableTrigger( gg_trg_shili1111 )
    call DisableTrigger( gg_trg_shili2222 )
    call EnableTrigger( gg_trg_shili22222222222222 )
    call EnableTrigger( gg_trg_shili11111111111111 )
endfunction

//===========================================================================
function InitTrig_177 takes nothing returns nothing
    set gg_trg_177 = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_177, 1200.00 )
    call TriggerAddAction( gg_trg_177, function Trig_177_Actions )
endfunction
