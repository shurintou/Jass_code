
//===========================================================================
// Trigger: mages
//===========================================================================
function Trig_mages_Conditions takes nothing returns boolean
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'hmpr' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'hsor' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'hspt' )
        endif
    endif
    
    return false
endfunction



//===========================================================================
function InitTrig_mages takes nothing returns nothing
    set gg_trg_mages = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_mages, Condition( function Trig_mages_Conditions ) )
endfunction
