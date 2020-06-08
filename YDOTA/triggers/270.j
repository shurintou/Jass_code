
//===========================================================================
// Trigger: 未命名触发器 270
//===========================================================================
function Trig_270_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(2), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_270 takes nothing returns nothing
    set gg_trg_270 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_270, Player(2), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_270, function Trig_270_Actions )
endfunction
