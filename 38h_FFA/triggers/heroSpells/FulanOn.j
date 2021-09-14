
//===========================================================================
// Trigger: FulanOn
//===========================================================================
function Trig_FulanOn_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer level
    if  GetIssuedOrderId() == 852177 and IsUnitType(u, UNIT_TYPE_POLYMORPHED)==false and IsUnitType(u, UNIT_TYPE_STUNNED)==false and IsUnitType(u, UNIT_TYPE_SLEEPING) == false then
    set level=GetUnitAbilityLevel(u,'A01J')
    call UnitAddAbility( u, 'A036' )
    call UnitAddAbility( u, 'A037' )
    call SetUnitAbilityLevel( u, 'A036', level )
    call SetUnitAbilityLevel( u, 'A037', level )    
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_FulanOn takes nothing returns nothing
    set gg_trg_FulanOn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FulanOn, Condition( function Trig_FulanOn_Conditions ) )
endfunction
