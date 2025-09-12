
//===========================================================================
// Trigger: fishmanstomp
//===========================================================================
function Trig_fishmanstomp_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitAbilityLevel( u, 'A01D', i )
    call SetUnitAbilityLevel( u, 'A01B', i )
    call SetUnitAbilityLevel( u, 'A01C', i+GetUnitAbilityLevel(u,'B01T') )
    call IssueImmediateOrderById(u, 852127 )
    set u=null
    return false
    
endfunction



//===========================================================================
function InitTrig_fishmanstomp takes nothing returns nothing
    set gg_trg_fishmanstomp = CreateTrigger(  )
    call DisableTrigger(gg_trg_fishmanstomp)
    call TriggerAddCondition( gg_trg_fishmanstomp, Condition( function Trig_fishmanstomp_Conditions ) )
    
endfunction
