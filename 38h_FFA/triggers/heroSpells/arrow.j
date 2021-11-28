
//===========================================================================
// Trigger: arrow
//
// 李品仪对周围的单位进行经济能力上的评估。
// 冷却时间：100秒
// 影响范围：600码
// 魔法消耗：200/250/300点
// 等级1：比李品仪有钱的玩家英雄将减少(双方金钱差*1)的魔法，比李品仪贫穷的玩家英雄将受到(双方金钱差*1)的伤害。
// 等级2：比李品仪有钱的玩家英雄将减少(双方金钱差*2)的魔法，比李品仪贫穷的玩家英雄将受到(双方金钱差*2)的伤害。
// 等级3：比李品仪有钱的玩家英雄将减少(双方金钱差*3)的魔法，比李品仪贫穷的玩家英雄将受到(双方金钱差*3)的伤害。
// loop
// exitwhen i>16
// set i=i+1
// set dx=x+(150*(i*c))
// set dy=y+(150*(i*s))
// call SetUnitX(m,dx)
// call SetUnitY(m,dy)
// call SetUnitAbilityLevel( m, 'Awrg', i )
// call IssueImmediateOrderById( m, 852127 )
// endloop
//===========================================================================
function Trig_arrow_Conditions takes nothing returns boolean
     return GetSpellAbilityId() == 'A0CO' 
endfunction

function queding takes integer i,integer level returns integer
if level==1 then
   if i>9 then
   return 9
   else
   return i
   endif
else
if level==2 then
   if i>9 then
   return 19
   else
   return 9+i
   endif
else
if level==3 then
   if i>9 then
   return 30
   else
   return 19+i
   endif
endif
endif
endif
return 0
endfunction



function movearrow takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1, n, 1)
local integer i=LoadInteger(udg_Hash1, n, 2)
local real angle=LoadReal(udg_Hash1, n, 3)
local real c=Cos(angle)
local real s=Sin(angle)
local real x=GetUnitX(m)+(40*c)
local real y=GetUnitY(m)+(40*s)
local real sa=0

if x<udg_XMIN or y<udg_YMIN or x>udg_XMAX or y>udg_YMAX then
set i=102
endif

set i=i+1
if i<101 then
call SetUnitX(m,x)
call SetUnitY(m,y)
call SetUnitAbilityLevel( m, 'A065', queding(R2I(i/5),LoadInteger(udg_Hash1, n, 4)) )
call IssuePointOrderById( m, 852232, x, y )
set sa=0.1*i
call SetUnitScale( m, 5+sa, 5+sa, 5+sa )
call SaveInteger(udg_Hash1,n,2,i)
else
call RemoveUnit(m)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif


set tm=null
set m=null
endfunction



function Trig_arrow_Actions takes nothing returns nothing
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




set m=CreateUnit(GetTriggerPlayer(),'n00P',x,y,0)
call UnitApplyTimedLife( m, 'BTLF', 5 )
call SaveUnitHandle(udg_Hash1,n,1,m)
call SaveInteger(udg_Hash1,n,2,0)
call SaveReal(udg_Hash1,n,3,angle)
call SaveInteger(udg_Hash1,n,4,GetUnitAbilityLevel(u, 'A0CO'))
call TimerStart(tm,0.04,true,function movearrow)


set m=null
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_arrow takes nothing returns nothing
    set gg_trg_arrow = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_arrow, Condition( function Trig_arrow_Conditions ) )
    call TriggerAddAction( gg_trg_arrow, function Trig_arrow_Actions )
endfunction
