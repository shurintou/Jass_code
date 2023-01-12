
//===========================================================================
// Trigger: SiLie
//===========================================================================
function Trig_SiLie_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AW' 
endfunction

function silieshangkou takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local integer n=LoadInteger(udg_Hash2,i,2)

if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
call SaveInteger(udg_Hash2,i,2,n-1)
else
call UnitRemoveAbility(u,'A0AX')
call UnitRemoveAbility(u,'B03M')
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction



function Trig_SiLie_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm
local integer i
local unit t=GetSpellTargetUnit()
local integer hi
local integer ti=GetHandleId(t)

    if GetUnitAbilityLevel(t,'B03M')>0 then//撕裂伤口
    set i=GetHandleId(LoadTimerHandle(udg_Hash2,ti,9493))
    call SaveInteger(udg_Hash2,i,2,16)
    call SaveInteger(udg_Hash2,ti,9494,GetUnitAbilityLevel(u,'A0AW'))
    else
    set tm=CreateTimer()
    set i=GetHandleId(tm)
    call UnitAddAbility(t,'A0AX')
    call SaveTimerHandle(udg_Hash2,ti,9493,tm)
    call SaveInteger(udg_Hash2,ti,9494,GetUnitAbilityLevel(u,'A0AW'))
    call SaveInteger(udg_Hash2,i,2,16)
    call SaveUnitHandle(udg_Hash2,i,1,t)
    call TimerStart(tm,0.5,true,function silieshangkou)
    endif

set tm=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_SiLie takes nothing returns nothing
    set gg_trg_SiLie = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_SiLie, Condition( function Trig_SiLie_Conditions ) )
    call TriggerAddAction( gg_trg_SiLie, function Trig_SiLie_Actions )
endfunction
