
//===========================================================================
// Trigger: ChaKeLa
//===========================================================================
function Trig_ChaKeLa_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09P' 
endfunction


function chakelaactq takes nothing returns nothing
local timer tt=GetExpiredTimer()
local integer m=GetHandleId(tt)
local integer level
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local real r
local real mr
local real dr

if UnitHasBuffBJ(t,'BUhf') then
set r=GetUnitState(t, UNIT_STATE_MAX_MANA)*0.1
set mr=GetUnitState(t, UNIT_STATE_MANA)
set level=LoadInteger(udg_Hash3,m,1)
set dr=mr-r-50*level
if dr>0 then
call SetUnitState( t, UNIT_STATE_MANA, dr )
else
call SetUnitState( t, UNIT_STATE_MANA, 0 )
endif
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", t, "origin") )
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tt)
call DestroyTimer(tt)

set tt=null
set t=null
endfunction


function Trig_ChaKeLa_Actions takes nothing returns nothing
local timer tm
local integer i
local unit m
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A09P')

if IsUnitEnemy(t, GetTriggerPlayer()) == true then
set tm=CreateTimer()
set i=GetHandleId(tm)
set m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveInteger(udg_Hash3,i,1,level)
call TimerStart(tm,0.01,false,function chakelaactq)
else
call SetUnitState( t, UNIT_STATE_MANA, GetUnitState(t, UNIT_STATE_MANA)+75*level )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", t, "origin") )
endif


set tm=null
set m=null
set t=null
set u=null
endfunction

//===========================================================================
function InitTrig_ChaKeLa takes nothing returns nothing
    set gg_trg_ChaKeLa = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ChaKeLa, Condition( function Trig_ChaKeLa_Conditions ) )
    call TriggerAddAction( gg_trg_ChaKeLa, function Trig_ChaKeLa_Actions )
endfunction
