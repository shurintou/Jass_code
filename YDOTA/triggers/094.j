
//===========================================================================
// Trigger: 未命名触发器 094
//===========================================================================
function Trig_094_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(5) )
endfunction

//===========================================================================
function InitTrig_094 takes nothing returns nothing
    set gg_trg_094 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_094, Player(5) )
    call TriggerAddAction( gg_trg_094, function Trig_094_Actions )
endfunction
