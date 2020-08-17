
//===========================================================================
// Trigger: 未命名触发器 066
//===========================================================================
function Trig_066_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff20c000" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_066 takes nothing returns nothing
    set gg_trg_066 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_066, Player(6) )
    call TriggerAddAction( gg_trg_066, function Trig_066_Actions )
endfunction
