
//===========================================================================
// Trigger: jiagongsiling
//
// call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
//===========================================================================
function Trig_jiagongsiling_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetSummonedUnit()) == 'u002' 
endfunction

function Trig_jiagongsiling_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_Zhuanyishanghai)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local group g=LoadGroupHandle(udg_Hash1,i,4)
local integer level=GetUnitAbilityLevel(u,'A0B6')
local integer n=CountUnitsInGroup(g)
local unit m=GetSummonedUnit()
if n>3+2*level then
call KillUnit(GroupPickRandomUnit(g))
endif
call GroupAddUnit(g,m)
call SetUnitMoveSpeed( m, GetUnitMoveSpeed(u) )
call SetUnitAbilityLevel( u, 'A0B7', n*GetUnitAbilityLevel(u, 'A0B6') )

set u=null
set m=null
set g=null
endfunction

//===========================================================================
function InitTrig_jiagongsiling takes nothing returns nothing
    set gg_trg_jiagongsiling = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jiagongsiling, Condition( function Trig_jiagongsiling_Conditions ) )
    call TriggerAddAction( gg_trg_jiagongsiling, function Trig_jiagongsiling_Actions )
endfunction
