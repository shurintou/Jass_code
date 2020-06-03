
//===========================================================================
// Trigger: 未命名触发器 231
//===========================================================================
function Trig_231_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[5], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(5), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[5], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(5), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_231 takes nothing returns nothing
    set gg_trg_231 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_231, Player(5), "-kill", true )
    call TriggerAddAction( gg_trg_231, function Trig_231_Actions )
endfunction
