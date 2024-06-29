
//===========================================================================
// Trigger: destroyer
//===========================================================================
function Trig_destroyer_Conditions takes nothing returns boolean
    local unit u= GetTrainedUnit()
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if GetUnitTypeId(u) == 'uobs' and GetRandomInt(0,3)<=2 then
            call IssueImmediateOrderById( u, 852531 )
        endif
        if i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'uobs' )
        elseif i==2 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'uabo' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'umtw' )
        endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_destroyer takes nothing returns nothing
    set gg_trg_destroyer = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_destroyer, Condition( function Trig_destroyer_Conditions ) )
endfunction
