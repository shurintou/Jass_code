
//===========================================================================
// Trigger: 未命名触发器 068
//===========================================================================
function Trig_068_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|c00fffc01" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_068 takes nothing returns nothing
    set gg_trg_068 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_068, Player(4) )
    call TriggerAddAction( gg_trg_068, function Trig_068_Actions )
endfunction
