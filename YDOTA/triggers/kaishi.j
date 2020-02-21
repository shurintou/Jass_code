
//===========================================================================
// Trigger: kaishi
//===========================================================================
function Trig_kaishi_Actions takes nothing returns nothing
    call SetMapFlag( MAP_ALLIANCE_CHANGES_HIDDEN, true )
    call SetMapFlag( MAP_LOCK_RESOURCE_TRADING, true )
    call SetMapFlag( MAP_OBSERVERS_ON_DEATH, true )
    call SetPlayerAllianceBJ( GetLocalPlayer(), ALLIANCE_SHARED_ADVANCED_CONTROL, false, GetLocalPlayer() )
endfunction

//===========================================================================
function InitTrig_kaishi takes nothing returns nothing
    set gg_trg_kaishi = CreateTrigger(  )
    call TriggerAddAction( gg_trg_kaishi, function Trig_kaishi_Actions )
endfunction
