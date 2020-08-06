
//===========================================================================
// Trigger: 未命名触发器 220
//===========================================================================
function Trig_220_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[0], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(0), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_220 takes nothing returns nothing
    set gg_trg_220 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_220, Player(0), "-to", true )
    call TriggerAddAction( gg_trg_220, function Trig_220_Actions )
endfunction
