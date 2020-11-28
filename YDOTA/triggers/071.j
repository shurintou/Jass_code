
//===========================================================================
// Trigger: 未命名触发器 071
//===========================================================================
function Trig_071_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, ( "|cff0042ff" + ( ( GetPlayerName(GetTriggerPlayer()) + "离开了游戏，他的单位将被队友共享。" ) + "|r" ) ) )
endfunction

//===========================================================================
function InitTrig_071 takes nothing returns nothing
    set gg_trg_071 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_071, Player(1) )
    call TriggerAddAction( gg_trg_071, function Trig_071_Actions )
endfunction
