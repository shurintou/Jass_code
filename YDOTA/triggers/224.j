
//===========================================================================
// Trigger: 未命名触发器 224
//===========================================================================
function Trig_224_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[2], ( "|cff0042ff你现在的总分为" + ( I2S(GetPlayerScore(Player(2), PLAYER_SCORE_TOTAL)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_224 takes nothing returns nothing
    set gg_trg_224 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_224, Player(2), "-to", true )
    call TriggerAddAction( gg_trg_224, function Trig_224_Actions )
endfunction
