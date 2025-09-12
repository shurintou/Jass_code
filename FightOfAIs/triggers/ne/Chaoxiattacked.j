
//===========================================================================
// Trigger: Chaoxiattacked
//===========================================================================
function Trig_Chaoxiattacked_Conditions takes nothing returns boolean
    local unit t=GetAttacker()
    local unit u= GetTriggerUnit()
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueImmediateOrderById( u, 852096 )
        set udg_Chaoxi[n]=udg_Chaoxi[n]+3
    else
        call IssueImmediateOrderById( u, 852097 )
        set udg_Chaoxi[n]=udg_Chaoxi[n]+1
    endif
    if udg_Chaoxi[n]>10 then
        call SetUnitAbilityLevel(u,'A03D',3)
    elseif udg_Chaoxi[n]>5 then
        call SetUnitAbilityLevel(u,'A03D',2)
    else
        call SetUnitAbilityLevel(u,'A03D',1)
    endif
    
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_Chaoxiattacked takes nothing returns nothing
    set gg_trg_Chaoxiattacked = CreateTrigger(  )
    call DisableTrigger( gg_trg_Chaoxiattacked )
    call TriggerAddCondition( gg_trg_Chaoxiattacked, Condition( function Trig_Chaoxiattacked_Conditions ) )
endfunction
