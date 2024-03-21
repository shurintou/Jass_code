
//===========================================================================
// Trigger: TC
//===========================================================================
function Trig_TC_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    
    call IssuePointOrderById(u, 852125, GetUnitX(u), GetUnitY(u) )
    if IsUnitType(t, UNIT_TYPE_HERO) == true and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        
        call IssueImmediateOrderById(u, 852127 )
    endif
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_TC takes nothing returns nothing
    set gg_trg_TC = CreateTrigger(  )
    call DisableTrigger( gg_trg_TC )
    call TriggerAddCondition( gg_trg_TC, Condition( function Trig_TC_Conditions ) )
endfunction
