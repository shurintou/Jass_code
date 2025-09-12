
//===========================================================================
// Trigger: lianjingetharm
//===========================================================================
function Trig_lianjingetharm_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  GetUnitState(u, UNIT_STATE_LIFE) < 0.90 * GetUnitState(u, UNIT_STATE_MAX_LIFE) then
        call IssuePointOrderById( u, 852664, GetUnitX(u), GetUnitY(u) )
    endif
    call IssueImmediateOrderById( u, 852663 )
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_lianjingetharm takes nothing returns nothing
    set gg_trg_lianjingetharm = CreateTrigger(  )
    call DisableTrigger(gg_trg_lianjingetharm)
    call TriggerAddCondition( gg_trg_lianjingetharm, Condition( function Trig_lianjingetharm_Conditions ) )
    
endfunction
