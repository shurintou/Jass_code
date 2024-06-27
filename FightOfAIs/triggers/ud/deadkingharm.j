
//===========================================================================
// Trigger: deadkingharm
//===========================================================================
function Trig_deadkingharm_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventDamageSource()
    
    call IssuePointOrderById( u, 852089, GetUnitX(t), GetUnitY(t) )
    
    call IssueImmediateOrderById( u, 852180 )
    call IssueImmediateOrderById( u, 852554 )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_deadkingharm takes nothing returns nothing
    set gg_trg_deadkingharm = CreateTrigger(  )
    call DisableTrigger( gg_trg_deadkingharm )
    call TriggerAddCondition( gg_trg_deadkingharm, Condition( function Trig_deadkingharm_Conditions ) )
endfunction
