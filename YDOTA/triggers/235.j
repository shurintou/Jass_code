
//===========================================================================
// Trigger: 未命名触发器 235
//===========================================================================
function Trig_235_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[7], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(7), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[7], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(7), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_235 takes nothing returns nothing
    set gg_trg_235 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_235, Player(7), "-kill", true )
    call TriggerAddAction( gg_trg_235, function Trig_235_Actions )
endfunction
