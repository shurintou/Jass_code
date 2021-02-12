
//===========================================================================
// Trigger: ItemFive
//
// 水果商店I00O
// if  i== 'I00D'  then//隐刀5
//     if ciwh(u,'ratf')>=1 and ciwh(u,'afac')>=1  then
//     call dlit(u,'ratf',1)
//     call dlit(u,'afac',1) 
//     call UnitAddItemById( u,'horl') 
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     call AdjustPlayerStateBJ( 1100, p, PLAYER_STATE_RESOURCE_GOLD )
//     endif
// else
// if  i== 'I01N'  then//死灵9
//     if ciwh(u,'bgst')>=1 and ciwh(u,'ciri')>=2 then
//     call dlit(u,'ciri',2)
//     call dlit(u,'bgst',1) 
//     call UnitAddItemById( u,'tlum')
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     if ciwh(u,'tlum')>=1 then
//     call dlit(u,'tlum',1)
//     call UnitAddItemById( u,'tbar')
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     if ciwh(u,'tbar')>=1 then
//     call dlit(u,'tbar',1)
//     call UnitAddItemById( u,'tfar')
//     set u=null
//     set t=null
//     set p=null   
//     return false
//     else
//     call RemoveItem( UnitAddItemById(u, 'rspd'))
//     call AdjustPlayerStateBJ( 1350, p, PLAYER_STATE_RESOURCE_GOLD )
//     endif
//     endif 
//     endif
// else
//===========================================================================
function Trig_ItemFive_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if   i== 'I00H'  then//狂战1
    if ciwh(u,'ofir')>=1 and ciwh(u,'ratc')>=1 and ciwh(u,'ratf')>=1 then
    call dlit(u,'ofir',1)
    call dlit(u,'ratc',1) 
    call dlit(u,'ratf',1) 
    call UnitAddItemById( u,'srtl') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if   i== 'I00O'  then//黑皇2
    if ciwh(u,'bgst')>=1 and ciwh(u,'rat3')>=1  then
    call dlit(u,'bgst',1)
    call dlit(u,'rat3',1) 
    call UnitAddItemById( u,'rots') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1350, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I00L'  then//电指3
    if ciwh(u,'afac')>=1 and ciwh(u,'ratc')>=1  then
    call dlit(u,'afac',1)
    call dlit(u,'ratc',1) 
    call UnitAddItemById( u,'sor1') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I00F'  then//散失4
    if ciwh(u,'cnob')>=2 and ciwh(u,'ciri')>=1  then
    call dlit(u,'cnob',2)
    call dlit(u,'ciri',1) 
    call UnitAddItemById( u,'spre') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 500, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I00I'  then//暗灭5
    if ciwh(u,'rat3')>=1 and ciwh(u,'kpin')>=1 then
    call dlit(u,'rat3',1)
    call dlit(u,'kpin',1)
    call UnitAddItemById( u,'ocor') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 800, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I040' then//黑撕6
    if ciwh(u,'ocor')>=1 and ciwh(u,'ratc')>=1 then
    call dlit(u,'ocor',1)
    call dlit(u,'ratc',1)
    call UnitAddItemById( u,'brac') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I01C'  then//碎骨锤7
    if ciwh(u,'bgst')>=1 and ciwh(u,'ratf')>=1  then
    call dlit(u,'bgst',1)
    call dlit(u,'ratf',1) 
    call UnitAddItemById( u,'sor3') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1250, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i== 'I03U'  then//8国王宝剑 
    if ciwh(u,'rat9')>=1 and ciwh(u,'ratf')>=1  then
    call dlit(u,'rat9',1)
    call dlit(u,'ratf',1) 
    call UnitAddItemById( u,'ssil') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 50, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I042'  then//绿爪9
    if ciwh(u,'esaz')>=1 and ciwh(u,'ratf')>=1  then
    call dlit(u,'esaz',1)
    call dlit(u,'ratf',1) 
    call UnitAddItemById( u,'woms') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1500, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I043' then//阿塔玛10
    if ciwh(u,'esaz')>=1 and ciwh(u,'rde3')>=1  then
    call dlit(u,'esaz',1)
    call dlit(u,'rde3',1) 
    call UnitAddItemById( u,'drph') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1500, p, PLAYER_STATE_RESOURCE_GOLD )
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
function InitTrig_ItemFive takes nothing returns nothing
    set gg_trg_ItemFive = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemFive, gg_unit_nmr4_0135, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemFive, Condition( function Trig_ItemFive_Conditions ) )
endfunction
