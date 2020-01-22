
//===========================================================================
// Trigger: 未命名触发器 070
//===========================================================================
function Trig_070_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff1ce6b9" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_070 takes nothing returns nothing
    set gg_trg_070 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_070, Player(2) )
    call TriggerAddAction( gg_trg_070, function Trig_070_Actions )
endfunction
