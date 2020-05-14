
//===========================================================================
// Trigger: 未命名触发器 207
//===========================================================================
function Trig_207_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[3], "TRIGSTR_3848" )
    call EnableTrigger( gg_trg_206 )
endfunction

//===========================================================================
function InitTrig_207 takes nothing returns nothing
    set gg_trg_207 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_207, Player(3), "-ms", true )
    call TriggerAddAction( gg_trg_207, function Trig_207_Actions )
endfunction
