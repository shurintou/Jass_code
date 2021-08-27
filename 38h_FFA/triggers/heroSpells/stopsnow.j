
//===========================================================================
// Trigger: stopsnow
//===========================================================================
function Trig_stopsnow_Conditions takes nothing returns boolean
        return GetSpellAbilityId() == 'A03S'
endfunction

function Trig_stopsnow_Actions takes nothing returns nothing
call KillUnit( LoadUnitHandle(udg_Hash1,GetHandleId(GetTriggerUnit()),249) )
endfunction

//===========================================================================
function InitTrig_stopsnow takes nothing returns nothing
    set gg_trg_stopsnow = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_stopsnow, Condition( function Trig_stopsnow_Conditions ) )
    call TriggerAddAction( gg_trg_stopsnow, function Trig_stopsnow_Actions )
endfunction
