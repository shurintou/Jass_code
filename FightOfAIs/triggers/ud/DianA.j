
//===========================================================================
// Trigger: DianA
//===========================================================================
function Trig_DianA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    if  IsUnitType(t, UNIT_TYPE_HERO) == true then
        if IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
            call IssueTargetOrderById( u, 852230, t )
        endif
    else
        call IssuePointOrderById( u, 852504, GetUnitX(t), GetUnitY(t) )
    endif
    if GetUnitState(t, UNIT_STATE_LIFE)>600 then
        call IssueTargetOrderById( u, 852095, t )
    endif
    set u=null
    set t=null
    return false
endfunction

//===========================================================================
function InitTrig_DianA takes nothing returns nothing
    set gg_trg_DianA = CreateTrigger(  )
    call DisableTrigger( gg_trg_DianA )
    call TriggerAddCondition( gg_trg_DianA, Condition( function Trig_DianA_Conditions ) )
endfunction
