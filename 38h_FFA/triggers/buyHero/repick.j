
//===========================================================================
// Trigger: repick
//===========================================================================
function Trig_repick_Actions takes nothing returns nothing
local player p=GetTriggerPlayer()
if udg_PlayerLockToHero[GetConvertedPlayerId(p)]==null then
else
call PanCameraToForPlayer( p,-260, -620 )
call RemoveUnit(udg_PlayerLockToHero[GetConvertedPlayerId(p)])
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=null
call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)-200 )
call SetPlayerMaxHeroesAllowed(8,p)
endif
set p=null
endfunction

//===========================================================================
function InitTrig_repick takes nothing returns nothing
    set gg_trg_repick = CreateTrigger(  )
    call TriggerAddAction( gg_trg_repick, function Trig_repick_Actions )
endfunction
