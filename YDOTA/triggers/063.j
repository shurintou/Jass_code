
//===========================================================================
// Trigger: 未命名触发器 063
//===========================================================================
function Trig_063_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cffff0303" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_063 takes nothing returns nothing
    set gg_trg_063 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_063, Player(0) )
    call TriggerAddAction( gg_trg_063, function Trig_063_Actions )
endfunction
