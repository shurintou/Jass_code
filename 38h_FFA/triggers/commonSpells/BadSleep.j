
//===========================================================================
// Trigger: BadSleep
//===========================================================================
function Trig_BadSleep_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AUsl' 
endfunction


function BSCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local real hp=0
local real hr=0

if GetUnitAbilityLevel(t,'B01J')>0 or GetUnitAbilityLevel(t,'B01K')>0 or GetUnitAbilityLevel(t,'B01L')>0 then
set u=LoadUnitHandle(udg_Hash3,i,1)
set hr=60+40*GetUnitAbilityLevel(u,'AUsl')
set hp=GetUnitState(t, UNIT_STATE_LIFE)
if hp>hr then
call SetUnitState( t, UNIT_STATE_LIFE, hp-hr )
else
call SetUnitState( t, UNIT_STATE_LIFE, 1 )
endif
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction


function Trig_BadSleep_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()


if IsUnitEnemy(t, GetTriggerPlayer()) == true then
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function BSCheckLinkin)
endif

set t=null
set tm=null
endfunction

//===========================================================================
function InitTrig_BadSleep takes nothing returns nothing
    set gg_trg_BadSleep = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BadSleep, Condition( function Trig_BadSleep_Conditions ) )
    call TriggerAddAction( gg_trg_BadSleep, function Trig_BadSleep_Actions )
endfunction
