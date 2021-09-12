
//===========================================================================
// Trigger: ThunderStorm
//===========================================================================
function Trig_ThunderStorm_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANsq' 
endfunction

function thunderstormact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u
local unit m
local integer n=LoadInteger(udg_Hash1,i,3)
local integer l=LoadInteger(udg_Hash1,i,4)
local integer level=0


if n>0 then
set u=LoadUnitHandle(udg_Hash1,i,1)
set m=LoadUnitHandle(udg_Hash1,i,2)
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
call SaveInteger(udg_Hash1,i,2,n-1)
if l>=10 then
set level=GetUnitAbilityLevel(u,'ANsq')
call HarmGroup(u,750,20+10*level)
call IssueImmediateOrderById( m, 852526 )
call SaveInteger(udg_Hash1,i,4,0)
else
call SaveInteger(udg_Hash1,i,4,l+1)
endif
else
call KillUnit(LoadUnitHandle(udg_Hash1,i,2))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction



function Trig_ThunderStorm_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local integer level=GetUnitAbilityLevel(u,'ANsq')
local unit m=CreateUnit(GetTriggerPlayer(),'n00F',x,y,0)
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

call SetUnitAbilityLevel( m, 'A079', level )
call IssueImmediateOrderById( m, 852526 )
call UnitApplyTimedLife( m, 'BHwe', 8.60 )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveInteger(udg_Hash1,i,3,161)
call SaveInteger(udg_Hash1,i,4,0)
call TimerStart(tm,0.05,true,function thunderstormact)

set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_ThunderStorm takes nothing returns nothing
    set gg_trg_ThunderStorm = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ThunderStorm, Condition( function Trig_ThunderStorm_Conditions ) )
    call TriggerAddAction( gg_trg_ThunderStorm, function Trig_ThunderStorm_Actions )
endfunction
