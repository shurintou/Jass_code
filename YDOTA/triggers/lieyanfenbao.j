
//===========================================================================
// Trigger: lieyanfenbao
//===========================================================================
function Trig_lieyanfenbao_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_lieyanfenbao_Func006C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A06X', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_lieyanfenbao_Func007C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A06X', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_lieyanfenbao_Func008C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A06X', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_lieyanfenbao_Func009C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A06X', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_lieyanfenbao_Actions takes nothing returns nothing
    set udg_lieyandian = GetSpellTargetLoc()
    set udg_lieyanzuihoudedanwei = GetLastCreatedUnit()
    set udg_lieyandanwei = GetTriggerUnit()
    set udg_lieyanwanjia = GetTriggerPlayer()
    call PolledWait( 0.60 )
    if ( Trig_lieyanfenbao_Func006C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 10
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 2
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_diandian = PolarProjectionBJ(udg_lieyandian, ( I2R(GetForLoopIndexA()) * 100.00 ), GetUnitFacing(GetTriggerUnit()))
                call CreateNUnitsAtLoc( 1, 'n02M', GetTriggerPlayer(), udg_diandian, bj_UNIT_FACING )
                call IssuePointOrderLoc( bj_lastCreatedUnit, "flamestrike", udg_diandian )
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
    if ( Trig_lieyanfenbao_Func007C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 10
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 2
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_diandian = PolarProjectionBJ(udg_lieyandian, ( I2R(GetForLoopIndexA()) * 100.00 ), GetUnitFacing(GetTriggerUnit()))
                call CreateNUnitsAtLoc( 1, 'n02N', GetTriggerPlayer(), udg_diandian, bj_UNIT_FACING )
                call IssuePointOrderLoc( bj_lastCreatedUnit, "flamestrike", udg_diandian )
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
    if ( Trig_lieyanfenbao_Func008C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 10
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 2
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_diandian = PolarProjectionBJ(udg_lieyandian, ( I2R(GetForLoopIndexA()) * 100.00 ), GetUnitFacing(GetTriggerUnit()))
                call CreateNUnitsAtLoc( 1, 'n02O', GetTriggerPlayer(), udg_diandian, bj_UNIT_FACING )
                call IssuePointOrderLoc( bj_lastCreatedUnit, "flamestrike", udg_diandian )
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
    if ( Trig_lieyanfenbao_Func009C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 10
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 2
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_diandian = PolarProjectionBJ(udg_lieyandian, ( I2R(GetForLoopIndexA()) * 100.00 ), GetUnitFacing(GetTriggerUnit()))
                call CreateNUnitsAtLoc( 1, 'n02P', GetTriggerPlayer(), udg_diandian, bj_UNIT_FACING )
                call IssuePointOrderLoc( bj_lastCreatedUnit, "flamestrike", udg_diandian )
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
    call PolledWait( 6.00 )
    call RemoveLocation( udg_diandian )
endfunction

//===========================================================================
function InitTrig_lieyanfenbao takes nothing returns nothing
    set gg_trg_lieyanfenbao = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_lieyanfenbao, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_lieyanfenbao, Condition( function Trig_lieyanfenbao_Conditions ) )
    call TriggerAddAction( gg_trg_lieyanfenbao, function Trig_lieyanfenbao_Actions )
endfunction
