
//===========================================================================
// Trigger: 未命名触发器 228
//===========================================================================
function Trig_228_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[4], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(4), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_228 takes nothing returns nothing
    set gg_trg_228 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_228, Player(4), "-to", true )
    call TriggerAddAction( gg_trg_228, function Trig_228_Actions )
endfunction
