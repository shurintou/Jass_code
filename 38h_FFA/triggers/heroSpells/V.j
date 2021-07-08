
//===========================================================================
// Trigger: V
//===========================================================================
function Trig_V_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANcs' 
endfunction

function Trig_V_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()

call UnitAddAbility(m,'ANc1')
call SetUnitAbilityLevel(m,'ANc1',GetUnitAbilityLevel(u,'ANcs'))
call IssuePointOrderById( m, 852652,x ,y  )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call IssuePointOrderById( u, 851983, x, y )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_V takes nothing returns nothing
    set gg_trg_V = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_V, Condition( function Trig_V_Conditions ) )
    call TriggerAddAction( gg_trg_V, function Trig_V_Actions )
endfunction
