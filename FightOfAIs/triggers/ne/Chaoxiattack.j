
//===========================================================================
// Trigger: Chaoxiattack
//===========================================================================
function Trig_Chaoxiattack_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    if  IsUnitType(t, UNIT_TYPE_STRUCTURE) == false  then
        call IssueTargetOrderById( GetTriggerUnit(), 852662, t )
    endif
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_Chaoxiattack takes nothing returns nothing
    set gg_trg_Chaoxiattack = CreateTrigger(  )
    call DisableTrigger( gg_trg_Chaoxiattack )
    call TriggerAddCondition( gg_trg_Chaoxiattack, Condition( function Trig_Chaoxiattack_Conditions ) )
endfunction
