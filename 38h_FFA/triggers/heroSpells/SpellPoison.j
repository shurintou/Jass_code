
//===========================================================================
// Trigger: SpellPoison
//===========================================================================
function Trig_SpellPoison_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANba' 
endfunction

function Trig_SpellPoison_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real r=GetUnitState(u, UNIT_STATE_LIFE)
local unit m=CreateUnit(GetOwningPlayer(u),'owyv',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))

call SetUnitFlyHeight( m, GetUnitFlyHeight(u), 5000.00 )
call SetUnitAbilityLevel(m,'AEpa',GetUnitAbilityLevel(u,'ANba'))
if r>20 then
call SetUnitState( u, UNIT_STATE_LIFE, r-19 )
else
call SetUnitState( u, UNIT_STATE_LIFE, 1 )
endif
call IssueTargetOrderById( m, 851985, GetSpellTargetUnit())
call UnitApplyTimedLife( m, 'BTLF', 1.50 )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_SpellPoison takes nothing returns nothing
    set gg_trg_SpellPoison = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_SpellPoison, Condition( function Trig_SpellPoison_Conditions ) )
    call TriggerAddAction( gg_trg_SpellPoison, function Trig_SpellPoison_Actions )
endfunction
