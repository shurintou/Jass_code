
//===========================================================================
// Trigger: 未命名触发器 096
//===========================================================================
function Trig_096_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(3) )
endfunction

//===========================================================================
function InitTrig_096 takes nothing returns nothing
    set gg_trg_096 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_096, Player(3) )
    call TriggerAddAction( gg_trg_096, function Trig_096_Actions )
endfunction
