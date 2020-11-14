
//===========================================================================
// Trigger: 未命名触发器 213
//===========================================================================
function Trig_213_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[6], "TRIGSTR_3851" )
    call EnableTrigger( gg_trg_212 )
endfunction

//===========================================================================
function InitTrig_213 takes nothing returns nothing
    set gg_trg_213 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_213, Player(6), "-ms", true )
    call TriggerAddAction( gg_trg_213, function Trig_213_Actions )
endfunction
