
//===========================================================================
// Trigger: yemanchongzhuang
//===========================================================================
function Trig_yemanchongzhuang_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0DD' 
endfunction


function choosezhuangjishumu takes nothing returns nothing
local destructable d=GetEnumDestructable()
local real x
local real y
local integer n=GetHandleId(gg_trg_yemanchongzhuang)
local unit t
local unit u
local integer i=GetDestructableTypeId(d)
local unit m


if LoadInteger(udg_Hash1,n,3)!=10000 then
   if i == 'LTlt' or i == 'CTtr' then
     if GetDestructableLife(d)>0 then
     set t=LoadUnitHandle(udg_Hash1,n,1)
     set u=LoadUnitHandle(udg_Hash1,n,2)
     set x=GetUnitX(t)
     set y=GetUnitY(t)
     set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
     call UnitAddAbility( m, 'A0DF' )
     call SetUnitAbilityLevel( m, 'A0DF', GetUnitAbilityLevel(u, 'A0DD') )
     call IssueImmediateOrderById( m, 852127 )
     call KillDestructable(d)
     call SaveInteger(udg_Hash1,n,3,10000)
     endif
   endif
else
endif

set m=null
set d=null
set t=null
set u=null
endfunction


function movechongzhuang takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,3)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local unit t=LoadUnitHandle(udg_Hash1,i,2)
local real x=0
local real y=0
local group g
local unit m
local unit w
local location l

if n>0 then
set g=CreateGroup()
set x=RealX(GetUnitX(t)+LoadReal(udg_Hash1,i,4))
set y=RealY(GetUnitY(t)+LoadReal(udg_Hash1,i,5))
call SetUnitX(t,x)
call SetUnitY(t,y)
call PanCameraToForPlayer(GetOwningPlayer(t),x,y)
call DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl", x, y) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", x, y) )
call SaveInteger(udg_Hash1,i,3,n-1)
call GroupEnumUnitsInRange(g,x,y,125,null)

loop  
set w=FirstOfGroup(g)
exitwhen w==null or n==10000
   if w!=u and w!=t and IsUnitType(w, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(w) != 'e000' and GetUnitTypeId(w) != 'Hdgo' and IsUnitType(w, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(w,'Aloc')==0 and GetUnitState(w, UNIT_STATE_LIFE)>0 then
   set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
   call UnitAddAbility( m, 'A0DF' )
   call SetUnitAbilityLevel( m, 'A0DF', GetUnitAbilityLevel(u, 'A0DD') )
   call IssueImmediateOrderById( m, 852127 )
   call FlushChildHashtable( udg_Hash1, i )
   call PauseTimer(tm)
   call DestroyTimer(tm)
   set n=10000
   endif
call GroupRemoveUnit(g,w)
set w=null
endloop
call DestroyGroup(g)

   if n!=10000 then
   set n=GetHandleId(gg_trg_yemanchongzhuang)
   call SaveUnitHandle(udg_Hash1,n,1,t)
   call SaveUnitHandle(udg_Hash1,n,2,u)
   set l=GetUnitLoc(t)
   call EnumDestructablesInCircleBJ(125,l,function choosezhuangjishumu)
   call RemoveLocation(l)
      if LoadInteger(udg_Hash1,n,3)==10000 then
      call FlushChildHashtable( udg_Hash1, i )
      call PauseTimer(tm)
      call DestroyTimer(tm)
      endif
   call SaveInteger(udg_Hash1,n,3,0)
   endif

else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set l=null
set w=null
set g=null
set m=null
set t=null
set tm=null
set u=null 
endfunction


function YMCZCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local timer tt
local integer o=0
local real angle=0
local unit u

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set tt=CreateTimer()
set o=GetHandleId(tt)
set angle=Atan2(GetUnitY(t)-GetUnitY(u), GetUnitX(t)-GetUnitX(u))
call SaveReal(udg_Hash1,o,4,50*Cos(angle))
call SaveReal(udg_Hash1,o,5,50*Sin(angle))
call SaveInteger(udg_Hash1,o,3,14)
call SaveUnitHandle(udg_Hash1,o,2,t)
call SaveUnitHandle(udg_Hash1,o,1,u)
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", t, "origin") )
call UnitDamageTarget(u, t, 3*GetHeroStr(u, true)+GetUnitAbilityLevel(u, 'A0DD')*100, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call TimerStart(tt,0.04,true,function movechongzhuang)
else
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set tt=null
set u=null
set t=null
endfunction


function Trig_yemanchongzhuang_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function YMCZCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_yemanchongzhuang takes nothing returns nothing
    set gg_trg_yemanchongzhuang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_yemanchongzhuang, Condition( function Trig_yemanchongzhuang_Conditions ) )
    call TriggerAddAction( gg_trg_yemanchongzhuang, function Trig_yemanchongzhuang_Actions )
endfunction
