
//===========================================================================
// Trigger: phonix
//===========================================================================
function Trig_phonix_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'AHpx' 
endfunction

function Trig_phonix_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'AHpx' )
    call SetPlayerTechResearchedSwap( 'Rhan', i, GetOwningPlayer(u) )
       
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    else
    endif
    
    set u=null
endfunction

//===========================================================================
function InitTrig_phonix takes nothing returns nothing
    set gg_trg_phonix = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_phonix, Condition( function Trig_phonix_Conditions ) )
    call TriggerAddAction( gg_trg_phonix, function Trig_phonix_Actions )
endfunction
