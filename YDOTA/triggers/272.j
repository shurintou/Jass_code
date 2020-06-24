
//===========================================================================
// Trigger: 未命名触发器 272
//===========================================================================
function Trig_272_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(3), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_272 takes nothing returns nothing
    set gg_trg_272 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_272, Player(3), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_272, function Trig_272_Actions )
endfunction
