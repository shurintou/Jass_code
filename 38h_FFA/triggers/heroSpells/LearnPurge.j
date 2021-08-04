
//===========================================================================
// Trigger: LearnPurge
//===========================================================================
function Trig_LearnPurge_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'Aroc' 
endfunction

function Trig_LearnPurge_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'Aroc' )
    if i==1 then
    call UnitAddAbility( u, 'A03T' )
    call UnitMakeAbilityPermanent( u, true, 'A03T' )
    else
    call SetUnitAbilityLevel( u, 'A03T', i )
    endif
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_LearnPurge takes nothing returns nothing
    set gg_trg_LearnPurge = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnPurge, Condition( function Trig_LearnPurge_Conditions ) )
    call TriggerAddAction( gg_trg_LearnPurge, function Trig_LearnPurge_Actions )
endfunction
