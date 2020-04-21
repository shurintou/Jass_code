
//===========================================================================
// Trigger: 未命名触发器 079
//===========================================================================
function Trig_079_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_078 )
    call DisableTrigger( gg_trg_081 )
endfunction

//===========================================================================
function InitTrig_079 takes nothing returns nothing
    set gg_trg_079 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_079, Player(0), "-stop", true )
    call TriggerAddAction( gg_trg_079, function Trig_079_Actions )
endfunction
