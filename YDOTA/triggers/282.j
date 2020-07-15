
//===========================================================================
// Trigger: 未命名触发器 282
//===========================================================================
function Trig_282_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(9), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_282 takes nothing returns nothing
    set gg_trg_282 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_282, Player(9), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_282, function Trig_282_Actions )
endfunction
