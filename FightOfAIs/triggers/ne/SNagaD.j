
//===========================================================================
// Trigger: SNagaD
//===========================================================================
function Trig_SNagaD_Conditions takes nothing returns boolean
    local unit t=GetAttacker()
    if IsUnitType(t, UNIT_TYPE_HERO) == true and IsUnitIllusion(t) == false then
        call IssueImmediateOrderById(GetTriggerUnit(),852184 )
    endif
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_SNagaD takes nothing returns nothing
    set gg_trg_SNagaD = CreateTrigger(  )
    call DisableTrigger( gg_trg_SNagaD )
    call TriggerAddCondition( gg_trg_SNagaD, Condition( function Trig_SNagaD_Conditions ) )
endfunction
