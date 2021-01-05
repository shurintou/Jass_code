
//===========================================================================
// Trigger: OverRepick
//
// local integer i=GetConvertedPlayerId(GetOwningPlayer(u))
// local player p=GetOwningPlayer(u)
// set udg_Bag[i]=CreateUnit(GetOwningPlayer(u),'Hdgo',GetUnitX(u),GetUnitY(u),0)//背包编号1-12
// call SetHeroLevel( udg_Bag[i],25, false )
// call TriggerRegisterUnitEvent( gg_trg_DropSB, udg_Bag[i], EVENT_UNIT_PICKUP_ITEM )
// call TriggerRegisterUnitEvent( gg_trg_MoveHero, udg_Bag[i], EVENT_UNIT_ISSUED_POINT_ORDER )
// call TriggerRegisterUnitEvent( gg_trg_ChooseHero, udg_Bag[i], EVENT_UNIT_SELECTED )
// call TriggerRegisterUnitEvent( gg_trg_ChooseHero, udg_PlayerLockToHero[i], EVENT_UNIT_SELECTED )
//===========================================================================
function asdadasd takes nothing returns nothing
call SetPlayerState( GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1 )
endfunction



function Trig_OverRepick_Actions takes nothing returns nothing
    //call DisableTrigger( gg_trg_bozangharm )
    call ForForce(udg_OnlinePlayer,function asdadasd)
    //call EnableTrigger( gg_trg_LearnAbility )


    call DestroyTrigger( gg_trg_repick )
    call DestroyTrigger( gg_trg_test )//60秒后关闭测试功能
    if udg_Test==true then
    else
    call RemoveUnit(gg_unit_Hamg_0130)
    call RemoveUnit(gg_unit_Ewrd_0109)
    endif
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_OverRepick takes nothing returns nothing
    set gg_trg_OverRepick = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_OverRepick, 60.00 )
    call TriggerAddAction( gg_trg_OverRepick, function Trig_OverRepick_Actions )
endfunction
