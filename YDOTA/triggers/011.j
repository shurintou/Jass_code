
//===========================================================================
// Trigger: 未命名触发器 011
//===========================================================================
function Trig_011_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_shili1deyanshen )
    call EnableTrigger( gg_trg_shili2deyanshen )
endfunction

//===========================================================================
function InitTrig_011 takes nothing returns nothing
    set gg_trg_011 = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_011, 100.00 )
    call TriggerAddAction( gg_trg_011, function Trig_011_Actions )
endfunction
