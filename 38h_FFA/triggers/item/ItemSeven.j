
//===========================================================================
// Trigger: ItemSeven
//
// 装备库
//===========================================================================
function Trig_ItemSeven_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I008'  then//龙心1
    if ciwh(u,'iwbr')>=1 and ciwh(u,'gsou')>=1 then
    call dlit(u,'iwbr',1)
    call dlit(u,'gsou',1) 
    call UnitAddItemById( u,'thdm') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00V'  then//远古护盾2
    if ciwh(u,'sksh')>=1 and ciwh(u,'hcun')>=1 then
    call dlit(u,'sksh',1)
    call dlit(u,'hcun',1) 
    call UnitAddItemById( u,'anfg') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 850, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I004'  then//希瓦3
    if ciwh(u,'rde3')>=1 and ciwh(u,'shtm')>=1 then
    call dlit(u,'rde3',1)
    call dlit(u,'shtm',1) 
    call UnitAddItemById( u,'sor4') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 600, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00T'  then//血精4
    if ciwh(u,'bfhr')>=1 and ciwh(u,'ofir')>=1 then
    call dlit(u,'bfhr',1)
    call dlit(u,'ofir',1) 
    call UnitAddItemById( u,'ram2') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00C'  then//刷新5
    if ciwh(u,'axas')>=1 and ciwh(u,'ofir')>=1 then
    call dlit(u,'axas',1)
    call dlit(u,'ofir',1) 
    call UnitAddItemById( u,'ram4') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1875, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I002'  then//强袭6
    if ciwh(u,'rde1')>=1 and ciwh(u,'rde3')>=1 and ciwh(u,'esaz')>=1 then
    call dlit(u,'rde1',1)
    call dlit(u,'rde3',1) 
    call dlit(u,'esaz',1)
    call UnitAddItemById( u,'I001') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1500, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I00B'  then//虚灵盾7
    if ciwh(u,'sprn')>=1 and ciwh(u,'schl')>=1 and ciwh(u,'rag1')>=1 then
    call dlit(u,'sprn',1)
    call dlit(u,'schl',1) 
    call dlit(u,'rag1',1)
    call UnitAddItemById( u,'sor8') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 40, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I01H'  then//林肯8
    if ciwh(u,'oslo')>=1 and ciwh(u,'ofir')>=1 then
    call dlit(u,'oslo',1)
    call dlit(u,'ofir',1) 
    call UnitAddItemById( u,'hbth') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1325, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I01K'  then//不朽9
    if ciwh(u,'amrc')>=1 and ciwh(u,'gsou')>=1 and ciwh(u,'iwbr')>=1 then
    call dlit(u,'amrc',1)
    call dlit(u,'gsou',1) 
    call dlit(u,'iwbr',1) 
    call UnitAddItemById( u,'ram3') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 0, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I01O'  then//不死之身10
    if ciwh(u,'ofir')>=1 and ciwh(u,'hcun')>=1 and ciwh(u,'gemt')>=1 then
    call dlit(u,'ofir',1)
    call dlit(u,'hcun',1) 
    call dlit(u,'gemt',1) 
    call UnitAddItemById( u,'vddl') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1275, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03S'  then//冰晶节杖11
    if ciwh(u,'gsou')>=2 and ciwh(u,'shtm')>=1 then
    call dlit(u,'gsou',2)
    call dlit(u,'shtm',1)
    call UnitAddItemById( u,'pmna') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 800, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
endif
endif
endif
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
function InitTrig_ItemSeven takes nothing returns nothing
    set gg_trg_ItemSeven = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemSeven, gg_unit_nmrf_0134, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemSeven, Condition( function Trig_ItemSeven_Conditions ) )
endfunction
