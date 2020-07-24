
//===========================================================================
// Trigger: 未命名触发器 257
//===========================================================================
function Trig_257_Actions takes nothing returns nothing
    call TriggerSleepAction( 20.00 )
    call AdjustPlayerStateBJ( -20, Player(5), PLAYER_STATE_RESOURCE_LUMBER )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_257 takes nothing returns nothing
    set gg_trg_257 = CreateTrigger(  )
    call TriggerRegisterPlayerStateEvent( gg_trg_257, Player(5), PLAYER_STATE_RESOURCE_LUMBER, GREATER_THAN_OR_EQUAL, 1.00 )
    call TriggerAddAction( gg_trg_257, function Trig_257_Actions )
endfunction
