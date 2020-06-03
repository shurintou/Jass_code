
//===========================================================================
// Trigger: 未命名触发器 205
//===========================================================================
function Trig_205_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[2], "TRIGSTR_3847" )
    call EnableTrigger( gg_trg_204 )
endfunction

//===========================================================================
function InitTrig_205 takes nothing returns nothing
    set gg_trg_205 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_205, Player(2), "-ms", true )
    call TriggerAddAction( gg_trg_205, function Trig_205_Actions )
endfunction
