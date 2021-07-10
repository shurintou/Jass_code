
//===========================================================================
// Trigger: asdqweqwe
//===========================================================================
function Trig_asdqweqwe_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03M' 
endfunction


function esfwewerwer takes nothing returns nothing
local integer i=GetHandleId(GetExpiredTimer())
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local unit m=LoadUnitHandle(udg_Hash1,i,2)
call SetUnitState( u, UNIT_STATE_MANA, ( GetUnitState(u, UNIT_STATE_MANA) + 0.08*GetUnitState(m, UNIT_STATE_MAX_MANA) ) )
call SetUnitState( m, UNIT_STATE_MANA, ( GetUnitState(m, UNIT_STATE_MANA) - 0.08*GetUnitState(m, UNIT_STATE_MAX_MANA) ) )
set u=null
set m=null
endfunction

function Trig_asdqweqwe_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local unit m=GetSpellTargetUnit()
local integer i=GetHandleId(tm)
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveTimerHandle(udg_Hash1,GetHandleId(u),627,tm)
call TimerStart(tm,1,true,function esfwewerwer)
set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_asdqweqwe takes nothing returns nothing
    set gg_trg_asdqweqwe = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_asdqweqwe, Condition( function Trig_asdqweqwe_Conditions ) )
    call TriggerAddAction( gg_trg_asdqweqwe, function Trig_asdqweqwe_Actions )
endfunction
