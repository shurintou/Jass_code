
//===========================================================================
// Trigger: 未命名触发器 255
//===========================================================================
function Trig_255_Actions takes nothing returns nothing
    call AdjustPlayerStateBJ( 1, Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_GOLD )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 12, ( I2S(GetPlayerState(Player(PLAYER_NEUTRAL_PASSIVE), PLAYER_STATE_RESOURCE_GOLD)) + "秒" ) )
endfunction

//===========================================================================
function InitTrig_255 takes nothing returns nothing
    set gg_trg_255 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_255, 1.00 )
    call TriggerAddAction( gg_trg_255, function Trig_255_Actions )
endfunction
