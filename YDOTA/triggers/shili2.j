//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: shili2
//===========================================================================
function Trig_shili2_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(gg_unit_nshr_0152, UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('ohun', Player(11)) < 21 ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('nzom', Player(11)) < 21 ) ) then
        return false
    endif
    return true
endfunction

function Trig_shili2_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_shili22222222222222 )
    call DisableTrigger( gg_trg_shili2222 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_shili2 takes nothing returns nothing
    set gg_trg_shili2 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shili2, 7.00 )
    call TriggerAddCondition( gg_trg_shili2, Condition( function Trig_shili2_Conditions ) )
    call TriggerAddAction( gg_trg_shili2, function Trig_shili2_Actions )
endfunction
