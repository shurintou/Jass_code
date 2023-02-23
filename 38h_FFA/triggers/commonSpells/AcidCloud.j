
//===========================================================================
// Trigger: AcidCloud
//===========================================================================
function Trig_AcidCloud_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A073' 
endfunction

function Trig_AcidCloud_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit m=CreateUnit(GetTriggerPlayer(),'n00I',x,y,0)
local integer level=GetUnitAbilityLevel(u, 'A073')
  
    call SetUnitAbilityLevel( m, 'A06S', level )
    call SetUnitAbilityLevel( m, 'ACrf', level )
    call IssuePointOrderById( m, 852238, x, y )
    call UnitApplyTimedLife( m, 'BTLF', 16 )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_AcidCloud takes nothing returns nothing
    set gg_trg_AcidCloud = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AcidCloud, Condition( function Trig_AcidCloud_Conditions ) )
    call TriggerAddAction( gg_trg_AcidCloud, function Trig_AcidCloud_Actions )
endfunction
