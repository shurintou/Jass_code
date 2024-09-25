
//===========================================================================
// Trigger: ac
//===========================================================================
function Trig_ac_Conditions takes nothing returns boolean
    local unit t=GetTrainedUnit()
    local integer i
    if  GetUnitTypeId(t) == 'earc'  then
        call IssueImmediateOrderById( t, 852508 )
    endif
    if  GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,3)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'ebal' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'esen' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'earc' )
        endif
    endif
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_ac takes nothing returns nothing
    set gg_trg_ac = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ac, Condition( function Trig_ac_Conditions ) )
endfunction
