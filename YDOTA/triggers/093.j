
//===========================================================================
// Trigger: 未命名触发器 093
//===========================================================================
function Trig_093_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(6) )
endfunction

//===========================================================================
function InitTrig_093 takes nothing returns nothing
    set gg_trg_093 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_093, Player(6) )
    call TriggerAddAction( gg_trg_093, function Trig_093_Actions )
endfunction
