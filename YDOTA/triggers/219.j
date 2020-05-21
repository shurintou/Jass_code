
//===========================================================================
// Trigger: 未命名触发器 219
//===========================================================================
function Trig_219_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[9], "TRIGSTR_3854" )
    call EnableTrigger( gg_trg_218 )
endfunction

//===========================================================================
function InitTrig_219 takes nothing returns nothing
    set gg_trg_219 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_219, Player(9), "-ms", true )
    call TriggerAddAction( gg_trg_219, function Trig_219_Actions )
endfunction
