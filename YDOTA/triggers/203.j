
//===========================================================================
// Trigger: 未命名触发器 203
//===========================================================================
function Trig_203_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[1], "TRIGSTR_3846" )
    call EnableTrigger( gg_trg_202 )
endfunction

//===========================================================================
function InitTrig_203 takes nothing returns nothing
    set gg_trg_203 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_203, Player(1), "-ms", true )
    call TriggerAddAction( gg_trg_203, function Trig_203_Actions )
endfunction
