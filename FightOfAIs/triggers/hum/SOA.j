
//===========================================================================
// Trigger: SOA
//===========================================================================
function Trig_SOA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitAbilityLevel(u,'A01E',l)
    call SetUnitAbilityLevel(u,'A01G',l)
    call SetUnitAbilityLevel(u,'A011',l)
    call SetUnitAbilityLevel(u,'A00V',l)
    call IssueImmediateOrderById( u, 852183 )
    call IssueImmediateOrderById( u, 852097 )
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_SOA takes nothing returns nothing
    set gg_trg_SOA = CreateTrigger(  )
    call DisableTrigger( gg_trg_SOA )
    call TriggerAddCondition( gg_trg_SOA, Condition( function Trig_SOA_Conditions ) )
endfunction
