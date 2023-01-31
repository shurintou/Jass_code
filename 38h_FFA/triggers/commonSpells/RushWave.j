
//===========================================================================
// Trigger: RushWave
//===========================================================================
function Trig_RushWave_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A055' 
endfunction

function Trig_RushWave_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local integer level=GetUnitAbilityLevel(u,'A055')
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)


set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
call UnitAddAbility( m, 'ACc2' )
call SetUnitAbilityLevel( m, 'ACc2', level )
call IssuePointOrder( m, "carrionswarm", sx, sy )
call UnitApplyTimedLife( m, 'BTLF', 5 )




set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_RushWave takes nothing returns nothing
    set gg_trg_RushWave = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_RushWave, Condition( function Trig_RushWave_Conditions ) )
    call TriggerAddAction( gg_trg_RushWave, function Trig_RushWave_Actions )
endfunction
