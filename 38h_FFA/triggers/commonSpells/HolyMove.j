
//===========================================================================
// Trigger: HolyMove
//===========================================================================
function Trig_HolyMove_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_HolyMove_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real sp=GetUnitMoveSpeed(u)
local integer level=GetUnitAbilityLevel(u, 'AOr2')
call UnitDamageTarget( u, GetEventTargetUnit(), 0.04*sp*level , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
set u=null
endfunction

//===========================================================================
function InitTrig_HolyMove takes nothing returns nothing
    set gg_trg_HolyMove = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HolyMove, Condition( function Trig_HolyMove_Conditions ) )
    call TriggerAddAction( gg_trg_HolyMove, function Trig_HolyMove_Actions )
endfunction
