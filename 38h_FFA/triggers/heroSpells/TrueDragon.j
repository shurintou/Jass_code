
//===========================================================================
// Trigger: TrueDragon
//===========================================================================
function Trig_TrueDragon_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A045' 
endfunction

function Trig_TrueDragon_Actions takes nothing returns nothing
    local integer i=GetUnitAbilityLevel(GetTriggerUnit(), 'A045' )
    call SetPlayerTechResearchedSwap( 'Rhar', i+1, GetTriggerPlayer() )
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
endfunction

//===========================================================================
function InitTrig_TrueDragon takes nothing returns nothing
    set gg_trg_TrueDragon = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_TrueDragon, Condition( function Trig_TrueDragon_Conditions ) )
    call TriggerAddAction( gg_trg_TrueDragon, function Trig_TrueDragon_Actions )
endfunction
