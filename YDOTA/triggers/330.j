
//===========================================================================
// Trigger: 未命名触发器 330
//===========================================================================
function Trig_330_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A08I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_330_Func008C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A08I', udg_EEEE) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_330_Actions takes nothing returns nothing
    set udg_zhendong = String2OrderIdBJ("shakebody")
    set udg_beijiantadanwei = GetEnumUnit()
    set udg_jiantachufadanweiweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_jiantashanghai = GetLastCreatedUnit()
    set udg_jiantawanjia = GetTriggerPlayer()
    set udg_EEEE = GetTriggerUnit()
    set udg_jiantaweizhi = GetSpellTargetLoc()
    if ( Trig_330_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'n01V', udg_jiantawanjia, udg_jiantaweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_jiantashanghai )
        call TriggerSleepAction( 1.10 )
        call IssueImmediateOrder( udg_jiantashanghai, "whirlwind" )
        call TriggerSleepAction( 20.00 )
        call RemoveLocation( udg_jiantaweizhi )
        call RemoveLocation( udg_jiantachufadanweiweizhi )
    else
        call CreateNUnitsAtLoc( 1, 'n01W', udg_jiantawanjia, udg_jiantaweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_jiantashanghai )
        call TriggerSleepAction( 1.10 )
        call IssueImmediateOrder( udg_jiantashanghai, "whirlwind" )
        call TriggerSleepAction( 20.00 )
        call RemoveLocation( udg_jiantaweizhi )
        call RemoveLocation( udg_jiantachufadanweiweizhi )
    endif
endfunction

//===========================================================================
function InitTrig_330 takes nothing returns nothing
    set gg_trg_330 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_330, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_330, Condition( function Trig_330_Conditions ) )
    call TriggerAddAction( gg_trg_330, function Trig_330_Actions )
endfunction
