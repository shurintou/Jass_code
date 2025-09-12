
//===========================================================================
// Trigger: jiaoying
//===========================================================================
function Trig_jiaoying_Conditions takes nothing returns boolean
    local integer i
    local unit u=GetTrainedUnit()
    if GetUnitTypeId(u) == 'ehip' then
        call IssueImmediateOrderById(u , 852508 )
    endif
    if  GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'ehip' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'efdr' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'edot' )
        endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_jiaoying takes nothing returns nothing
    set gg_trg_jiaoying = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jiaoying, Condition( function Trig_jiaoying_Conditions ) )
endfunction
