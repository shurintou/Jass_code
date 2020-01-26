
//===========================================================================
// Trigger: 未命名触发器 217
//===========================================================================
function Trig_217_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[8], "TRIGSTR_3853" )
    call EnableTrigger( gg_trg_216 )
endfunction

//===========================================================================
function InitTrig_217 takes nothing returns nothing
    set gg_trg_217 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_217, Player(8), "-ms", true )
    call TriggerAddAction( gg_trg_217, function Trig_217_Actions )
endfunction
