
//===========================================================================
// Trigger: meihuodanwei
//===========================================================================
function Trig_meihuodanwei_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    call IssuePointOrderById( u, 852218, GetUnitX(t), GetUnitY(t) )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueImmediateOrderById( u, 852183 )
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_meihuodanwei takes nothing returns nothing
    set gg_trg_meihuodanwei = CreateTrigger(  )
    call DisableTrigger( gg_trg_meihuodanwei)
    call TriggerAddCondition( gg_trg_meihuodanwei, Condition( function Trig_meihuodanwei_Conditions ) )
    
endfunction
