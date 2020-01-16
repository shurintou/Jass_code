
//===========================================================================
// Trigger: 未命名触发器 009
//===========================================================================
function Trig_009_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A047' ) ) then
        return false
    endif
    return true
endfunction

function Trig_009_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A047', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_009_Actions takes nothing returns nothing
    set udg_binglianchuanjiandanwei = GetLastCreatedUnit()
    set udg_binglianwanjia = GetTriggerPlayer()
    set udg_binglianweizhi = GetSpellTargetLoc()
    if ( Trig_009_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n00V', udg_binglianwanjia, udg_binglianweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 25.00, 'BTLF', udg_binglianchuanjiandanwei )
        call TriggerSleepAction( 0.50 )
        call IssueImmediateOrder( udg_binglianchuanjiandanwei, "whirlwind" )
        call RemoveLocation( udg_binglianweizhi )
    else
        call CreateNUnitsAtLoc( 1, 'n00W', udg_binglianwanjia, udg_binglianweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 25.00, 'BTLF', udg_binglianchuanjiandanwei )
        call TriggerSleepAction( 0.50 )
        call IssueImmediateOrder( udg_binglianchuanjiandanwei, "whirlwind" )
        call RemoveLocation( udg_binglianweizhi )
    endif
endfunction

//===========================================================================
function InitTrig_009 takes nothing returns nothing
    set gg_trg_009 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_009, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_009, Condition( function Trig_009_Conditions ) )
    call TriggerAddAction( gg_trg_009, function Trig_009_Actions )
endfunction
