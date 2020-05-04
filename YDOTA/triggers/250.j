
//===========================================================================
// Trigger: 未命名触发器 250
//===========================================================================
function Trig_250_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(0), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_250 takes nothing returns nothing
    set gg_trg_250 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_250, Player(0), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_250, function Trig_250_Actions )
endfunction
