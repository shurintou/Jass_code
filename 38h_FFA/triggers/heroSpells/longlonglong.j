
//===========================================================================
// Trigger: longlonglong
//===========================================================================
function Trig_longlonglong_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0B3' 
endfunction

function Trig_longlonglong_Actions takes nothing returns nothing
    local integer level=GetUnitAbilityLevel(GetTriggerUnit(), 'A0B3')
    call SetPlayerTechResearchedSwap( 'Rhri', level, GetTriggerPlayer() )
    //call SetPlayerTechResearched(GetTriggerPlayer(), level,'Rhri' )
    if level== 4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
endfunction

//===========================================================================
function InitTrig_longlonglong takes nothing returns nothing
    set gg_trg_longlonglong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_longlonglong, Condition( function Trig_longlonglong_Conditions ) )
    call TriggerAddAction( gg_trg_longlonglong, function Trig_longlonglong_Actions )
endfunction
