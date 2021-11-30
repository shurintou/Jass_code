
//===========================================================================
// Trigger: LearnAddAttackSpeed
//===========================================================================
function Trig_LearnAddAttackSpeed_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'ANic' 
endfunction

function Trig_LearnAddAttackSpeed_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
call UnitAddAbility( u, 'A02X' )
call TriggerRegisterUnitEvent( gg_trg_AddAttackSpeed, u, EVENT_UNIT_TARGET_IN_RANGE )
call DestroyTrigger( GetTriggeringTrigger() )
set u=null
endfunction


//===========================================================================
function InitTrig_LearnAddAttackSpeed takes nothing returns nothing
    set gg_trg_LearnAddAttackSpeed = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnAddAttackSpeed, Condition( function Trig_LearnAddAttackSpeed_Conditions ) )
    call TriggerAddAction( gg_trg_LearnAddAttackSpeed, function Trig_LearnAddAttackSpeed_Actions )
endfunction
