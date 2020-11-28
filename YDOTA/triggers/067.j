
//===========================================================================
// Trigger: 未命名触发器 067
//===========================================================================
function Trig_067_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cfffeba0e" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_067 takes nothing returns nothing
    set gg_trg_067 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_067, Player(5) )
    call TriggerAddAction( gg_trg_067, function Trig_067_Actions )
endfunction
