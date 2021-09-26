
//===========================================================================
// Trigger: zange
//===========================================================================
function Trig_zange_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0D4' 
endfunction

function Trig_zange_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer n=0//尸体数量
local integer i=0//敌人数量
local group g
local unit t
local player p
local integer level=0
local group f

  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,GetSpellTargetX(),GetSpellTargetY(),350,null)
  set f=CreateGroup()
  call GroupEnumUnitsInRange(f,GetSpellTargetX(),GetSpellTargetY(),350,null)
  set p=GetOwningPlayer(u)
  set level=GetUnitAbilityLevel(u,'A0D4')
  
  loop
  set t=FirstOfGroup(f)
  exitwhen t==null
  if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) >0.00 and GetUnitAbilityLevel(t,'Aloc')==0 then
  set i=i+1
  else
  if GetUnitState(t, UNIT_STATE_LIFE) <=0.00 and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_HERO)==false then
  call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Undead\\UDeathMedium\\UDeath.mdl", GetUnitX(t), GetUnitY(t)) )
  call RemoveUnit( t )
  call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+5*level )
  call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+5*level )
  set n=n+1
  endif
  endif
  call GroupRemoveUnit(f,t)
  set t=null
  endloop
  


  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0  then
    call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), t, n*10*level, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call UnitDamageTarget( u, t, i*10*level, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Undead\\UDeathMedium\\UDeath.mdl", t, "origin") )
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop


call DestroyGroup(g)
call DestroyGroup(f)


set u=null
set g=null
set t=null
set f=null
set p=null
endfunction

//===========================================================================
function InitTrig_zange takes nothing returns nothing
    set gg_trg_zange = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zange, Condition( function Trig_zange_Conditions ) )
    call TriggerAddAction( gg_trg_zange, function Trig_zange_Actions )
endfunction
