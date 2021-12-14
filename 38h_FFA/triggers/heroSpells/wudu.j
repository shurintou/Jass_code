
//===========================================================================
// Trigger: wudu
//===========================================================================
function Trig_wudu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AOvd' 
endfunction

function Trig_wudu_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(GetTriggerPlayer(),'n00J',GetUnitX(u),GetUnitY(u),0)
    call SaveUnitHandle(udg_Hash1,GetHandleId(u),653,m)
    call SetPlayerTechResearchedSwap( 'Rowd', GetUnitAbilityLevel(u, 'AOvd'), GetTriggerPlayer() )
    set u=null
    set m=null
endfunction

//===========================================================================
function InitTrig_wudu takes nothing returns nothing
    set gg_trg_wudu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_wudu, Condition( function Trig_wudu_Conditions ) )
    call TriggerAddAction( gg_trg_wudu, function Trig_wudu_Actions )
endfunction
