
//===========================================================================
// Trigger: SNagaA
//===========================================================================
function Trig_SNagaA_Conditions takes nothing returns boolean
    
    local unit u=GetTriggerUnit()
    
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    
    call SetUnitAbilityLevel( u, 'A06E', i )
    call SetUnitAbilityLevel( u, 'A06F', i )
    call SetUnitAbilityLevel( u, 'A06H', i )
    call SetUnitAbilityLevel( u, 'A06I', i )
    
    if GetOwningPlayer(u) != Player(0) then
        call IssueImmediateOrderById( u, 852183 )
        call IssueTargetOrderById(     u, 852095,     GetEventTargetUnit() )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_SNagaA takes nothing returns nothing
    set gg_trg_SNagaA = CreateTrigger(  )
    call DisableTrigger( gg_trg_SNagaA )
    call TriggerAddCondition( gg_trg_SNagaA, Condition( function Trig_SNagaA_Conditions ) )
    
endfunction
