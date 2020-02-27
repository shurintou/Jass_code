
//===========================================================================
// Trigger: 未命名触发器 016
//===========================================================================
function Trig_016_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_829" )
    call CustomDefeatBJ( Player(10), "TRIGSTR_565" )
    call CustomDefeatBJ( Player(0), "TRIGSTR_818" )
    call CustomDefeatBJ( Player(1), "TRIGSTR_819" )
    call CustomDefeatBJ( Player(2), "TRIGSTR_820" )
    call CustomDefeatBJ( Player(3), "TRIGSTR_821" )
    call CustomDefeatBJ( Player(4), "TRIGSTR_822" )
    call CustomVictoryBJ( Player(11), true, true )
    call CustomVictoryBJ( Player(9), true, true )
    call CustomVictoryBJ( Player(8), true, true )
    call CustomVictoryBJ( Player(7), true, true )
    call CustomVictoryBJ( Player(6), true, true )
    call CustomVictoryBJ( Player(5), true, true )
endfunction

//===========================================================================
function InitTrig_016 takes nothing returns nothing
    set gg_trg_016 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_016, gg_unit_haro_0136, EVENT_UNIT_DEATH )
    call TriggerAddAction( gg_trg_016, function Trig_016_Actions )
endfunction
