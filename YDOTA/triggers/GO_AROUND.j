
//===========================================================================
// Trigger: GO AROUND
//===========================================================================
function Trig_GO_AROUND_Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_GO_AROUND_Func001A takes nothing returns nothing
    if ( Trig_GO_AROUND_Func001Func001C() ) then
        call SetUnitPositionLocFacingLocBJ( GetEnumUnit(), PolarProjectionBJ(GetUnitLoc(udg_DH), DistanceBetweenPoints(GetUnitLoc(udg_DH), GetUnitLoc(GetEnumUnit())), ( AngleBetweenPoints(GetUnitLoc(udg_DH), GetUnitLoc(GetEnumUnit())) + 6.00 )), GetUnitLoc(udg_DH) )
    else
    endif
endfunction

function Trig_GO_AROUND_Actions takes nothing returns nothing
    call ForGroupBJ( udg_nongminzu, function Trig_GO_AROUND_Func001A )
endfunction

//===========================================================================
function InitTrig_GO_AROUND takes nothing returns nothing
    set gg_trg_GO_AROUND = CreateTrigger(  )
    call DisableTrigger( gg_trg_GO_AROUND )
    call TriggerRegisterTimerEventPeriodic( gg_trg_GO_AROUND, 0.05 )
    call TriggerAddAction( gg_trg_GO_AROUND, function Trig_GO_AROUND_Actions )
endfunction
