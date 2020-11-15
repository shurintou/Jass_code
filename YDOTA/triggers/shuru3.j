
//===========================================================================
// Trigger: shuru3
//===========================================================================
function Trig_shuru3_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3864" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3865" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3866" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3867" )
endfunction

//===========================================================================
function InitTrig_shuru3 takes nothing returns nothing
    set gg_trg_shuru3 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shuru3, 360.00 )
    call TriggerAddAction( gg_trg_shuru3, function Trig_shuru3_Actions )
endfunction
