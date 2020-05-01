
//===========================================================================
// Trigger: 未命名触发器 069
//===========================================================================
function Trig_069_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff540081" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_069 takes nothing returns nothing
    set gg_trg_069 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_069, Player(3) )
    call TriggerAddAction( gg_trg_069, function Trig_069_Actions )
endfunction
