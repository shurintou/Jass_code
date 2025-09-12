
//===========================================================================
// Trigger: naga
//===========================================================================
function Trig_naga_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=GetRandomInt(0,1)
    local integer l=R2I((GetHeroLevel(u)-3)/7)
    if i==0 then
        call IssuePointOrderById( u, 852218, GetUnitX(t), GetUnitY(t) )
    else
        call IssueTargetOrderById( u, 852587, t )
    endif
    call SetUnitAbilityLevel(u,'A00D',l)
    call SetUnitAbilityLevel(u,'A009',l)
    call SetUnitAbilityLevel(u,'ANfl',l)
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_naga takes nothing returns nothing
    set gg_trg_naga = CreateTrigger(  )
    call DisableTrigger(gg_trg_naga)
    call TriggerAddCondition( gg_trg_naga, Condition( function Trig_naga_Conditions ) )
    
endfunction
