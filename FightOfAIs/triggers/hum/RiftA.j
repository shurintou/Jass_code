
//===========================================================================
// Trigger: RiftA
//===========================================================================
function Trig_RiftA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852662, t )
    endif
    call IssuePointOrderById( u, 852089, GetUnitX(t), GetUnitY(t) )
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_RiftA takes nothing returns nothing
    set gg_trg_RiftA = CreateTrigger(  )
    call DisableTrigger( gg_trg_RiftA )
    call TriggerAddCondition( gg_trg_RiftA, Condition( function Trig_RiftA_Conditions ) )
endfunction
