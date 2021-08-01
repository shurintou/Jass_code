
//===========================================================================
// Trigger: LearnFireOn
//===========================================================================
function Trig_LearnFireOn_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A03D' 
endfunction

function Trig_LearnFireOn_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local player p=GetOwningPlayer(u)
    local integer i=GetUnitAbilityLevel(u,'A03D')

    if i==1 then
    call UnitAddAbility( u, 'A03A' )
    call SetPlayerAbilityAvailable( p, 'A03A', false )
    call SetPlayerAbilityAvailable( p, 'AEar', false )
    call UnitRemoveAbility(u,'B011')
    endif
    call SetUnitAbilityLevel(u,'AEar',i)
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif

    set u=null
    set p=null
endfunction

//===========================================================================
function InitTrig_LearnFireOn takes nothing returns nothing
    set gg_trg_LearnFireOn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnFireOn, Condition( function Trig_LearnFireOn_Conditions ) )
    call TriggerAddAction( gg_trg_LearnFireOn, function Trig_LearnFireOn_Actions )
endfunction
