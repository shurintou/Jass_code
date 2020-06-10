
//===========================================================================
// Trigger: 未命名触发器 002
//===========================================================================
function Trig_002_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A09C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_002_Func004Func003002 takes nothing returns nothing
    call PauseUnitBJ( true, GetEnumUnit() )
endfunction

function Trig_002_Func004Func008002 takes nothing returns nothing
    call PauseUnitBJ( true, GetEnumUnit() )
endfunction

function Trig_002_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09C', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_002_Actions takes nothing returns nothing
    set udg_zantingdian = GetSpellTargetLoc()
    set udg_zanting1111 = GetTriggerUnit()
    set udg_zanting = GetFilterUnit()
    if ( Trig_002_Func004C() ) then
        call TriggerSleepAction( 0.40 )
        call ForGroupBJ( GetUnitsInRangeOfLocAll(512, GetUnitLoc(GetTriggerUnit())), function Trig_002_Func004Func008002 )
        call PauseUnitBJ( false, udg_zanting1111 )
        call TriggerSleepAction( 4.00 )
        call PauseAllUnitsBJ( false )
        call RemoveLocation( udg_zantingdian )
    else
        call TriggerSleepAction( 0.40 )
        call ForGroupBJ( GetUnitsInRangeOfLocAll(650.00, GetUnitLoc(GetTriggerUnit())), function Trig_002_Func004Func003002 )
        call PauseUnitBJ( false, udg_zanting1111 )
        call TriggerSleepAction( 6.00 )
        call PauseAllUnitsBJ( false )
        call RemoveLocation( udg_zantingdian )
    endif
endfunction

//===========================================================================
function InitTrig_002 takes nothing returns nothing
    set gg_trg_002 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_002, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_002, Condition( function Trig_002_Conditions ) )
    call TriggerAddAction( gg_trg_002, function Trig_002_Actions )
endfunction
