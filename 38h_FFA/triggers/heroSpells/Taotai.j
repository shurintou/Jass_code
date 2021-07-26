
//===========================================================================
// Trigger: Taotai
//===========================================================================
function Trig_Taotai_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02T' 
endfunction

function TcheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer m=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local unit u
local integer i=0

if UnitHasBuffBJ(t,'BUhf') then
set u=LoadUnitHandle(udg_Hash3,m,1)
set i=150+(150*GetUnitAbilityLevel(u,'A02T'))
if GetUnitState(t, UNIT_STATE_LIFE)<i then
call UnitDamageTarget( u, t, 99999, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS )
endif
call UnitDamageTarget( u, t, 50+(100*GetUnitAbilityLevel(u,'A02T')), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl", t, "chest") )
else
endif
call UnitRemoveAbility(t,'BUhf')

call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tm)
call DestroyTimer(tm)

set u=null
set t=null
set tm=null
endfunction

function Trig_Taotai_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function TcheckLinkin)

set tm=null
set m=null
set t=null 
endfunction

//===========================================================================
function InitTrig_Taotai takes nothing returns nothing
    set gg_trg_Taotai = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Taotai, Condition( function Trig_Taotai_Conditions ) )
    call TriggerAddAction( gg_trg_Taotai, function Trig_Taotai_Actions )
endfunction
