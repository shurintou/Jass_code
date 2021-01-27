
//===========================================================================
// Trigger: ItemOne
//
// 神秘藏宝室
//===========================================================================
function Trig_ItemOne_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I009'  then//坚韧球1
    if ciwh(u,'rnsp')>=1 and ciwh(u,'prvt')>=1 then
    call dlit(u,'rnsp',1)
    call dlit(u,'prvt',1)
    call UnitAddItemById( u,'ofir') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I015'  then//回复头巾2
    if ciwh(u,'rnsp')>=1 then
    call dlit(u,'rnsp',1)
    call UnitAddItemById( u,'lgdh') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 25, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I016'  then//玄冥盾牌3
    if ciwh(u,'rde1')>=1  then
    call dlit(u,'rde1',1)
    call UnitAddItemById( u,'brag') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
endif
endif
endif
set u=null
    set t=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_ItemOne takes nothing returns nothing
    set gg_trg_ItemOne = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemOne, gg_unit_hvlt_0020, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemOne, Condition( function Trig_ItemOne_Conditions ) )
endfunction
