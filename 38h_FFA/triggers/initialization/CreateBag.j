
//===========================================================================
// Trigger: CreateBag
//
// //call TriggerRegisterUnitEvent( gg_trg_ChaYan, udg_Bag[i], EVENT_UNIT_ISSUED_POINT_ORDER  )
//===========================================================================
function overeeee takes nothing returns nothing
local player p=GetEnumPlayer()
local integer i=GetConvertedPlayerId(p)
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(p)]

set udg_Bag[i]=CreateUnit(p,'Hdgo',GetUnitX(u),GetUnitY(u),0)//背包编号1-12
call SetHeroLevel( udg_Bag[i],25, false )
call TriggerRegisterUnitEvent( gg_trg_DropSB, udg_Bag[i], EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_MoveHero, udg_Bag[i], EVENT_UNIT_ISSUED_POINT_ORDER )
call TriggerRegisterUnitEvent( gg_trg_ChooseHero, udg_Bag[i], EVENT_UNIT_SELECTED )
call TriggerRegisterUnitEvent( gg_trg_ChooseHero, udg_PlayerLockToHero[i], EVENT_UNIT_SELECTED )

set p=null
set u=null
endfunction



function Trig_CreateBag_Actions takes nothing returns nothing
    call ForForce(udg_OnlinePlayer,function overeeee)
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_CreateBag takes nothing returns nothing
    set gg_trg_CreateBag = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_CreateBag, 250.00 )
    call TriggerAddAction( gg_trg_CreateBag, function Trig_CreateBag_Actions )
endfunction
