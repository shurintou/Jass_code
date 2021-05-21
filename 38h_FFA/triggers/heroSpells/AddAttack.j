
//===========================================================================
// Trigger: AddAttack
//===========================================================================
function Trig_AddAttack_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'ANbl' 
endfunction

function Trig_AddAttack_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'ANbl' )
    if i==1 then
    call UnitAddAbility( u, 'AIth' )
    else
    call SetUnitAbilityLevel( u, 'AIth', i )
    call SetUnitAbilityLevel( u, 'A086', i )
    endif
    if i==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_AddAttack takes nothing returns nothing
    set gg_trg_AddAttack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AddAttack, Condition( function Trig_AddAttack_Conditions ) )
    call TriggerAddAction( gg_trg_AddAttack, function Trig_AddAttack_Actions )
endfunction
