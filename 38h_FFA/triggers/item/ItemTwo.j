
//===========================================================================
// Trigger: ItemTwo
//
// 巫毒商店
//===========================================================================
function Trig_ItemTwo_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I012'  then//空明杖1
    if ciwh(u,'afac')>=1 and ciwh(u,'rwiz')>=1 and ciwh(u,'ciri')>=1 then
    call dlit(u,'afac',1)
    call dlit(u,'rwiz',1) 
    call dlit(u,'ciri',1)
    call UnitAddItemById( u,'axas') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00K'  then//水晶剑2
    if ciwh(u,'ratc')>=1 and ciwh(u,'rat9')>=1 then
    call dlit(u,'ratc',1)
    call dlit(u,'rat9',1)
    call UnitAddItemById( u,'srbd') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 500, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00G'  then//夜叉3
    if ciwh(u,'cnob')>=2  then
    call dlit(u,'cnob',2)
    call UnitAddItemById( u,'stwa') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00J'  then//散华4
    if ciwh(u,'bgst')>=2  then
    call dlit(u,'bgst',2)
    call UnitAddItemById( u,'sfog') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I006'  then//疯狂面具5
    if ciwh(u,'modt')>=1  then
    call dlit(u,'modt',1)
    call UnitAddItemById( u,'hval') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 900, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
endif
endif
endif
endif
endif
set u=null
    set t=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_ItemTwo takes nothing returns nothing
    set gg_trg_ItemTwo = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemTwo, gg_unit_ovln_0129, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemTwo, Condition( function Trig_ItemTwo_Conditions ) )
endfunction
