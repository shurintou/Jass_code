
//===========================================================================
// Trigger: langqi
//===========================================================================
function Trig_langqi_Conditions takes nothing returns boolean
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,6)
        if i<2 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'orai' )
        elseif i<4 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'owyv' )
        elseif i<6 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'otbr' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'okod' )
        endif
    endif
    
    return false
endfunction

//===========================================================================
function InitTrig_langqi takes nothing returns nothing
    set gg_trg_langqi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_langqi, Condition( function Trig_langqi_Conditions ) )
endfunction
