
//===========================================================================
// Trigger: LightAcher
//===========================================================================
function Trig_LightAcher_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04B' 
endfunction

function Trig_LightAcher_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)

call UnitAddAbility( m, 'A04C' )
call SetUnitAbilityLevel( m, 'A04C', GetUnitAbilityLevel(u, 'A04B') )
call IssuePointOrderById( m, 852232, x, y )
call UnitApplyTimedLife( m, 'BTLF', 6 )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_LightAcher takes nothing returns nothing
    set gg_trg_LightAcher = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LightAcher, Condition( function Trig_LightAcher_Conditions ) )
    call TriggerAddAction( gg_trg_LightAcher, function Trig_LightAcher_Actions )
endfunction
