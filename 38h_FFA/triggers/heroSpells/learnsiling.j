
//===========================================================================
// Trigger: learnsiling
//===========================================================================
function Trig_learnsiling_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0B6' 
endfunction

function Trig_learnsiling_Actions takes nothing returns nothing
    local integer level=GetUnitAbilityLevel(GetTriggerUnit(), 'A0B6')
    if level>1 then
    call SetPlayerTechResearchedSwap( 'Rura',level-1 , GetTriggerPlayer() )
    endif
    if level==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
endfunction

//===========================================================================
function InitTrig_learnsiling takes nothing returns nothing
    set gg_trg_learnsiling = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnsiling, Condition( function Trig_learnsiling_Conditions ) )
    call TriggerAddAction( gg_trg_learnsiling, function Trig_learnsiling_Actions )
endfunction
