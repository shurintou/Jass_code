
//===========================================================================
// Trigger: 未命名触发器 227
//===========================================================================
function Trig_227_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[3], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(3), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[3], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(3), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_227 takes nothing returns nothing
    set gg_trg_227 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_227, Player(3), "-kill", true )
    call TriggerAddAction( gg_trg_227, function Trig_227_Actions )
endfunction
