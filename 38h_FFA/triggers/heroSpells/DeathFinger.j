
//===========================================================================
// Trigger: DeathFinger
//===========================================================================
function Trig_DeathFinger_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A003' 
endfunction


function DFCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m
local real hr
local integer level
local real rrr
if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set level=GetUnitAbilityLevel(u,'A003')
set hr= GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE)
set m=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
set rrr=0.2+0.2*level
call UnitAddAbility(m,'A02O')
call SetUnitAbilityLevel( m, 'A02O',level)
call IssueTargetOrderById( m, 852230, t )
call UnitDamageTarget( u, t, rrr*hr, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl", t, "chest") )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
else
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
endfunction

function Trig_DeathFinger_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function DFCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_DeathFinger takes nothing returns nothing
    set gg_trg_DeathFinger = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DeathFinger, Condition( function Trig_DeathFinger_Conditions ) )
    call TriggerAddAction( gg_trg_DeathFinger, function Trig_DeathFinger_Actions )
endfunction
