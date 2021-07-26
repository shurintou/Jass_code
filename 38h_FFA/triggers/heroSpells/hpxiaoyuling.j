
//===========================================================================
// Trigger: hpxiaoyuling
//===========================================================================
function Trig_hpxiaoyuling_Actions takes nothing returns nothing
call EnableTrigger( gg_trg_hpdayuhundred )
endfunction

//===========================================================================
function InitTrig_hpxiaoyuling takes nothing returns nothing
    set gg_trg_hpxiaoyuling = CreateTrigger(  )
    call TriggerAddAction( gg_trg_hpxiaoyuling, function Trig_hpxiaoyuling_Actions )
endfunction
