
//===========================================================================
// Trigger: NewArrow
//
// if x<udg_XMIN or y<udg_YMIN or x>udg_XMAX or y>udg_YMAX then
// set i=20
// endif
//===========================================================================
function Trig_NewArrow_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A00B' 
endfunction


function quedingdengji takes integer i returns integer
if i<3 then
return 1
else
if i>30 then
return 10
else
return R2I(i/3)
endif
endif
endfunction


function movearrownew takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1, n, 1)
local unit u
local integer i=LoadInteger(udg_Hash1, n, 2)
local real angle
local real c
local real s
local real x
local real y
local group g
local player p
local unit t
local real r
local group f=LoadGroupHandle(udg_Hash1,n,5)
local unit o
local integer level

if i<50 then
set angle=LoadReal(udg_Hash1, n, 3)
set o=LoadUnitHandle(udg_Hash1, n, 4)
set c=Cos(angle)
set s=Sin(angle)
set x=RealX(GetUnitX(m)+(50*c))
set y=RealY(GetUnitY(m)+(50*s))
set i=i+1
call SetUnitX(m,x)
call SetUnitY(m,y)
call SetUnitFacing(m,angle*180/3.1415)
set level=quedingdengji(i)
call SaveInteger(udg_Hash1,n,2,i)
set g=CreateGroup()
call GroupEnumUnitsInRange(g,x,y,160,null)
set u=LoadUnitHandle(udg_Hash1, n, 0)
set p=GetOwningPlayer(u)
set r=60*GetUnitAbilityLevel(u,'A00B')+60
loop
set t=FirstOfGroup(g)
exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitInGroup(t,f)==false then
    call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    set o=CreateUnit(p,'n001',GetUnitX(t),GetUnitY(t),0)
    call UnitAddAbility(o,'A0AV')
    call SetUnitAbilityLevel( o, 'A0AV', level )
    call IssueTargetOrderById( o, 852095, t )
    call UnitApplyTimedLife( o, 'BTLF', 3 )
    call GroupAddUnit(f,t)
    endif
call GroupRemoveUnit(g,t)
set t=null
endloop
call DestroyGroup(g)

else
call GroupClear(f)
call DestroyGroup(f)
call KillUnit(m)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set g=null
set t=null
set f=null
set o=null
set p=null
set u=null
set tm=null
set m=null
endfunction



function Trig_NewArrow_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=Atan2(sy-y, sx-x)
local real dx=0
local real dy=0
local unit m
local real c=Cos(angle)
local real s=Sin(angle)
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)




set m=CreateUnit(GetTriggerPlayer(),'n00C',x,y,angle*180/3.1415)
call UnitApplyTimedLife( m, 'BTLF', 10 )
call SaveUnitHandle(udg_Hash1,n,1,m)
call SaveUnitHandle(udg_Hash1,n,0,u)
call SaveInteger(udg_Hash1,n,2,0)
call SaveReal(udg_Hash1,n,3,angle)
call SetUnitPathing( m, false )
call SaveGroupHandle(udg_Hash1,n,5,CreateGroup())
call TimerStart(tm,0.04,true,function movearrownew)


set m=null
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_NewArrow takes nothing returns nothing
    set gg_trg_NewArrow = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_NewArrow, Condition( function Trig_NewArrow_Conditions ) )
    call TriggerAddAction( gg_trg_NewArrow, function Trig_NewArrow_Actions )
endfunction
