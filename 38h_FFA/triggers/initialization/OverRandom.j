
//===========================================================================
// Trigger: OverRandom
//===========================================================================
function Trig_OverRandom_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_repick )
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, "TRIGSTR_7367" )
    call DestroyTrigger( gg_trg_Random1 )
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_OverRandom takes nothing returns nothing
    set gg_trg_OverRandom = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_OverRandom, 30.00 )
    call TriggerAddAction( gg_trg_OverRandom, function Trig_OverRandom_Actions )
endfunction
