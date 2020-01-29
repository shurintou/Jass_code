
//===========================================================================
// Trigger: 未命名触发器 237
//===========================================================================
function Trig_237_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[8], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(8), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[8], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(8), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_237 takes nothing returns nothing
    set gg_trg_237 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_237, Player(8), "-kill", true )
    call TriggerAddAction( gg_trg_237, function Trig_237_Actions )
endfunction
