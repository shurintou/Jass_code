
//===========================================================================
// Trigger: EatBrain
//===========================================================================
function Trig_EatBrain_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03L' 
endfunction


function EBCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local real r=0


if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,i,1)
set r=75*GetUnitAbilityLevel(u,'A03L')
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+r )
call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), t, r, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl", t, "chest") )
endif


call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction


function Trig_EatBrain_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function EBCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_EatBrain takes nothing returns nothing
    set gg_trg_EatBrain = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_EatBrain, Condition( function Trig_EatBrain_Conditions ) )
    call TriggerAddAction( gg_trg_EatBrain, function Trig_EatBrain_Actions )
endfunction
