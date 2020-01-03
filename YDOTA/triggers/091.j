
//===========================================================================
// Trigger: 未命名触发器 091
//===========================================================================
function Trig_091_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(1) )
endfunction

//===========================================================================
function InitTrig_091 takes nothing returns nothing
    set gg_trg_091 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_091, Player(1) )
    call TriggerAddAction( gg_trg_091, function Trig_091_Actions )
endfunction
