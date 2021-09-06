
//===========================================================================
// Trigger: LearnInvisable
//===========================================================================
function Trig_LearnInvisable_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'Apiv' 
endfunction

function Trig_LearnInvisable_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'Apiv' )
    if i==1 then
    call UnitAddAbility( u, 'A05Z' )
    call TriggerRegisterUnitEvent( gg_trg_AttackBack, u, EVENT_UNIT_TARGET_IN_RANGE )
    else
    call SetUnitAbilityLevel( u, 'A05Z', i )
    endif
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_LearnInvisable takes nothing returns nothing
    set gg_trg_LearnInvisable = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnInvisable, Condition( function Trig_LearnInvisable_Conditions ) )
    call TriggerAddAction( gg_trg_LearnInvisable, function Trig_LearnInvisable_Actions )
endfunction
