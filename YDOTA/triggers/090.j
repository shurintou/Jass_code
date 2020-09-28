
//===========================================================================
// Trigger: 未命名触发器 090
//===========================================================================
function Trig_090_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(2) )
endfunction

//===========================================================================
function InitTrig_090 takes nothing returns nothing
    set gg_trg_090 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_090, Player(2) )
    call TriggerAddAction( gg_trg_090, function Trig_090_Actions )
endfunction
