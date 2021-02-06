
//===========================================================================
// Trigger: ItemFour
//
// 古墓废墟
//===========================================================================
function Trig_ItemFour_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I011'  then//圣殿1
    if ciwh(u,'rde2')>=1 and ciwh(u,'rwiz')>=1 then
    call dlit(u,'rde2',1)
    call dlit(u,'rwiz',1) 
    call UnitAddItemById( u,'rlif') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I019'  then//祭品2
    if ciwh(u,'rlif')>=1 and ciwh(u,'modt')>=1 and ciwh(u,'wneu')>=1 then
    call dlit(u,'rlif',1)
    call dlit(u,'modt',1) 
    call dlit(u,'wneu',1) 
    call UnitAddItemById( u,'arsh') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 775, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I014'  then//飞鞋3
    if ciwh(u,'bspd')>=1  then
    call dlit(u,'bspd',1)
    call UnitAddItemById( u,'rde0') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 2200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I013'  then//相位4
    if ciwh(u,'bspd')>=1 and ciwh(u,'rat9')>=1 and ciwh(u,'rde1')>=1 then
    call dlit(u,'bspd',1)
    call dlit(u,'rat9',1)
    call dlit(u,'rde1',1)
    call UnitAddItemById( u,'tmmt') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i=='I01M' then//假腿5
    if ciwh(u,'bspd')>=2  then
    call dlit(u,'bspd',2)
    call UnitAddItemById( u,'wolg') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 400, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I018'  then//秘法6
    if ciwh(u,'rde2')>=1 and ciwh(u,'kgal')>=1 and ciwh(u,'bspd')>=1 then
    call dlit(u,'rde2',1)
    call dlit(u,'kgal',1) 
    call dlit(u,'bspd',1) 
    call UnitAddItemById( u,'lnrn') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I017'  then//梅肯7
    if ciwh(u,'lgdh')>=1 and ciwh(u,'brag')>=1 and ciwh(u,'bspd')>=1 then
    call dlit(u,'lgdh',1)
    call dlit(u,'brag',1)
    call dlit(u,'bspd',1) 
    call UnitAddItemById( u,'mlst') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 400, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
endif
endif
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
function InitTrig_ItemFour takes nothing returns nothing
    set gg_trg_ItemFour = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemFour, gg_unit_utom_0132, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemFour, Condition( function Trig_ItemFour_Conditions ) )
endfunction
