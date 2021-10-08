
//===========================================================================
// Trigger: LearnNight
//===========================================================================
function Trig_LearnNight_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A05H' 
endfunction

function Trig_LearnNight_Actions takes nothing returns nothing
call startnight(GetTriggerUnit())
call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_LearnNight takes nothing returns nothing
    set gg_trg_LearnNight = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnNight, Condition( function Trig_LearnNight_Conditions ) )
    call TriggerAddAction( gg_trg_LearnNight, function Trig_LearnNight_Actions )
endfunction
