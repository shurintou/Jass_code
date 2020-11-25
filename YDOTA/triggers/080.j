
//===========================================================================
// Trigger: 未命名触发器 080
//===========================================================================
function Trig_080_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_078 )
    call EnableTrigger( gg_trg_081 )
endfunction

//===========================================================================
function InitTrig_080 takes nothing returns nothing
    set gg_trg_080 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_080, Player(0), "-start", true )
    call TriggerAddAction( gg_trg_080, function Trig_080_Actions )
endfunction
