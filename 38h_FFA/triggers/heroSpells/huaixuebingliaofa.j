
//===========================================================================
// Trigger: huaixuebingliaofa
//===========================================================================
function Trig_huaixuebingliaofa_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0DZ' 
endfunction

function removehuaixue takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local player p=GetOwningPlayer(u)
call SetPlayerAbilityAvailable( p, 'A0DZ', true )
call UnitRemoveAbility(u, 'A0E1' )
call UnitRemoveAbility(u, 'A0E2' )
//call DestroyEffect(LoadEffectHandle(udg_Hash1,i,2))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set u=null
set p=null
set tm=null
endfunction



function Trig_huaixuebingliaofa_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer level=GetUnitAbilityLevel(u, 'A0DZ')
local real r=GetUnitState(u, UNIT_STATE_MAX_LIFE)-GetUnitState(u, UNIT_STATE_LIFE)
local player p=GetTriggerPlayer()
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+((0.15+0.05*level)*r) )
call SetPlayerAbilityAvailable( p, 'A0E1', false )
call SetPlayerAbilityAvailable( p, 'A0DZ', false )
call UnitAddAbility(u, 'A0E1' )
call UnitAddAbility(u, 'A0E2' )
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
//call SaveEffectHandle(udg_Hash1,GetHandleId(tm),2,AddSpecialEffectTarget("Abilities\\Spells\\Human\\ManaShield\\ManaShieldCaster.mdl",u, "origin"))
call TimerStart(tm,2.5+0.5*level,false,function removehuaixue)
call yichubuff(u)

set u=null
set p=null
set tm=null
endfunction

//===========================================================================
function InitTrig_huaixuebingliaofa takes nothing returns nothing
    set gg_trg_huaixuebingliaofa = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_huaixuebingliaofa, Condition( function Trig_huaixuebingliaofa_Conditions ) )
    call TriggerAddAction( gg_trg_huaixuebingliaofa, function Trig_huaixuebingliaofa_Actions )
endfunction
