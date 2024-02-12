
//===========================================================================
// Trigger: tanke
//===========================================================================
function Trig_tanke_Conditions takes nothing returns boolean
    local integer i
    if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)<90 then
        set i=GetRandomInt(0,2)
        if i==0 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'hrtt' )
        elseif i==1 then
            call IssueImmediateOrderById( GetTriggerUnit(), 'hgyr' )
        else
            call IssueImmediateOrderById( GetTriggerUnit(), 'hmtm' )
        endif
    endif
    
    return false
endfunction



//===========================================================================
function InitTrig_tanke takes nothing returns nothing
    set gg_trg_tanke = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_tanke, Condition( function Trig_tanke_Conditions ) )
endfunction
