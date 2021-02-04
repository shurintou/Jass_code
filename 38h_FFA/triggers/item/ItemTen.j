
//===========================================================================
// Trigger: ItemTen
//===========================================================================
function Trig_ItemTen_Conditions takes nothing returns boolean
    local unit u=GetBuyingUnit()
    local item t=GetSoldItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
if  i== 'I03T'  then//荆棘护甲1
    if ciwh(u,'shhn')>=1 then
    call dlit(u,'shhn',1)
    call UnitAddItemById( u,'penr') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1600, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03V' then//时光2
    if ciwh(u,'gldo')>=1 and ciwh(u,'ciri')>=2 then
    call dlit(u,'gldo',1)
    call dlit(u,'ciri',2)
    call UnitAddItemById( u,'grsl') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 300, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I00N' then//黄金之心3
    if ciwh(u,'rnsp')>=1 then
    call dlit(u,'rnsp',1)
    call UnitAddItemById( u,'rugt') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 1025, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03W' then//吸血鬼4
    if ciwh(u,'arsh')>=1 then
    call dlit(u,'arsh',1)
    call UnitAddItemById( u,'odef') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 3500, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03X' then//金钟罩5
    if ciwh(u,'rde3')>=1 and ciwh(u,'mcou')>=1 then
    call dlit(u,'rde3',1)
    call dlit(u,'mcou',1)
    call UnitAddItemById( u,'spsh') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 300, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03Y' then//灭世//6
    if ciwh(u,'shtm')>=2 then
    call dlit(u,'shtm',2)
    call UnitAddItemById( u,'gcel') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I03Z' then//军团7
    if ciwh(u,'rugt')>=1 and ciwh(u,'shen')>=1 then
    call dlit(u,'rugt',1)
    call dlit(u,'shen',1)
    call UnitAddItemById( u,'rhth') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 200, p, PLAYER_STATE_RESOURCE_GOLD )
    endif
else
if  i=='I041' then//科技枪8
    if ciwh(u,'modt')>=1 and ciwh(u,'axas')>=1 then
    call dlit(u,'modt',1)
    call dlit(u,'axas',1)
    call UnitAddItemById( u,'tmsc') 
    set u=null
    set t=null
    set p=null   
    return false
    else
    call RemoveItem( UnitAddItemById(u, 'rspd'))
    call AdjustPlayerStateBJ( 425, p, PLAYER_STATE_RESOURCE_GOLD )
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
    return false
endfunction



//===========================================================================
function InitTrig_ItemTen takes nothing returns nothing
    set gg_trg_ItemTen = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_ItemTen, gg_unit_harm_0113, EVENT_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_ItemTen, Condition( function Trig_ItemTen_Conditions ) )
endfunction
