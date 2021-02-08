
//===========================================================================
// Trigger: Beginning
//
// 一开始选取全地图的单位注册一次受伤害事件。
//===========================================================================
function Trig_Beginning_Actions takes nothing returns nothing
    local group g=GetUnitsInRectAll(GetPlayableMapRect())
    local unit u
    local trigger tr
    local trigger tt
    local integer i=0
    loop 
    set u=FirstOfGroup(g)
    exitwhen u==null
    if IsUnitIdType(GetUnitTypeId(u), UNIT_TYPE_STRUCTURE) == false and IsUnitType(u, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(u) != 'e000' and GetUnitTypeId(u) != 'Hdgo' and IsUnitType(u, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(u,'Aloc')==0 and IsUnitType(u, UNIT_TYPE_HERO) == false then
    set i=GetHandleId(u)
    set tt=CreateTrigger()
    set tr=CreateTrigger()
    call TriggerRegisterUnitEvent( tr, u, EVENT_UNIT_DAMAGED )
    call TriggerRegisterUnitEvent( tt, u, EVENT_UNIT_DEATH )
    call UnitAddAbility( u, 'A0E5' )
    call SaveTriggerConditionHandle(udg_Hash5,i,2,TriggerAddCondition( tr, Condition(function GetDamageAction) ))
    call SaveTriggerConditionHandle(udg_Hash5,i,3,TriggerAddCondition( tt, Condition(function UnitDeathAction) ))
    call SaveTriggerHandle(udg_Hash5,i,1,tr)
    endif
    call GroupRemoveUnit(g,u)
    set i=0    
    set u=null
    endloop
call DestroyGroup(g)
set g=null
set u=null
set tr=null
set tt=null   
call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_Beginning takes nothing returns nothing
    set gg_trg_Beginning = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Beginning, 10.00 )
    call TriggerAddAction( gg_trg_Beginning, function Trig_Beginning_Actions )
endfunction
