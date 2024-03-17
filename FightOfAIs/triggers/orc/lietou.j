
//===========================================================================
// Trigger: lietou
//===========================================================================
function Trig_lietou_Conditions takes nothing returns boolean
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit() , 'otbk' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'ocat' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'ogru' )
        endif
    endif
    
    return false
endfunction


//===========================================================================
function InitTrig_lietou takes nothing returns nothing
    set gg_trg_lietou = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_lietou, Condition( function Trig_lietou_Conditions ) )
endfunction
