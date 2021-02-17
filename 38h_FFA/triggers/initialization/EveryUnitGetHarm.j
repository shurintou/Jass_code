
//===========================================================================
// Trigger: EveryUnitGetHarm
//===========================================================================
function Trig_EveryUnitGetHarm_Conditions takes nothing returns boolean
  local unit u=GetEnteringUnit()
  if IsUnitIdType(GetUnitTypeId(u), UNIT_TYPE_STRUCTURE) == false and IsUnitType(u, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(u) != 'e000' and GetUnitTypeId(u) != 'Hdgo' and IsUnitType(u, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(u,'Aloc')==0 and IsUnitType(u, UNIT_TYPE_HERO) == false then
  set u=null
  return true
  else
  set u=null
  return false
  endif
  set u=null
  return false
endfunction


function Trig_EveryUnitGetHarm_Actions takes nothing returns nothing
local trigger tr=CreateTrigger()
local unit u=GetEnteringUnit()
local integer i=GetHandleId(u)
local trigger tt=CreateTrigger()
call TriggerRegisterUnitEvent( tr, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( tt, u, EVENT_UNIT_DEATH )
call UnitAddAbility( u, 'A0E5' )
call SaveTriggerConditionHandle(udg_Hash5,i,2,TriggerAddCondition( tr, Condition(function GetDamageAction) ))
call SaveTriggerConditionHandle(udg_Hash5,i,3,TriggerAddCondition( tt, Condition(function UnitDeathAction) ))
call SaveTriggerHandle(udg_Hash5,i,1,tr)

set tr=null
set u=null
set tt=null
endfunction

//===========================================================================
function InitTrig_EveryUnitGetHarm takes nothing returns nothing
    set gg_trg_EveryUnitGetHarm = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_EveryUnitGetHarm, GetPlayableMapRect() )
    call TriggerAddCondition( gg_trg_EveryUnitGetHarm, Condition( function Trig_EveryUnitGetHarm_Conditions ) )
    call TriggerAddAction( gg_trg_EveryUnitGetHarm, function Trig_EveryUnitGetHarm_Actions )
endfunction
