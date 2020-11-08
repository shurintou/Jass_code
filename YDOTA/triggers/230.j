
//===========================================================================
// Trigger: 未命名触发器 230
//===========================================================================
function Trig_230_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[5], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(5), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_230 takes nothing returns nothing
    set gg_trg_230 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_230, Player(5), "-to", true )
    call TriggerAddAction( gg_trg_230, function Trig_230_Actions )
endfunction
