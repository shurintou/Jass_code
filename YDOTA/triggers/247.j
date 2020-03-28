
//===========================================================================
// Trigger: 未命名触发器 247
//===========================================================================
function Trig_247_Actions takes nothing returns nothing
    call TriggerSleepAction( 5.00 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_247 takes nothing returns nothing
    set gg_trg_247 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_247, function Trig_247_Actions )
endfunction
