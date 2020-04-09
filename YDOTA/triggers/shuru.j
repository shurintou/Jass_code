
//===========================================================================
// Trigger: shuru
//===========================================================================
function Trig_shuru_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_shuru3 )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3855" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3856" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3857" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30.00, "TRIGSTR_3858" )
endfunction

//===========================================================================
function InitTrig_shuru takes nothing returns nothing
    set gg_trg_shuru = CreateTrigger(  )
    call TriggerAddAction( gg_trg_shuru, function Trig_shuru_Actions )
endfunction
