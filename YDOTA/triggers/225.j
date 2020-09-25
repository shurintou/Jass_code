
//===========================================================================
// Trigger: 未命名触发器 225
//===========================================================================
function Trig_225_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[2], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(2), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[2], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(2), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_225 takes nothing returns nothing
    set gg_trg_225 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_225, Player(2), "-kill", true )
    call TriggerAddAction( gg_trg_225, function Trig_225_Actions )
endfunction
