
//===========================================================================
// Trigger: HolyKill
//===========================================================================
function Trig_HolyKill_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A02U' 
endfunction

function HKCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
set m=CreateUnit(GetOwningPlayer(u),'n00T',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
call UnitAddAbility(m,'ANfd')
call SetUnitAbilityLevel( m, 'ANfd',GetUnitAbilityLevel(u,'A02U'))
call IssueTargetOrderById( m, 852230, t )
call UnitDamageTarget( m, t, 150+300*GetUnitAbilityLevel(u,'A02U'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", t, "chest") )
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


function Trig_HolyKill_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function HKCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_HolyKill takes nothing returns nothing
    set gg_trg_HolyKill = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HolyKill, Condition( function Trig_HolyKill_Conditions ) )
    call TriggerAddAction( gg_trg_HolyKill, function Trig_HolyKill_Actions )
endfunction
