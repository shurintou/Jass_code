
//===========================================================================
// Trigger: MengmaH
//===========================================================================
function Trig_MengmaH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    
    
    call IssueTargetOrderById( u, 852095, GetEventDamageSource() )
    
    call IssueImmediateOrderById(u, 852127 )
    set u=null
    
    return false
endfunction



//===========================================================================
function InitTrig_MengmaH takes nothing returns nothing
    set gg_trg_MengmaH = CreateTrigger(  )
    call DisableTrigger( gg_trg_MengmaH )
    call TriggerAddCondition( gg_trg_MengmaH, Condition( function Trig_MengmaH_Conditions ) )
endfunction
