
//===========================================================================
// Trigger: jianzhushengji
//===========================================================================
function Trig_jianzhushengji_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if GetUnitTypeId(u)=='ostr' then
        call IssueImmediateOrderById( u, 'ofrt' )
    else
        call IssueImmediateOrderById( u, 'hcas' )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_jianzhushengji takes nothing returns nothing
    set gg_trg_jianzhushengji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jianzhushengji, Condition( function Trig_jianzhushengji_Conditions ) )
endfunction
