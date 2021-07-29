
//===========================================================================
// Trigger: jiefangqiao
//===========================================================================
function Trig_jiefangqiao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ACst' 
endfunction


function removedestrc takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local integer i=0

loop
exitwhen i>6
set i=i+1
call RemoveDestructable(LoadDestructableHandle(udg_Hash1, n, i))
endloop
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
endfunction



function killdestrc takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local integer i=0

loop
exitwhen i>6
set i=i+1
call KillDestructable(LoadDestructableHandle(udg_Hash1, n, i))
endloop
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
endfunction


function Trig_jiefangqiao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local destructable de
local timer tm=CreateTimer()
local timer tt=CreateTimer()
local integer n=GetHandleId(tm)
local integer h=GetHandleId(tt)
local integer i=0
local player p=GetTriggerPlayer()
local integer level=GetUnitAbilityLevel(u,'ACst')
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local unit m
local real angle=Atan2(sy-y, sx-x)
local real c=Cos(angle)
local real s=Sin(angle)
local real dangle=90+angle*180/3.1415926
local real dx=0
local real dy=0



loop
exitwhen i>6
set i=i+1
set dx=RealX(x+(200*i*c))
set dy=RealY(y+(200*i*s))
set m=CreateUnit(p,'n00B',dx,dy,0)
call SetUnitAbilityLevel( m, 'Awrs', level )
call IssueImmediateOrderById( m, 852127 )
call UnitApplyTimedLife( m, 'BTLF', 8 )
set de=CreateDestructable('ITcr',dx,dy,dangle,0.3,0)
call SaveDestructableHandle( udg_Hash1, n, i, de )
call SaveDestructableHandle( udg_Hash1, h, i, de )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", dx, dy) )
endloop
call TimerStart(tm,8,false,function killdestrc)
call TimerStart(tt,11,false,function removedestrc)

set u=null
set tm=null
set tt=null
set p=null
set de=null
set m=null
endfunction

//===========================================================================
function InitTrig_jiefangqiao takes nothing returns nothing
    set gg_trg_jiefangqiao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jiefangqiao, Condition( function Trig_jiefangqiao_Conditions ) )
    call TriggerAddAction( gg_trg_jiefangqiao, function Trig_jiefangqiao_Actions )
endfunction
