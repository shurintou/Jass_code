
//===========================================================================
// Trigger: 未命名触发器 097
//===========================================================================
function Trig_097_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(9) )
endfunction

//===========================================================================
function InitTrig_097 takes nothing returns nothing
    set gg_trg_097 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_097, Player(9) )
    call TriggerAddAction( gg_trg_097, function Trig_097_Actions )
endfunction
