
//===========================================================================
// Trigger: 未命名触发器 215
//===========================================================================
function Trig_215_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[7], "TRIGSTR_3852" )
    call EnableTrigger( gg_trg_214 )
endfunction

//===========================================================================
function InitTrig_215 takes nothing returns nothing
    set gg_trg_215 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_215, Player(7), "-ms", true )
    call TriggerAddAction( gg_trg_215, function Trig_215_Actions )
endfunction
