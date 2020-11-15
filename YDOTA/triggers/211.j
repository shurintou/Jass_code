
//===========================================================================
// Trigger: 未命名触发器 211
//===========================================================================
function Trig_211_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[5], "TRIGSTR_3850" )
    call EnableTrigger( gg_trg_210 )
endfunction

//===========================================================================
function InitTrig_211 takes nothing returns nothing
    set gg_trg_211 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_211, Player(5), "-ms", true )
    call TriggerAddAction( gg_trg_211, function Trig_211_Actions )
endfunction
