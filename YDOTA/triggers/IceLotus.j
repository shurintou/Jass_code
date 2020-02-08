
//===========================================================================
// Trigger: IceLotus
//===========================================================================
function Trig_IceLotus_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A09T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_IceLotus_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09T', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_IceLotus_Actions takes nothing returns nothing
    set udg_I = GetTriggerUnit()
    set udg_JIAODU = 360.00
    if ( Trig_IceLotus_Func003C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00G', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 12
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'u00N', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 200.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 30.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 6
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'u00O', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 100.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 60.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00G', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00G', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00H', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 12
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'u00P', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 200.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 30.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 6
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'u00Q', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 100.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 60.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00H', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call TriggerSleepAction( 1.00 )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call CreateNUnitsAtLoc( 1, 'o00H', GetOwningPlayer(udg_I), PolarProjectionBJ(GetUnitLoc(udg_I), 150.00, udg_JIAODU), udg_JIAODU )
            set udg_JIAODU = ( udg_JIAODU - 45.00 )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    endif
endfunction

//===========================================================================
function InitTrig_IceLotus takes nothing returns nothing
    set gg_trg_IceLotus = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_IceLotus, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_IceLotus, Condition( function Trig_IceLotus_Conditions ) )
    call TriggerAddAction( gg_trg_IceLotus, function Trig_IceLotus_Actions )
endfunction
