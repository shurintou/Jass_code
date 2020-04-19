
//===========================================================================
// Trigger: 未命名触发器 065
//===========================================================================
function Trig_065_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffd55bb0" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_065 takes nothing returns nothing
    set gg_trg_065 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_065, Player(7) )
    call TriggerAddAction( gg_trg_065, function Trig_065_Actions )
endfunction
