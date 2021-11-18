
//===========================================================================
// Trigger: lianhuanshuangdong
//
// call FlushChildHashtable( udg_Hash1, i )
//          call PauseTimer(tm)
//          call DestroyTimer(tm)
// if GetUnitState(u, UNIT_STATE_LIFE)>0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
//       set m=CreateUnit(GetOwningPlayer(u),'n001',sx,sy,0)
//       call UnitAddAbility(m,'A096')
//       set r=GetUnitState(t, UNIT_STATE_LIFE)
//       set l=GetUnitState(u, UNIT_STATE_LIFE)
//       set level=40-5*GetUnitAbilityLevel(u,'A095' )
//       call IssueTargetOrderById( m, 852662, t )
//       call UnitDamageTarget( u, t, 0.5*r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS ) 
//       call UnitApplyTimedLife( m, 'BTLF', 5 )
//             if GetUnitAbilityLevel(u,'Asp2')>0 then
//             call UnitDamageTarget( u, u, 0.01*level*l*0.6, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
//             else
//             call UnitDamageTarget( u, u, 0.01*level*l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
//             endif
//       endif
//   call PauseUnit( u, false )
//   call SetUnitTimeScalePercent( u, 100 )
//   call IssueTargetOrderById( u, 851983, t )  
// local unit m
// local integer n
// call BJDebugMsg( "2" )
//       loop  
//       set m=GroupPickRandomUnit(g)
//       exitwhen m==null
//          if IsUnitEnemy(m, p) and IsUnitType(m, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(m) != 'e000' and GetUnitTypeId(m) != 'Hdgo' and IsUnitType(m, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(m,'Aloc')==0 and m!=t and GetUnitState(m, UNIT_STATE_LIFE)>0 then
//          set n=10000
//          call BJDebugMsg( "1" )
//          
//          call GroupClear(g)
//          call DestroyGroup(g)
//          set m=null
//          return n
//          else
//          call GroupRemoveUnit(g,m)
//          endif
//       call GroupRemoveUnit(g,m)
//       set m=null
//       endloop
// set m=null
// return n
//===========================================================================
function Trig_lianhuanshuangdong_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BQ' 
endfunction

function tiaoxuandanwei takes nothing returns boolean
local integer lli=GetHandleId(gg_trg_lianhuanshuangdong)
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(udg_Hash1,lli,1))) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false and  GetFilterUnit()!=LoadUnitHandle(udg_Hash1,lli,2) and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE)>0
endfunction


function LHSDCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,2)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local unit m
local real sx
local real sy
local real x
local real y
local real angle
local real dx=0
local real dy=0
local real c
local real s
local real ex
local real ey
local integer dn
local group g
local player p=GetOwningPlayer(u)
local integer n
local boolexpr b
local integer lli=GetHandleId(gg_trg_lianhuanshuangdong)

if LoadInteger(udg_Hash1,i,3)==0 then
  if UnitHasBuffBJ(t,'BUhf') then//
  call UnitRemoveAbility(t,'BUhf')
  call SaveInteger(udg_Hash1,i,3,1)
  set m=CreateUnit(p,'n00L',GetUnitX(u),GetUnitY(u),LoadReal(udg_Hash1,i,5))
  call SaveUnitHandle(udg_Hash1,i,1,m)
  set m=CreateUnit(p,'n001',GetUnitX(t),GetUnitY(t),0)
  call UnitAddAbility( m, 'A056' )
  call UnitApplyTimedLife( m, 'BTLF', 6 )
  call IssueTargetOrderById( m, 852095, t )
  call SaveUnitHandle(udg_Hash1,lli,2,t)
  else
  call FlushChildHashtable( udg_Hash1, i )
  call PauseTimer(tm)
  call DestroyTimer(tm)
  endif
  call UnitRemoveAbility(t,'BUhf')
else//没有林肯则开始运行以下函数
set sx=GetUnitX(t)
set sy=GetUnitY(t)
set x=GetUnitX(u)
set y=GetUnitY(u)
set ex=sx-x
set ey=sy-y
  if SquareRoot(ex*ex+ey*ey)>100 then
  set angle=Atan2(ey, ex)
  set c=Cos(angle)
  set s=Sin(angle)
  call SetUnitX(u,RealX(x+(13*c)))
  call SetUnitY(u,RealY(y+(13*s)))
  call SetUnitFacing(u,angle*180/3.1415)
  else
  set m=CreateUnit(p,'n001',sx,sy,0)
  call UnitAddAbility( m, 'A0BP' )
  call UnitApplyTimedLife( m, 'BTLF', 6 )
      if udg_WeatherN==2 then
      call SetUnitAbilityLevel( m, 'A0BP',3+GetUnitAbilityLevel(LoadUnitHandle(udg_Hash1,lli,1), 'A0BQ') )
      else
      call SetUnitAbilityLevel( m, 'A0BP',GetUnitAbilityLevel(LoadUnitHandle(udg_Hash1,lli,1), 'A0BQ') )
      endif
  call IssueTargetOrderById( m, 852226, t )
  set dn=LoadInteger(udg_Hash1,i,4)
      if dn>0 then
      set g=CreateGroup()
      set b=Condition(function tiaoxuandanwei)
      call GroupEnumUnitsInRange(g,sx,sy,575,b)
      set t=null
      set t=GroupPickRandomUnit(g)
      call GroupClear(g)
      call DestroyBoolExpr(b)
      call DestroyGroup(g)
         if t!=null then
         call SaveUnitHandle(udg_Hash1,i,2,t)
         call SaveUnitHandle(udg_Hash1,lli,2,t)
         call SaveInteger(udg_Hash1,i,4,dn-1)
         else
         call ShowUnit( u, false )
         call KillUnit(u)
         call RemoveUnit(u)
         call FlushChildHashtable( udg_Hash1, i )
         call PauseTimer(tm)
         call DestroyTimer(tm) 
         endif
      else
      call ShowUnit( u, false )
      call KillUnit(u)
      call RemoveUnit(u)
      call FlushChildHashtable( udg_Hash1, i )
      call PauseTimer(tm)
      call DestroyTimer(tm) 
      endif
  endif
endif




set tm=null
set t=null
set u=null
set b=null
set p=null
set g=null
set m=null
endfunction


function Trig_lianhuanshuangdong_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()
local real sx=GetUnitX(t)
local real sy=GetUnitY(t)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=Atan2(sy-y, sx-x)

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash1,i,2,t)
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveInteger(udg_Hash1,i,3,0)
call SaveInteger(udg_Hash1,i,4,7)
call SaveReal(udg_Hash1,i,5,angle*180/3.1415)
call TimerStart(tm,0.02,true,function LHSDCheckLinkin)

set tm=null
set m=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_lianhuanshuangdong takes nothing returns nothing
    set gg_trg_lianhuanshuangdong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_lianhuanshuangdong, Condition( function Trig_lianhuanshuangdong_Conditions ) )
    call TriggerAddAction( gg_trg_lianhuanshuangdong, function Trig_lianhuanshuangdong_Actions )
endfunction
