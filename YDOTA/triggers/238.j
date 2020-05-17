
//===========================================================================
// Trigger: 未命名触发器 238
//===========================================================================
function Trig_238_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[9], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(9), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_238 takes nothing returns nothing
    set gg_trg_238 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_238, Player(9), "-to", true )
    call TriggerAddAction( gg_trg_238, function Trig_238_Actions )
endfunction
