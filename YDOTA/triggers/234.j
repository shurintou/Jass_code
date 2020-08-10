
//===========================================================================
// Trigger: 未命名触发器 234
//===========================================================================
function Trig_234_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[7], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(7), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_234 takes nothing returns nothing
    set gg_trg_234 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_234, Player(7), "-to", true )
    call TriggerAddAction( gg_trg_234, function Trig_234_Actions )
endfunction
