
//===========================================================================
// Trigger: 未命名触发器 092
//===========================================================================
function Trig_092_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(7) )
endfunction

//===========================================================================
function InitTrig_092 takes nothing returns nothing
    set gg_trg_092 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_092, Player(7) )
    call TriggerAddAction( gg_trg_092, function Trig_092_Actions )
endfunction
