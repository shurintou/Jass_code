
//===========================================================================
// Trigger: 未命名触发器 280
//===========================================================================
function Trig_280_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(8), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_280 takes nothing returns nothing
    set gg_trg_280 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_280, Player(8), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_280, function Trig_280_Actions )
endfunction
