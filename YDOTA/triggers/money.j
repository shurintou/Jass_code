
//===========================================================================
// Trigger: money
//===========================================================================
function Trig_money_Actions takes nothing returns nothing
    call SetPlayerStateBJ( Player(9), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(8), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(7), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(6), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(5), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(4), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(3), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(0), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(2), PLAYER_STATE_RESOURCE_GOLD, 300 )
    call SetPlayerStateBJ( Player(1), PLAYER_STATE_RESOURCE_GOLD, 300 )
endfunction

//===========================================================================
function InitTrig_money takes nothing returns nothing
    set gg_trg_money = CreateTrigger(  )
    call TriggerAddAction( gg_trg_money, function Trig_money_Actions )
endfunction
