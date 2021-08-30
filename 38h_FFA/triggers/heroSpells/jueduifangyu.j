
//===========================================================================
// Trigger: jueduifangyu
//
// local unit u
// local group g
// local unit m
// local real hr=0.0
// local player p
// set u=LoadUnitHandle(udg_Hash1,i,1)
// set g=CreateGroup()
// set p=GetOwningPlayer(u)
// set hr=GetUnitAbilityLevel(u, 'A0CE')*40
// call GroupEnumUnitsInRange(g,GetUnitX(t),GetUnitX(t),450,null) 
// loop
// exitwhen IsUnitGroupEmptyBJ(g) == true
// set m=FirstOfGroup(g)
// if IsUnitIdType(GetUnitTypeId(m), UNIT_TYPE_STRUCTURE) == false and GetUnitState(m, UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(m, p) == true then
// call UnitDamageTarget( u, m, hr, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
// call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl", m, "origin") )
// endif
// call GroupRemoveUnit(g,m)
// endloop
// call GroupClear(g)
// call DestroyGroup(g)
//===========================================================================
function Trig_jueduifangyu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CE' 
endfunction





function fangyuact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,2)


if GetUnitAbilityLevel(t, 'B043')==0 or GetUnitAbilityLevel(t, 'B041')==0  then

call UnitRemoveAbility(t,'B042')
call UnitRemoveAbility(t,'B043')
call UnitRemoveAbility(t,'B041')
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm) 
endif


set t=null
set tm=null
endfunction





function Trig_jueduifangyu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)


call UnitAddAbility( m, 'A0CD' )
call UnitApplyTimedLife( m, 'BTLF', 6)
call IssueTargetOrderById( m, 854299, t )
call IssueTargetOrder(m, "spiritlink", t )
call SaveUnitHandle(udg_Hash1,i,2,t)
//call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,0.07,true,function fangyuact)

set tm=null
set t=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_jueduifangyu takes nothing returns nothing
    set gg_trg_jueduifangyu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jueduifangyu, Condition( function Trig_jueduifangyu_Conditions ) )
    call TriggerAddAction( gg_trg_jueduifangyu, function Trig_jueduifangyu_Actions )
endfunction
