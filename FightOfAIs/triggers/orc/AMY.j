
//===========================================================================
// Trigger: AMY
//===========================================================================
function Trig_AMY_Conditions takes nothing returns boolean
    call IssueImmediateOrderById( GetTriggerUnit(), 852183 )
    return false
    
endfunction



//===========================================================================
function InitTrig_AMY takes nothing returns nothing
    set gg_trg_AMY = CreateTrigger(  )
    call DisableTrigger( gg_trg_AMY )
    call TriggerAddCondition( gg_trg_AMY, Condition( function Trig_AMY_Conditions ) )
endfunction
