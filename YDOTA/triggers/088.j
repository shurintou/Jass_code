
//===========================================================================
// Trigger: 未命名触发器 088
//===========================================================================
function Trig_088_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(0) )
endfunction

//===========================================================================
function InitTrig_088 takes nothing returns nothing
    set gg_trg_088 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_088, Player(0) )
    call TriggerAddAction( gg_trg_088, function Trig_088_Actions )
endfunction
