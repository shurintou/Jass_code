
//===========================================================================
// Trigger: 未命名触发器 120
//===========================================================================
function Trig_120_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAllies(Player(11)), 15.00, "TRIGSTR_3147" )
endfunction

//===========================================================================
function InitTrig_120 takes nothing returns nothing
    set gg_trg_120 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_120, gg_unit_nshr_0152, EVENT_UNIT_ATTACKED )
    call TriggerAddAction( gg_trg_120, function Trig_120_Actions )
endfunction
