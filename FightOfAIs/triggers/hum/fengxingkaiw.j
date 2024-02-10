
//===========================================================================
// Trigger: fengxingkaiw
//===========================================================================
function Trig_fengxingkaiw_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)<0.6 then
        call IssueImmediateOrderById( u, 852184 )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_fengxingkaiw takes nothing returns nothing
    set gg_trg_fengxingkaiw = CreateTrigger(  )
    call DisableTrigger(gg_trg_fengxingkaiw)
    call TriggerAddCondition( gg_trg_fengxingkaiw, Condition( function Trig_fengxingkaiw_Conditions ) )
    
endfunction
