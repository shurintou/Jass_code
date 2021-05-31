
//===========================================================================
// Trigger: swudu
//===========================================================================
function Trig_swudu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AOvd' 
endfunction

function Trig_swudu_Actions takes nothing returns nothing
call RemoveUnit(LoadUnitHandle(udg_Hash1,GetHandleId(GetTriggerUnit()),653))
endfunction

//===========================================================================
function InitTrig_swudu takes nothing returns nothing
    set gg_trg_swudu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_swudu, Condition( function Trig_swudu_Conditions ) )
    call TriggerAddAction( gg_trg_swudu, function Trig_swudu_Actions )
endfunction
