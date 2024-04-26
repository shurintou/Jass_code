
//===========================================================================
// Trigger: Arthasgetharm
//===========================================================================
function Trig_Arthasgetharm_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  GetUnitState(u, UNIT_STATE_LIFE) > 0.40 * GetUnitState(u, UNIT_STATE_MAX_LIFE) then
        call IssueImmediateOrderById( u, 852526 )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_Arthasgetharm takes nothing returns nothing
    set gg_trg_Arthasgetharm = CreateTrigger(  )
    call DisableTrigger(gg_trg_Arthasgetharm)
    call TriggerAddCondition( gg_trg_Arthasgetharm, Condition( function Trig_Arthasgetharm_Conditions ) )
    
endfunction
