
//===========================================================================
// Trigger: 未命名触发器 064
//===========================================================================
function Trig_064_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff959697" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_064 takes nothing returns nothing
    set gg_trg_064 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_064, Player(8) )
    call TriggerAddAction( gg_trg_064, function Trig_064_Actions )
endfunction
