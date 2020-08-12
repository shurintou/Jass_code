
//===========================================================================
// Trigger: 未命名触发器 229
//===========================================================================
function Trig_229_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[4], ( "|cfffeba0e你现在杀死的单位数为" + ( I2S(GetPlayerScore(Player(4), PLAYER_SCORE_UNITS_KILLED)) + "|r" ) ) )
    call DisplayTimedTextToForce( bj_FORCE_PLAYER[4], 30, ( "|cffff0303你现在杀死的英雄数量为" + ( I2S(GetPlayerScore(Player(4), PLAYER_SCORE_HEROES_KILLED)) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_229 takes nothing returns nothing
    set gg_trg_229 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_229, Player(4), "-kill", true )
    call TriggerAddAction( gg_trg_229, function Trig_229_Actions )
endfunction
