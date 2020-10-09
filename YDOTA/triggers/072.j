
//===========================================================================
// Trigger: 未命名触发器 072
//===========================================================================
function Trig_072_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff7ebff1" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_072 takes nothing returns nothing
    set gg_trg_072 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_072, Player(9) )
    call TriggerAddAction( gg_trg_072, function Trig_072_Actions )
endfunction
