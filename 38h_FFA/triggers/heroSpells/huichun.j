
//===========================================================================
// Trigger: huichun
//
// call SetUnitState( null, UNIT_STATE_LIFE, GetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE) )
//===========================================================================
function Trig_huichun_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A0CF' 
endfunction

function Trig_huichun_Actions takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhunbeihuichun),3)
local integer level=GetUnitAbilityLevel(GetTriggerUnit(), 'A0CF')
local real r=0.2+0.2*level
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+r*GetUnitState(u, UNIT_STATE_MAX_LIFE) )
set u=null
endfunction

//===========================================================================
function InitTrig_huichun takes nothing returns nothing
    set gg_trg_huichun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_huichun, Condition( function Trig_huichun_Conditions ) )
    call TriggerAddAction( gg_trg_huichun, function Trig_huichun_Actions )
endfunction
