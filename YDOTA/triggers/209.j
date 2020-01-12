
//===========================================================================
// Trigger: 未命名触发器 209
//===========================================================================
function Trig_209_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[4], "TRIGSTR_3849" )
    call EnableTrigger( gg_trg_208 )
endfunction

//===========================================================================
function InitTrig_209 takes nothing returns nothing
    set gg_trg_209 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_209, Player(4), "-ms", true )
    call TriggerAddAction( gg_trg_209, function Trig_209_Actions )
endfunction
