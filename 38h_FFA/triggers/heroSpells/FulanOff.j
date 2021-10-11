
//===========================================================================
// Trigger: FulanOff
//===========================================================================
function Trig_FulanOff_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  GetIssuedOrderId() == 852178 and IsUnitType(u, UNIT_TYPE_POLYMORPHED)==false and IsUnitType(u, UNIT_TYPE_STUNNED)==false and IsUnitType(u, UNIT_TYPE_SLEEPING) == false then
    call UnitRemoveAbility( u, 'A036' )
    call UnitRemoveAbility( u, 'A037' )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_FulanOff takes nothing returns nothing
    set gg_trg_FulanOff = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FulanOff, Condition( function Trig_FulanOff_Conditions ) )
endfunction
