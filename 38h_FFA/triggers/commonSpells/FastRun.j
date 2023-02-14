
//===========================================================================
// Trigger: FastRun
//
// 597：奔腾的Timer
//===========================================================================
function Trig_FastRun_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04Y' 
endfunction

function runact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local unit u
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,i,1)

if n>0 then
call SaveInteger(udg_Hash3,i,1,n-1)
else
set u=LoadUnitHandle(udg_Hash3,i,2)
call UnitRemoveAbility(u,'A04X')
call UnitRemoveAbility(u,'B01H')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction



function Trig_FastRun_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=GetSpellTargetUnit()
local integer i=GetHandleId(t)
local integer n=0
local timer tm=LoadTimerHandle(udg_Hash3,i,597)
local integer level=15+15*GetUnitAbilityLevel(u, 'A04Y')

if tm !=null then
call SaveInteger(udg_Hash3,GetHandleId(tm),1,level)
else
set tm=CreateTimer()
set n=GetHandleId(tm)
call SaveTimerHandle(udg_Hash3,i,597,tm)
call SaveInteger(udg_Hash3,n,1,level)
call SaveUnitHandle(udg_Hash3,n,2,t)
call UnitAddAbility(t,'A04X')
call TimerStart(tm,0.1,true,function runact)
endif

set tm=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_FastRun takes nothing returns nothing
    set gg_trg_FastRun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FastRun, Condition( function Trig_FastRun_Conditions ) )
    call TriggerAddAction( gg_trg_FastRun, function Trig_FastRun_Actions )
endfunction
