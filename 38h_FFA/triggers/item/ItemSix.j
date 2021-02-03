
//===========================================================================
// Trigger: ItemSix
//
// 地精商店
//===========================================================================
function yuanorjin takes unit u returns nothing
if IsUnitType(u, UNIT_TYPE_RANGED_ATTACKER) == true then
call UnitAddItemById( u,'rump')
else
call UnitAddItemById( u,'I01A')
endif
endfunction


function Trig_ItemSix_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I00Q'  then//振魂石1
    if ciwh(u,'kgal')>=1 and ciwh(u,'gsou')>=1 and ciwh(u,'gldo')>=1 then
    call dlit(u,'kgal',1)
    call dlit(u,'gsou',1) 
    call dlit(u,'gldo',1) 
    call UnitAddItemById( u,'bfhr') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 100, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00R'  then//冰眼2
    if ciwh(u,'oslo')>=2 and ciwh(u,'gldo')>=1 and ciwh(u,'oven')>=1 then
    call dlit(u,'oslo',2)
    call dlit(u,'gldo',1) 
    call dlit(u,'oven',1)
    call yuanorjin(u)
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 150, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
endif
endif
set u=null
    set t=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_ItemSix takes nothing returns nothing
    set gg_trg_ItemSix = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemSix, gg_unit_ngme_0005, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemSix, Condition( function Trig_ItemSix_Conditions ) )
endfunction
