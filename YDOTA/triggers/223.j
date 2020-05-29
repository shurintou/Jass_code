
//===========================================================================
// Trigger: 未命名触发器 223
//===========================================================================
function Trig_223_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[1], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(1), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[1], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(1), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_223 takes nothing returns nothing
    set gg_trg_223 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_223, Player(1), "-kill", true )
    call TriggerAddAction( gg_trg_223, function Trig_223_Actions )
endfunction
