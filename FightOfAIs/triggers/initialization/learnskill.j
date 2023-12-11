
//===========================================================================
// Trigger: learnskill
//===========================================================================
function Trig_learnskill_Conditions takes nothing returns boolean
    local integer l=GetLearnedSkill()
    local unit u=GetTriggerUnit()
    
    if GetUnitAbilityLevel(u,l)==3 then
        call SetUnitAbilityLevel(u,l,1)
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_learnskill takes nothing returns nothing
    set gg_trg_learnskill = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnskill, Condition( function Trig_learnskill_Conditions ) )
endfunction
