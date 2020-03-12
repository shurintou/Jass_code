
//===========================================================================
// Trigger: 未命名触发器 260
//===========================================================================
function Trig_260_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(1), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_260 takes nothing returns nothing
    set gg_trg_260 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_260, Player(1), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_260, function Trig_260_Actions )
endfunction
