
//===========================================================================
// Trigger: 未命名触发器 015
//===========================================================================
function Trig_015_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_828" )
    call CustomDefeatBJ( Player(11), "TRIGSTR_566" )
    call CustomDefeatBJ( Player(9), "TRIGSTR_812" )
    call CustomDefeatBJ( Player(8), "TRIGSTR_813" )
    call CustomDefeatBJ( Player(7), "TRIGSTR_814" )
    call CustomDefeatBJ( Player(6), "TRIGSTR_815" )
    call CustomDefeatBJ( Player(5), "TRIGSTR_816" )
    call CustomVictoryBJ( Player(10), true, true )
    call CustomVictoryBJ( Player(0), true, true )
    call CustomVictoryBJ( Player(1), true, true )
    call CustomVictoryBJ( Player(2), true, true )
    call CustomVictoryBJ( Player(3), true, true )
    call CustomVictoryBJ( Player(4), true, true )
endfunction

//===========================================================================
function InitTrig_015 takes nothing returns nothing
    set gg_trg_015 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_015, gg_unit_nshr_0152, EVENT_UNIT_DEATH )
    call TriggerAddAction( gg_trg_015, function Trig_015_Actions )
endfunction
