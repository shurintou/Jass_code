
//===========================================================================
// Trigger: 未命名触发器 276
//===========================================================================
function Trig_276_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(6), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_276 takes nothing returns nothing
    set gg_trg_276 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_276, Player(6), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_276, function Trig_276_Actions )
endfunction
