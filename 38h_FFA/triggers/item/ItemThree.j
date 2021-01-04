
//===========================================================================
// Trigger: ItemThree
//
// 奇迹古树
//===========================================================================
function Trig_ItemThree_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I010'  then//支配1
    if ciwh(u,'modt')>=1 and ciwh(u,'ckng')>=1 then
    call dlit(u,'modt',1)
    call dlit(u,'ckng',1) 
    call UnitAddItemById( u,'klmm') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00Y'  then//先锋盾2
    if ciwh(u,'rnsp')>=1 and ciwh(u,'rde4')>=1 and ciwh(u,'gsou')>=1 then
    call dlit(u,'rnsp',1)
    call dlit(u,'rde4',1) 
    call dlit(u,'gsou',1) 
    call UnitAddItemById( u,'sksh') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00Z'  then//挑战3
    if ciwh(u,'rnsp')>=1 and ciwh(u,'wneu')>=2 and ciwh(u,'mcou')>=1 then
    call dlit(u,'rnsp',1)
    call dlit(u,'wneu',2) 
    call dlit(u,'mcou',1) 
    call UnitAddItemById( u,'hcun') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 375, p, PLAYER_STATE_RESOURCE_GOLD )
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
function InitTrig_ItemThree takes nothing returns nothing
    set gg_trg_ItemThree = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemThree, gg_unit_eden_0131, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemThree, Condition( function Trig_ItemThree_Conditions ) )
endfunction
