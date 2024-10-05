
//===========================================================================
// Trigger: bianxiong
//===========================================================================
function Trig_bianxiong_Conditions takes nothing returns boolean
    local unit u=GetTrainedUnit()
    local integer i
    if GetUnitTypeId(u) == 'edoc' then
        call IssueImmediateOrderById( u, 852138 )
    endif
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,4)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'edry' )
        elseif i<3 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'emtg' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'edoc' )
        endif
    endif
    set u=null
    return false
endfunction

//===========================================================================
function InitTrig_bianxiong takes nothing returns nothing
    set gg_trg_bianxiong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_bianxiong, Condition( function Trig_bianxiong_Conditions ) )
endfunction
