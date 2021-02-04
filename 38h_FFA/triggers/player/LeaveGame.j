
//===========================================================================
// Trigger: LeaveGame
//===========================================================================
function Trig_LeaveGame_Actions takes nothing returns nothing
    local player p=GetTriggerPlayer()
    call ShareEverythingWithTeam( p )
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[GetConvertedPlayerId(p)]+GetPlayerName(p)+"|r离开了游戏，他的英雄和金钱将被队友共享" )
    call MultiboardDisplay( udg_BlackBoard, true )
    set p=null
endfunction

//===========================================================================
function InitTrig_LeaveGame takes nothing returns nothing
    set gg_trg_LeaveGame = CreateTrigger(  )
    call TriggerAddAction( gg_trg_LeaveGame, function Trig_LeaveGame_Actions )
endfunction
