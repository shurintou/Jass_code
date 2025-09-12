
//===========================================================================
// Trigger: NLL
//===========================================================================
function Trig_NLL_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    if i==15 then
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R006', 1)
        call SetUnitAbilityLevel(u,'A052',2)
        call SetUnitAbilityLevel(u,'A051',2)
    elseif i== 19 then
        call SetUnitAbilityLevel(u,'A052',3)
        call SetUnitAbilityLevel(u,'A051',3)
        call SetUnitAbilityLevel(u,'A054',2)
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R006', 2)
    elseif i==22 then
        call SetUnitAbilityLevel(u,'A052',4)
        call SetUnitAbilityLevel(u,'A051',4)
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R006', 3)
    elseif i==24 then
        call SetUnitAbilityLevel(u,'A051',5)
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R006', 4)
    elseif i==26 then
        call SetUnitAbilityLevel(u,'A054',3)
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R006', 5)
    endif
    
    
    
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_NLL takes nothing returns nothing
    set gg_trg_NLL = CreateTrigger(  )
    call DisableTrigger( gg_trg_NLL )
    call TriggerAddCondition( gg_trg_NLL, Condition( function Trig_NLL_Conditions ) )
endfunction
