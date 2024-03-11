
//===========================================================================
// Trigger: pandafangda
//===========================================================================
function Trig_pandafangda_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  GetUnitState(u, UNIT_STATE_LIFE) < 0.15 * GetUnitState(u, UNIT_STATE_MAX_LIFE) then
        call IssueImmediateOrderById( u, 852586 )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_pandafangda takes nothing returns nothing
    set gg_trg_pandafangda = CreateTrigger(  )
    call DisableTrigger( gg_trg_pandafangda)
    call TriggerAddCondition( gg_trg_pandafangda, Condition( function Trig_pandafangda_Conditions ) )
    
endfunction
