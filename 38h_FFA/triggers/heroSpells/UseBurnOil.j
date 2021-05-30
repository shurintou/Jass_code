
//===========================================================================
// Trigger: UseBurnOil
//===========================================================================
function Trig_UseBurnOil_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03B' 
endfunction

function Trig_UseBurnOil_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=CreateUnit(GetTriggerPlayer(),'ocat',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
call SetUnitAbilityLevel(m,'Abof',GetUnitAbilityLevel(u,'A03B'))
call UnitApplyTimedLife( m, 'BTLF', 2.00 )
call IssuePointOrderById( m, 851984, x, y )
set m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
call UnitAddAbility(m,'A09I')
call UnitApplyTimedLife( m, 'BTLF', 2.00 )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_UseBurnOil takes nothing returns nothing
    set gg_trg_UseBurnOil = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_UseBurnOil, Condition( function Trig_UseBurnOil_Conditions ) )
    call TriggerAddAction( gg_trg_UseBurnOil, function Trig_UseBurnOil_Actions )
endfunction
