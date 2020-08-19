
//===========================================================================
// Trigger: 未命名触发器 236
//===========================================================================
function Trig_236_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[8], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(8), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_236 takes nothing returns nothing
    set gg_trg_236 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_236, Player(8), "-to", true )
    call TriggerAddAction( gg_trg_236, function Trig_236_Actions )
endfunction
