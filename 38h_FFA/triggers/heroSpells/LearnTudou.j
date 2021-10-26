
//===========================================================================
// Trigger: LearnTudou
//===========================================================================
function Trig_LearnTudou_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'AUin' 
endfunction

function Trig_LearnTudou_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'AUin' )
    call SetPlayerTechResearchedSwap( 'Rume', i, GetOwningPlayer(u) )
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_LearnTudou takes nothing returns nothing
    set gg_trg_LearnTudou = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnTudou, Condition( function Trig_LearnTudou_Conditions ) )
    call TriggerAddAction( gg_trg_LearnTudou, function Trig_LearnTudou_Actions )
endfunction
