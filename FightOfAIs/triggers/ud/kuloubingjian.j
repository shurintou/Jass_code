
//===========================================================================
// Trigger: kuloubingjian
//
// 
//===========================================================================
function Trig_kuloubingjian_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r
    local unit t=GetEventTargetUnit()
    local integer le=GetHeroLevel(u)
    local integer i=R2I((le-3)/7)
    local integer g=R2I(le/3)+40
    call SetUnitAbilityLevel(u,'A02W',i)
    set r=GetUnitState(t, UNIT_STATE_MAX_LIFE)
    set i=R2I((r-GetUnitState(t, UNIT_STATE_LIFE))/r*50)
    if i>g then
        call SetUnitAbilityLevel( u, 'A02T', g )
    else
        call SetUnitAbilityLevel( u, 'A02T', i )
    endif
    call IssueImmediateOrderById( u, 852100 )
    call IssueTargetOrderById( u, 852095, t)
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_kuloubingjian takes nothing returns nothing
    set gg_trg_kuloubingjian = CreateTrigger(  )
    call DisableTrigger( gg_trg_kuloubingjian )
    call TriggerAddCondition( gg_trg_kuloubingjian, Condition( function Trig_kuloubingjian_Conditions ) )
endfunction
