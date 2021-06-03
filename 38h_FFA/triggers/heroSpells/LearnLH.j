
//===========================================================================
// Trigger: LearnLH
//===========================================================================
function minusLH takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(GetExpiredTimer()),1)
local integer g=GetHandleId(u)
local integer i=LoadInteger(udg_Hash1,g,754)
if i<3+3*GetUnitAbilityLevel(u,'A0AO') then
call SaveInteger(udg_Hash1,g,754,i+1)
else
endif
set u=null
endfunction



function Trig_LearnLH_Conditions takes nothing returns boolean
    local timer tm
    if  GetLearnedSkill() == 'A0AO'  then
    set tm=CreateTimer()
    call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,GetTriggerUnit())
    call TimerStart(tm,10,true,function minusLH)
    call TriggerRegisterUnitEvent( gg_trg_LessHarm, GetTriggerUnit(), EVENT_UNIT_DAMAGED )   
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_LearnLH takes nothing returns nothing
    set gg_trg_LearnLH = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnLH, Condition( function Trig_LearnLH_Conditions ) )
endfunction
