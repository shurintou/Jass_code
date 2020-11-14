
//===========================================================================
// Trigger: 未命名触发器 226
//===========================================================================
function Trig_226_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[3], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(3), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_226 takes nothing returns nothing
    set gg_trg_226 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_226, Player(3), "-to", true )
    call TriggerAddAction( gg_trg_226, function Trig_226_Actions )
endfunction
