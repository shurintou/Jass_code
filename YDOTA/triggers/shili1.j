
//===========================================================================
// Trigger: shili1
//===========================================================================
function Trig_shili1_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(gg_unit_haro_0136, UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('hrif', Player(10)) < 21 ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('hfoo', Player(10)) < 21 ) ) then
        return false
    endif
    return true
endfunction

function Trig_shili1_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_shili11111111111111 )
    call DisableTrigger( gg_trg_shili1111 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_shili1 takes nothing returns nothing
    set gg_trg_shili1 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shili1, 7.00 )
    call TriggerAddCondition( gg_trg_shili1, Condition( function Trig_shili1_Conditions ) )
    call TriggerAddAction( gg_trg_shili1, function Trig_shili1_Actions )
endfunction
