
//===========================================================================
// Trigger: 未命名触发器 222
//===========================================================================
function Trig_222_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[1], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(1), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_222 takes nothing returns nothing
    set gg_trg_222 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_222, Player(1), "-to", true )
    call TriggerAddAction( gg_trg_222, function Trig_222_Actions )
endfunction
