
//===========================================================================
// Trigger: shufuzhijian
//===========================================================================
function Trig_shufuzhijian_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A0BU' 
endfunction

function removelgi takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
call DestroyLightning(LoadLightningHandle(udg_Hash1,i,1))
call FlushChildHashtable( udg_Hash1, i )
  call PauseTimer(tm)
  call DestroyTimer(tm) 
set tm=null
endfunction


function deletelightining takes lightning l,real r returns nothing
local timer tm=CreateTimer()
call SaveLightningHandle(udg_Hash1,GetHandleId(tm),1,l)
call TimerStart(tm,r,false,function removelgi)
set tm=null
endfunction



function chooseshumu takes nothing returns nothing
local destructable d=GetEnumDestructable()
local real x
local real y
local integer n=GetHandleId(gg_trg_shufuzhijian)
local unit t
local unit u
local real dx
local real dy
local real r
local real angle  
local integer level
local integer i=GetDestructableTypeId(d)
local location l
local location w

if LoadInteger(udg_Hash1,n,10)!=10 then

   if i == 'LTlt' or i == 'CTtr' then
   set x=GetDestructableX(d)
   set y=GetDestructableY(d)
   set t=LoadUnitHandle(udg_Hash1,n,1)
   set u=LoadUnitHandle(udg_Hash1,n,2)
   set dx=GetUnitX(t)
   set dy=GetUnitY(t)
   set r=LoadReal(udg_Hash1,n,3)
   set angle=Atan2(y-dy, x-dx) 
   set level=LoadInteger(udg_Hash1, n,4)
   set l=GetUnitLoc(t)
   set w=GetDestructableLoc(d)
           if RAbsBJ(AngleBetweenPoints(l, w) -r)<35 then
           call SaveInteger(udg_Hash1,n,10,10)
           call SetUnitAbilityLevel( u, 'A0BV', 1+level )
           call UnitApplyTimedLife( u, 'BTLF', 0.1 )
           call IssueTargetOrderById( u, 852095, t )
           call deletelightining(AddLightning("MBUR", false, dx, dy,  x, y),0.75+0.75*level)
           endif
   call RemoveLocation(l)
   call RemoveLocation(w)
   endif

endif
set l=null
set w=null
set d=null
set t=null
set u=null
endfunction



function SFZJCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,2)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer level
local unit m
local real sx
local real sy
local real x
local real y
local real angle
local real c
local real s
local real ex
local real ey
local player p
local group g
local integer n=0
local location l
local location w
local integer qwe=0
local unit z


set sx=GetUnitX(t)
set sy=GetUnitY(t)
set x=GetUnitX(u)
set y=GetUnitY(u)
set ex=sx-x
set ey=sy-y
if SquareRoot(ex*ex+ey*ey)>60 then
  set angle=Atan2(ey, ex)
  set c=Cos(angle)
  set s=Sin(angle)
  call SetUnitX(u,RealX(x+(30*c)))
  call SetUnitY(u,RealY(y+(30*s)))
  call SetUnitFacing(u,angle*180/3.1415)
else
  set l=GetUnitLoc(t)
  set level=LoadInteger(udg_Hash1,i,4)
  set g=CreateGroup()
  set p=GetOwningPlayer(u)
  call GroupEnumUnitsInRange(g,sx,sy,400,null)
  loop
  set m=FirstOfGroup(g)
  exitwhen m==null or n==100
       if IsUnitEnemy(m, p)==true and GetUnitState(m, UNIT_STATE_LIFE) > 0.00 and IsUnitType(m, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(m, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(m,'Aloc')==0 and m!=t then
       set w=GetUnitLoc(m)
       set angle=AngleBetweenPoints(l, w)   
           if RAbsBJ(angle-LoadReal(udg_Hash1, i,3))<35 then
           set n=100
           set x=GetUnitX(m)
           set y=GetUnitY(m)
           set z=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
           call UnitAddAbility(z,'A0BV')
           call SetUnitAbilityLevel( u, 'A0BV', 1+level )
           call UnitApplyTimedLife( u, 'BTLF', 0.1 )
           call SetUnitAbilityLevel( z, 'A0BV', 1+level )
           call UnitApplyTimedLife( z, 'BTLF', 0.5 )
           call IssueTargetOrderById( z, 852095, m )
           call IssueTargetOrderById( u, 852095, t )
           call deletelightining(AddLightning("MBUR", false, sx, sy, x, y ),0.75+0.75*level)
           set qwe=1
           endif
       call RemoveLocation(w)
       endif
  call GroupRemoveUnit(g,m)
  set m=null
  endloop
  call GroupClear(g) 
  call DestroyGroup(g)
       if n!=100 then
       set n=GetHandleId(gg_trg_shufuzhijian)
       call SaveUnitHandle(udg_Hash1,n,1,t)
       call SaveUnitHandle(udg_Hash1,n,2,u)
       call SaveReal(udg_Hash1,n,3,LoadReal(udg_Hash1, i,3))
       call SaveInteger(udg_Hash1,n,4,level)
       call EnumDestructablesInCircleBJ(400, l,function chooseshumu)
       endif
       if qwe==0 and LoadInteger(udg_Hash1,GetHandleId(gg_trg_shufuzhijian),10)!=10 then
       call SetUnitAbilityLevel( u, 'A0BV', 1 )
       call UnitApplyTimedLife( u, 'BTLF', 0.1 )
       call IssueTargetOrderById( u, 852095, t )
       endif
  call RemoveLocation(l)
  call UnitApplyTimedLife( u, 'BTLF', 0.1 )
  call FlushChildHashtable( udg_Hash1, i )
  call PauseTimer(tm)
  call DestroyTimer(tm)  
endif


set z=null
set w=null
set l=null
set p=null
set tm=null
set t=null
set u=null
set g=null
set m=null
endfunction


function Trig_shufuzhijian_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()
local real sx=GetUnitX(t)
local real sy=GetUnitY(t)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=Atan2(sy-y, sx-x)
local real r=angle*180/3.1415
local unit m=CreateUnit(GetTriggerPlayer(),'hrif',x,y,r)
local location l=GetUnitLoc(u)
local location w=GetUnitLoc(t)
local real gang=AngleBetweenPoints(l, w)

call SaveInteger(udg_Hash1,i,4,GetUnitAbilityLevel(u, 'A0BU'))
call SaveReal(udg_Hash1,i,3,gang)
call SaveUnitHandle(udg_Hash1,i,2,t)
call SaveUnitHandle(udg_Hash1,i,1,m)
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_shufuzhijian),10,0)

call TimerStart(tm,0.02,true,function SFZJCheckLinkin)
call RemoveLocation(l)
call RemoveLocation(w)
set w=null
set l=null
set tm=null
set m=null
set t=null
set u=null
endfunction

//===========================================================================
function InitTrig_shufuzhijian takes nothing returns nothing
    set gg_trg_shufuzhijian = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shufuzhijian, Condition( function Trig_shufuzhijian_Conditions ) )
    call TriggerAddAction( gg_trg_shufuzhijian, function Trig_shufuzhijian_Actions )
endfunction
