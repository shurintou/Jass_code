
//===========================================================================
// Trigger: wtfd
//===========================================================================
function Trig_wtfd_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_wtfdown )
endfunction

//===========================================================================
function InitTrig_wtfd takes nothing returns nothing
    set gg_trg_wtfd = CreateTrigger(  )
    call DisableTrigger( gg_trg_wtfd )
    call TriggerRegisterPlayerEventEndCinematic( gg_trg_wtfd, Player(0) )
    call TriggerAddAction( gg_trg_wtfd, function Trig_wtfd_Actions )
endfunction
