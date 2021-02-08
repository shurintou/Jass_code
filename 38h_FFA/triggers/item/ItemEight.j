
//===========================================================================
// Trigger: ItemEight
//
// 地精实验室
//===========================================================================
function Trig_ItemEight_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I00A'  then//紫怨1
    if ciwh(u,'axas')>=2  then
    call dlit(u,'axas',2)
    call UnitAddItemById( u,'sor9') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1150, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I005'  then//幻影斧2
    if ciwh(u,'stwa')>=1 and ciwh(u,'oslo')>=1 then
    call dlit(u,'stwa',1)
    call dlit(u,'oslo',1) 
    call UnitAddItemById( u,'sor2') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 700, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00U'  then//震魂爪3
    if ciwh(u,'rat3')>=1 and ciwh(u,'rat6')>=1 then
    call dlit(u,'rat3',1)
    call dlit(u,'rat6',1) 
    call UnitAddItemById( u,'sor5') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1400, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I007'  then//羊刀4
    if ciwh(u,'prvt')>=1 and ciwh(u,'oslo')>=1 and ciwh(u,'shtm')>=1 then
    call dlit(u,'prvt',1)
    call dlit(u,'oslo',1)
    call dlit(u,'shtm',1)  
    call UnitAddItemById( u,'sora') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I003'  then//蝴蝶5
    if ciwh(u,'sprn')>=1 and ciwh(u,'amrc')>=1 and ciwh(u,'afac')>=1 then
    call dlit(u,'sprn',1)
    call dlit(u,'amrc',1)
    call dlit(u,'afac',1)  
    call UnitAddItemById( u,'ram1') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 100, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00S'  then//雷神之锤6
    if ciwh(u,'sor1')>=1 and ciwh(u,'esaz')>=1 then
    call dlit(u,'sor1',1)
    call dlit(u,'esaz',1) 
    call UnitAddItemById( u,'sor6') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 100, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I000'  then//大炮7
    if ciwh(u,'srbd')>=1 and ciwh(u,'rat6')>=1 then
    call dlit(u,'srbd',1)
    call dlit(u,'rat6',1) 
    call UnitAddItemById( u,'asbl') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1250, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00W'  then//撒旦8
    if ciwh(u,'klmm')>=1 and ciwh(u,'iwbr')>=1 then
    call dlit(u,'klmm',1)
    call dlit(u,'iwbr',1) 
    call UnitAddItemById( u,'sor7') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1025, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00E'  then//辉耀9
    if ciwh(u,'shen')>=1  then
    call dlit(u,'shen',1)
    call UnitAddItemById( u,'clfm') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1350, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00P'  then//散夜对剑10
    if ciwh(u,'sfog')>=1 and ciwh(u,'stwa')>=1 then
    call dlit(u,'sfog',1)
    call dlit(u,'stwa',1) 
    call UnitAddItemById( u,'crdt') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 100, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I01G'  then//圣剑11
    if ciwh(u,'shen')>=1 and ciwh(u,'rat6')>=1 then
    call dlit(u,'shen',1)
    call dlit(u,'rat6',1) 
    call UnitAddItemById( u,'blba') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 100, p, PLAYER_STATE_RESOURCE_GOLD )
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
function InitTrig_ItemEight takes nothing returns nothing
    set gg_trg_ItemEight = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemEight, gg_unit_ngad_0133, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemEight, Condition( function Trig_ItemEight_Conditions ) )
endfunction
