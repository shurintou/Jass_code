
//===========================================================================
// Trigger: HolyAttack
//
// call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),325,null)
//   set p=GetOwningPlayer(u)
//   set level=GetUnitAbilityLevel(u,'A0AS')
//   set r=75*level
//   loop
//   set t=FirstOfGroup(g)
//   exitwhen t==null
//     if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 then
//     call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
//     endif
//   call GroupRemoveUnit(g,t)
//   set t=null
//   endloop
//   call DestroyGroup(g)
//===========================================================================
function Trig_HolyAttack_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A06R' 
endfunction

function holyattackact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u
local unit m
local integer n=LoadInteger(udg_Hash1,i,3)
local group g
local player p
local integer level
local real r
local integer ew=0
local real far
local real x
local real y

if n>0 then
set m=LoadUnitHandle(udg_Hash1,i,2)
call SaveInteger(udg_Hash1,i,3,n-1)
  if GetUnitAbilityLevel(m, 'B01Z')>0 or LoadInteger(udg_Hash1,i,5)==1 then
  set u=LoadUnitHandle(udg_Hash1,i,1)
  set g=CreateGroup()
  set p=GetOwningPlayer(u)
  set level=GetUnitAbilityLevel(u,'A06R')
  set r=25*level
  set x=GetUnitX(m)
  set y=GetUnitY(m)
  set far=200+100*level
  call SaveInteger(udg_Hash1,i,5,1)
  call GroupEnumUnitsInRange(g,x,y,far,null)
  loop
  set m=FirstOfGroup(g)
  exitwhen m==null
       if IsUnitEnemy(m, p)==true and GetUnitState(m, UNIT_STATE_LIFE) > 0.00 and IsUnitType(m, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(m, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(m,'Aloc')==0 then
       call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), m, r, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
       call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\ForkedLightning\\ForkedLightningTarget.mdl", m, "chest") )
       endif
  call GroupRemoveUnit(g,m)
  set m=null
  endloop
  call DestroyGroup(g)
  loop
  exitwhen ew>6+2*level
  call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", x+GetRandomReal(-far,far), y+GetRandomReal(-far,far)) )
  set ew=ew+1
  endloop
  endif
else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
set g=null
set p=null
endfunction


function Trig_HolyAttack_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
call SaveUnitHandle(udg_Hash1,i,1,GetTriggerUnit())
call SaveUnitHandle(udg_Hash1,i,2,GetSpellTargetUnit())
call SaveInteger(udg_Hash1,i,3,10)
call SaveInteger(udg_Hash1,i,5,0)
call TimerStart(tm,1,true,function holyattackact)
set tm=null
endfunction

//===========================================================================
function InitTrig_HolyAttack takes nothing returns nothing
    set gg_trg_HolyAttack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HolyAttack, Condition( function Trig_HolyAttack_Conditions ) )
    call TriggerAddAction( gg_trg_HolyAttack, function Trig_HolyAttack_Actions )
endfunction
