
//===========================================================================
// Trigger: 未命名触发器 095
//===========================================================================
function Trig_095_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(4) )
endfunction

//===========================================================================
function InitTrig_095 takes nothing returns nothing
    set gg_trg_095 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_095, Player(4) )
    call TriggerAddAction( gg_trg_095, function Trig_095_Actions )
endfunction
