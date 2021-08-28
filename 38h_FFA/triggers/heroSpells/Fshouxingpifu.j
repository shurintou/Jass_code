
//===========================================================================
// Trigger: Fshouxingpifu
//===========================================================================
function Trig_Fshouxingpifu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AO' 
endfunction

function Trig_Fshouxingpifu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A0AO')
local group g=CreateGroup()
local unit m
local player p=GetOwningPlayer(u)
local integer o=GetHandleId(u)
local integer i=LoadInteger(udg_Hash1,o,754)
local real r=i*5+20*level

if i>0 then
call SaveInteger(udg_Hash1,o,754,i-1)

endif
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),650,null) 
loop
set m=FirstOfGroup(g)
exitwhen m==null
  if IsUnitEnemy(m, p) and IsUnitType(m, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(m) != 'e000' and GetUnitTypeId(m) != 'Hdgo' and IsUnitType(m, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(m,'Aloc')==0 then 
  call UnitDamageTarget( u, m, r , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
  endif
call GroupRemoveUnit(g,m)
set m=null
endloop
call DestroyGroup(g)


set u=null
set g=null
set m=null
set p=null
endfunction

//===========================================================================
function InitTrig_Fshouxingpifu takes nothing returns nothing
    set gg_trg_Fshouxingpifu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Fshouxingpifu, Condition( function Trig_Fshouxingpifu_Conditions ) )
    call TriggerAddAction( gg_trg_Fshouxingpifu, function Trig_Fshouxingpifu_Actions )
endfunction
