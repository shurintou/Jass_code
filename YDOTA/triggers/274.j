
//===========================================================================
// Trigger: 未命名触发器 274
//===========================================================================
function Trig_274_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(4), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_274 takes nothing returns nothing
    set gg_trg_274 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_274, Player(4), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_274, function Trig_274_Actions )
endfunction
