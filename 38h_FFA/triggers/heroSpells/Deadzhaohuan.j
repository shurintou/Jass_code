
//===========================================================================
// Trigger: Deadzhaohuan
//
// LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_Zhuanyishanghai),1)
//===========================================================================
function Trig_Deadzhaohuan_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetTriggerUnit()) == 'u002'  
endfunction

function Trig_Deadzhaohuan_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_Zhuanyishanghai)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local group g=LoadGroupHandle(udg_Hash1,i,4)
local integer level=GetUnitAbilityLevel(u, 'A0B6')
call GroupRemoveUnit(g,GetTriggerUnit())
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+15*level )
call SetUnitAbilityLevel( u, 'A0B7', CountUnitsInGroup(g)*level )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Heal\\HealTarget.mdl", u, "chest") )
set u=null
set g=null
endfunction

//===========================================================================
function InitTrig_Deadzhaohuan takes nothing returns nothing
    set gg_trg_Deadzhaohuan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Deadzhaohuan, Condition( function Trig_Deadzhaohuan_Conditions ) )
    call TriggerAddAction( gg_trg_Deadzhaohuan, function Trig_Deadzhaohuan_Actions )
endfunction
