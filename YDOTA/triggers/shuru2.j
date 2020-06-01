
//===========================================================================
// Trigger: shuru2
//===========================================================================
function Trig_shuru2_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_shuru3 )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3859" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3860" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3861" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3862" )
endfunction

//===========================================================================
function InitTrig_shuru2 takes nothing returns nothing
    set gg_trg_shuru2 = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_shuru2, 240.00 )
    call TriggerAddAction( gg_trg_shuru2, function Trig_shuru2_Actions )
endfunction
