
//===========================================================================
// Trigger: GromTaunt
//===========================================================================
function Trig_GromTaunt_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i
    if GetUnitAbilityLevel(u, 'BNbr') >0 then
        call IssueImmediateOrderById( u, 852520 )
        set i=R2I((GetHeroLevel(u)-3)/7)
        call SetUnitAbilityLevel(u,'ANbr',i)
        call SetUnitAbilityLevel(u,'A00N',i)
    else
        call IssueImmediateOrderById( u, 852599 )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_GromTaunt takes nothing returns nothing
    set gg_trg_GromTaunt = CreateTrigger(  )
    call DisableTrigger( gg_trg_GromTaunt)
    call TriggerAddCondition( gg_trg_GromTaunt, Condition( function Trig_GromTaunt_Conditions ) )
    
endfunction
