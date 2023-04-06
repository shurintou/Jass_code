
//===========================================================================
// Trigger: huoxueshu
//===========================================================================
function Trig_huoxueshu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09U' 
endfunction


function huoxuehuihu takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local integer n=LoadInteger(udg_Hash2,i,2)
local integer sx
local integer level
local real b
local integer hi
if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then

set level=LoadInteger(udg_Hash2,i,3)
   if GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)<0.3 then
   set b=0.15*level
   else
   set b=0.05*level
   endif
set sx=LoadInteger(udg_Hash2,i,4)
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+b*sx+2*level )
call SaveInteger(udg_Hash2,i,2,n-1)

else

call UnitRemoveAbility(u,'A09T')
call UnitRemoveAbility(u,'B038')
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)

endif

set tm=null
set u=null
endfunction

function Trig_huoxueshu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm
local integer i
local unit t=GetSpellTargetUnit()
local integer hi

    if GetUnitAbilityLevel(t,'B038')>0 then//活血术
    set i=GetHandleId(LoadTimerHandle(udg_Hash2,GetHandleId(t),6420))
    call SaveInteger(udg_Hash2,i,2,32)
    call SaveInteger(udg_Hash2,i,3,GetUnitAbilityLevel(u,'A09U'))
    else
    set tm=CreateTimer()
    set i=GetHandleId(tm)
    call UnitAddAbility(t,'A09T')
    call SaveTimerHandle(udg_Hash2,GetHandleId(t),6420,tm)
    call SaveInteger(udg_Hash2,i,3,GetUnitAbilityLevel(u,'A09U'))
    call SaveInteger(udg_Hash2,i,2,32)
    call SaveUnitHandle(udg_Hash2,i,1,t)
    set hi=LoadInteger(udg_Hash2,GetHandleId(t),8529)
       if hi==1 then
       call SaveInteger(udg_Hash2,i,4,GetHeroStr(u, true))
       else 
       if hi==2 then
       call SaveInteger(udg_Hash2,i,4,GetHeroAgi(u, true))
       else
       call SaveInteger(udg_Hash2,i,4,GetHeroInt(u, true))
       endif
       endif
    call TimerStart(tm,0.5,true,function huoxuehuihu)
    endif

set tm=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_huoxueshu takes nothing returns nothing
    set gg_trg_huoxueshu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_huoxueshu, Condition( function Trig_huoxueshu_Conditions ) )
    call TriggerAddAction( gg_trg_huoxueshu, function Trig_huoxueshu_Actions )
endfunction
