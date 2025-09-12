
//===========================================================================
// Trigger: NLA
//===========================================================================
function Trig_NLA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        call IssueImmediateOrderById( u, 852183 )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_NLA takes nothing returns nothing
    set gg_trg_NLA = CreateTrigger(  )
    call DisableTrigger( gg_trg_NLA )
    call TriggerAddCondition( gg_trg_NLA, Condition( function Trig_NLA_Conditions ) )
endfunction
