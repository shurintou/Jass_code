
//===========================================================================
// Trigger: 未命名触发器 025
//===========================================================================
function Trig_025_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_811" )
endfunction

//===========================================================================
function InitTrig_025 takes nothing returns nothing
    set gg_trg_025 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_025, function Trig_025_Actions )
endfunction
