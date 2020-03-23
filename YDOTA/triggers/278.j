
//===========================================================================
// Trigger: 未命名触发器 278
//===========================================================================
function Trig_278_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(7), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_278 takes nothing returns nothing
    set gg_trg_278 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_278, Player(7), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_278, function Trig_278_Actions )
endfunction
