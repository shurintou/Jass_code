
//===========================================================================
// Trigger: ClapGo
//===========================================================================
function Trig_ClapGo_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06U' 
endfunction

function Trig_ClapGo_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local unit m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
call SetUnitScale( m, 2.40, 2.40, 2.40 )
call SetUnitX(u,x)
call SetUnitY(u,y)
call IssuePointOrderById( u, 851983, x, y )
call UnitAddAbility( m, 'A06V' )
call SetUnitAbilityLevel( m, 'A06V', GetUnitAbilityLevel(u, 'A06U') )
call UnitApplyTimedLife( m, 'BTLF', 6 )
call IssueImmediateOrderById( m, 852096 )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_ClapGo takes nothing returns nothing
    set gg_trg_ClapGo = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ClapGo, Condition( function Trig_ClapGo_Conditions ) )
    call TriggerAddAction( gg_trg_ClapGo, function Trig_ClapGo_Actions )
endfunction
