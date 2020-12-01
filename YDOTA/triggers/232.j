
//===========================================================================
// Trigger: 未命名触发器 232
//===========================================================================
function Trig_232_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[6], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(6), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_232 takes nothing returns nothing
    set gg_trg_232 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_232, Player(6), "-to", true )
    call TriggerAddAction( gg_trg_232, function Trig_232_Actions )
endfunction
