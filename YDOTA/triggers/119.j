
//===========================================================================
// Trigger: 未命名触发器 119
//===========================================================================
function Trig_119_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAllies(Player(10)), 15.00, "TRIGSTR_3146" )
endfunction

//===========================================================================
function InitTrig_119 takes nothing returns nothing
    set gg_trg_119 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_119, gg_unit_haro_0136, EVENT_UNIT_ATTACKED )
    call TriggerAddAction( gg_trg_119, function Trig_119_Actions )
endfunction
