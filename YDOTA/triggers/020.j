
//===========================================================================
// Trigger: 未命名触发器 020
//===========================================================================
function Trig_020_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( 15, Player(1), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(0), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(2), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(3), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(5), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(4), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(6), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(7), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(9), PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ( 15, Player(8), PLAYER_STATE_RESOURCE_GOLD )
endfunction

//===========================================================================
function InitTrig_020 takes nothing returns nothing
    set gg_trg_020 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_020, 10.00 )
    call TriggerAddAction( gg_trg_020, function Trig_020_Actions )
endfunction
