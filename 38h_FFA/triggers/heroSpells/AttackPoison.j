
//===========================================================================
// Trigger: AttackPoison
//
// 不能被禁魔啊
// 攻击单位不能是魔免的啊
//===========================================================================
function Trig_AttackPoison_Conditions takes nothing returns boolean
    return IsUnitType(GetEventTargetUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true and UnitHasBuffBJ(GetTriggerUnit(), 'BNso') == false
endfunction

function Trig_AttackPoison_Actions takes nothing returns nothing
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
call IssueTargetOrderById( m, 851985, GetEventTargetUnit())
call UnitApplyTimedLife( m, 'BTLF', 1.50 )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_AttackPoison takes nothing returns nothing
    set gg_trg_AttackPoison = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AttackPoison, Condition( function Trig_AttackPoison_Conditions ) )
    call TriggerAddAction( gg_trg_AttackPoison, function Trig_AttackPoison_Actions )
endfunction
