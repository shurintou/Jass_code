
//===========================================================================
// Trigger: 未命名触发器 233
//===========================================================================
function Trig_233_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[6], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(6), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[6], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(6), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_233 takes nothing returns nothing
    set gg_trg_233 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_233, Player(6), "-kill", true )
    call TriggerAddAction( gg_trg_233, function Trig_233_Actions )
endfunction
