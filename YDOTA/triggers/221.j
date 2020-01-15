
//===========================================================================
// Trigger: 未命名触发器 221
//===========================================================================
function Trig_221_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[0], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(0), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[0], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(0), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_221 takes nothing returns nothing
    set gg_trg_221 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_221, Player(0), "-kill", true )
    call TriggerAddAction( gg_trg_221, function Trig_221_Actions )
endfunction
