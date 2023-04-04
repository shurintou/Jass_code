
//===========================================================================
// Trigger: DeadRush
//===========================================================================
function Trig_DeadRush_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04M' 
endfunction

function Trig_DeadRush_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A04M')
local unit m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)

call UnitAddAbility( m, 'A04N' )
call SetUnitAbilityLevel( m, 'A04N', level )
call UnitAddAbility( m, 'A04O' )
call SetUnitAbilityLevel( m, 'A04O', level )
call IssueImmediateOrderById( m, 852526 )
call IssueImmediateOrderById( m, 852526 )
call UnitApplyTimedLife( m, 'BTLF', 2 )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_DeadRush takes nothing returns nothing
    set gg_trg_DeadRush = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DeadRush, Condition( function Trig_DeadRush_Conditions ) )
    call TriggerAddAction( gg_trg_DeadRush, function Trig_DeadRush_Actions )
endfunction
