
//===========================================================================
// Trigger: sanxiangzhili
//===========================================================================
function Trig_sanxiangzhili_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0E3' 
endfunction


function asdyidongspeed takes unit u returns real
local real r=GetUnitDefaultMoveSpeed(u)
local integer n=GetConvertedPlayerId(GetOwningPlayer(u))
local real o=I2R(LoadInteger(udg_Hash6,n,14))
local real t=I2R(LoadInteger(udg_Hash6,n,29))
local real s=0.00
if IsUnitType(u, UNIT_TYPE_HERO) then
  if r+o>522.00 then
  return 522.00
  else
  return r+o
  endif
else
  set s=r*(1+0.05*t)
  if s>522.00 then
  return 522.00
  else
  return s
  endif
endif
endfunction

function jiansugroup takes nothing returns nothing
local unit t=GetEnumUnit()
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_sanxiangzhili),1)
if IsUnitAlly(t, GetOwningPlayer(u))==false and GetUnitState(t, UNIT_STATE_LIFE) >0.00 and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false then
call SetUnitMoveSpeed( t, asdyidongspeed(t)-GetHeroInt(u,true) )
endif
set t=null
set u=null
endfunction

function diaosanxiangaa takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,2)
local real x=0
local real y=0
local group g=LoadGroupHandle(udg_Hash1,i,3)
local group f
local unit t
local player p


if n>0 then
set x=LoadReal(udg_Hash1,i,4)
set y=LoadReal(udg_Hash1,i,5)
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x+GetRandomReal(-700,700), y+GetRandomReal(-700,700)) )
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x+GetRandomReal(-700,700), y+GetRandomReal(-700,700)) )
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x+GetRandomReal(-700,700), y+GetRandomReal(-700,700)) )
call SaveInteger(udg_Hash1,i,2,n-1)
set f=CreateGroup()
call GroupEnumUnitsInRange(f,x,y,700,null)
set p=GetOwningPlayer(u)
loop
set t=FirstOfGroup(f)
exitwhen t==null
if IsUnitAlly(t,p)==false and GetUnitState(t, UNIT_STATE_LIFE) >0.00 and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and IsUnitInGroup(t, g)==false then
call SetUnitMoveSpeed( t, asdyidongspeed(t)-GetHeroInt(u,true) )
call GroupAddUnit(g,t)
endif
call GroupRemoveUnit(f,t)
set t=null
endloop
call GroupClear(f)
call DestroyGroup(f)

else
loop
set t=FirstOfGroup(g)
exitwhen t==null
call SetUnitMoveSpeed( t, asdyidongspeed(t))
call GroupRemoveUnit(g,t)
set t=null
endloop
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0E3', true )
call GroupClear(g)
call DestroyGroup(g)
call SetUnitMoveSpeed( u, asdyidongspeed(u))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif


set f=null
set p=null
set t=null
set g=null
set tm=null
set u=null
endfunction

function Trig_sanxiangzhili_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer level= GetUnitAbilityLevel(u, 'A0E3')
local group g=CreateGroup()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
call GroupEnumUnitsInRange(g,x,y,700,null)
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A0E3', false )
call UnitApplyTimedLife( CreateUnit(GetTriggerPlayer(), 'n006', x, y, 0), 'BHwe', 3+level )   
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveInteger(udg_Hash1,i,2,6+2*level)
call SaveGroupHandle(udg_Hash1,i,3,g)
call SaveReal(udg_Hash1,i,4,x)
call SaveReal(udg_Hash1,i,5,y)
call ForGroup(g,function jiansugroup)
call SetUnitMoveSpeed( u, asdyidongspeed(u)+GetHeroAgi(u,true) )
call TimerStart(tm,0.5,true,function diaosanxiangaa)
set u=null
set tm=null
set g=null
endfunction

//===========================================================================
function InitTrig_sanxiangzhili takes nothing returns nothing
    set gg_trg_sanxiangzhili = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_sanxiangzhili, Condition( function Trig_sanxiangzhili_Conditions ) )
    call TriggerAddAction( gg_trg_sanxiangzhili, function Trig_sanxiangzhili_Actions )
endfunction
