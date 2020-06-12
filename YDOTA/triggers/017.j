
//===========================================================================
// Trigger: 未命名触发器 017
//===========================================================================
function Trig_017_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( 1, Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_LUMBER )
    call AdjustPlayerStateBJ( -60, Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_GOLD )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 12, ( I2S(GetPlayerState(Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_GOLD)) + "秒" ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 12, ( I2S(GetPlayerState(Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_LUMBER)) + "分" ) )
endfunction

//===========================================================================
function InitTrig_017 takes nothing returns nothing
    set gg_trg_017 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_017, 60.00 )
    call TriggerAddAction( gg_trg_017, function Trig_017_Actions )
endfunction
