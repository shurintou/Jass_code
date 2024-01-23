
//===========================================================================
// Trigger: linghun
//===========================================================================
function Trig_linghun_Conditions takes nothing returns boolean
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'ospm' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'oshm' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'odoc' )
        endif
    endif
    
    return false
endfunction


//===========================================================================
function InitTrig_linghun takes nothing returns nothing
    set gg_trg_linghun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_linghun, Condition( function Trig_linghun_Conditions ) )
endfunction
