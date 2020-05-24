
//===========================================================================
// Trigger: 未命名触发器 337
//===========================================================================
function Trig_337_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A08V' ) ) then
        return false
    endif
    return true
endfunction

function Trig_337_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A08V', udg_fenlitiaopinan) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_337_Func006C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A08V', udg_fenlitiaopinan) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_337_Func007C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A08V', udg_fenlitiaopinan) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_337_Func008C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A08V', udg_fenlitiaopinan) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_337_Actions takes nothing returns nothing
    set udg_fenlitiaopinan = GetTriggerUnit()
    set udg_fenlidanweiweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_fenliwanjia = GetTriggerPlayer()
    set udg_fenlidanwei = bj_lastCreatedUnit
    if ( Trig_337_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'n021', udg_fenliwanjia, udg_fenlidanweiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 4.00, 'BHwe', udg_fenlidanwei )
        call TriggerSleepAction( 0.20 )
        call IssuePointOrderLoc( udg_fenlidanwei, "silence", udg_fenlidanweiweizhi )
        call TriggerSleepAction( 0.20 )
        call RemoveLocation( udg_fenlidanweiweizhi )
    else
    endif
    if ( Trig_337_Func006C() ) then
        call CreateNUnitsAtLoc( 1, 'n022', udg_fenliwanjia, udg_fenlidanweiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 4.00, 'BHwe', udg_fenlidanwei )
        call TriggerSleepAction( 0.20 )
        call IssuePointOrderLoc( udg_fenlidanwei, "silence", udg_fenlidanweiweizhi )
        call TriggerSleepAction( 0.20 )
        call RemoveLocation( udg_fenlidanweiweizhi )
    else
    endif
    if ( Trig_337_Func007C() ) then
        call CreateNUnitsAtLoc( 1, 'n023', udg_fenliwanjia, udg_fenlidanweiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 4.00, 'BHwe', udg_fenlidanwei )
        call TriggerSleepAction( 0.20 )
        call IssuePointOrderLoc( udg_fenlidanwei, "silence", udg_fenlidanweiweizhi )
        call TriggerSleepAction( 0.20 )
        call RemoveLocation( udg_fenlidanweiweizhi )
    else
    endif
    if ( Trig_337_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'n024', udg_fenliwanjia, udg_fenlidanweiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 4.00, 'BHwe', udg_fenlidanwei )
        call TriggerSleepAction( 0.20 )
        call IssuePointOrderLoc( udg_fenlidanwei, "silence", udg_fenlidanweiweizhi )
        call TriggerSleepAction( 0.20 )
        call RemoveLocation( udg_fenlidanweiweizhi )
    else
    endif
endfunction

//===========================================================================
function InitTrig_337 takes nothing returns nothing
    set gg_trg_337 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_337, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_337, Condition( function Trig_337_Conditions ) )
    call TriggerAddAction( gg_trg_337, function Trig_337_Actions )
endfunction
