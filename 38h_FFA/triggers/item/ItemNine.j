
//===========================================================================
// Trigger: ItemNine
//
// if   i== 'I01I'  then//骨灰盒1
//     if ciwh(u,'rwiz')>=1 and ciwh(u,'rin1')>=1 then
//     call dlit(u,'rwiz',1)
//     call dlit(u,'rin1',1) 
//     call UnitAddItemById( u,'woms') 
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     call AdjustPlayerStateBJ( 190, p, PLAYER_STATE_RESOURCE_GOLD )
//     endif
// else
// if  i== 'I01J'  then//救赎指环3
//     if ciwh(u,'lgdh')>=1 and ciwh(u,'rde2')>=1 and ciwh(u,'rst1')>=1 then
//     call dlit(u,'lgdh',1)
//     call dlit(u,'rde2',1) 
//     call dlit(u,'rst1',1)
//     call UnitAddItemById( u,'belv') 
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     call AdjustPlayerStateBJ( 840, p, PLAYER_STATE_RESOURCE_GOLD )
//     endif
// else
//===========================================================================
function Trig_ItemNine_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)

if   i== 'I01L'  then//牺牲指环1
    if ciwh(u,'rwiz')>=1 and ciwh(u,'wneu')>=1 then
    call dlit(u,'rwiz',1)
    call dlit(u,'wneu',1) 
    call UnitAddItemById( u,'pman') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 175, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I01E'  then//刃甲2
    if ciwh(u,'rde1')>=1 and ciwh(u,'ciri')>=1 and ciwh(u,'ratc')>=1 then
    call dlit(u,'rde1',1)
    call dlit(u,'ciri',1) 
    call dlit(u,'ratc',1)
    call UnitAddItemById( u,'shhn') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I01P'  then//影之灵龛3
    if ciwh(u,'rwiz')>=1 and ciwh(u,'rst1')>=1 then
    call dlit(u,'rwiz',1)
    call dlit(u,'rst1',1) 
    call UnitAddItemById( u,'jdrn') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 265, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I01F'  then//臂章4
    if ciwh(u,'ckng')>=1 and ciwh(u,'rat9')>=1 then
    call dlit(u,'ckng',1)
    call dlit(u,'rat9',1)
    call UnitAddItemById( u,'frhg') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 800, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I01Q'  then//统治权杖5
    if ciwh(u,'afac')>=1 and ciwh(u,'ciri')>=2 then
    call dlit(u,'afac',1)
    call dlit(u,'ciri',2)
    call UnitAddItemById( u,'mnsf') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 300, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I01B'  then//笛子6
    if ciwh(u,'hcun')>=1 and ciwh(u,'brag')>=1  then
    call dlit(u,'hcun',1)
    call dlit(u,'brag',1) 
    call UnitAddItemById( u,'fwss') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 625, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03D' then//战鼓7
    if ciwh(u,'rst1')>=1 and ciwh(u,'ciri')>=1  then
    call dlit(u,'rst1',1)
    call dlit(u,'ciri',1) 
    call UnitAddItemById( u,'ajen') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1540, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03E' then//勋章8
    if ciwh(u,'rde1')>=1 and ciwh(u,'rwiz')>=1  then
    call dlit(u,'rde1',1)
    call dlit(u,'rwiz',1) 
    call UnitAddItemById( u,'kpin') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 325, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03F' then//弹射
    if ciwh(u,'rin1')>=1 and ciwh(u,'rat9')>=1  then
    call dlit(u,'rin1',1)
    call dlit(u,'rat9',1) 
    call UnitAddItemById( u,'evtl') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1165, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03R' then//杀人书
    if ciwh(u,'rwiz')>=2 and ciwh(u,'ckng')>=1  then
    call dlit(u,'rwiz',2)
    call dlit(u,'ckng',1) 
    call UnitAddItemById( u,'dtsb') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    //call AdjustPlayerStateBJ( 1165, p, PLAYER_STATE_RESOURCE_GOLD )
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

    set u=null
    set t=null
    set p=null
return false
endfunction


//===========================================================================
function InitTrig_ItemNine takes nothing returns nothing
    set gg_trg_ItemNine = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemNine, gg_unit_nmr0_0138, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemNine, Condition( function Trig_ItemNine_Conditions ) )
endfunction
