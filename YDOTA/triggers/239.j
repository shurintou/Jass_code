
//===========================================================================
// Trigger: 未命名触发器 239
//===========================================================================
function Trig_239_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[9], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(9), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[9], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(9), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_239 takes nothing returns nothing
    set gg_trg_239 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_239, Player(9), "-kill", true )
    call TriggerAddAction( gg_trg_239, function Trig_239_Actions )
endfunction
