
//===========================================================================
// Trigger: ms
//===========================================================================
function Trig_ms_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_ms takes nothing returns nothing
    set gg_trg_ms = CreateTrigger(  )
    call TriggerAddAction( gg_trg_ms, function Trig_ms_Actions )
endfunction
