
//===========================================================================
// Trigger: 未命名触发器 008
//===========================================================================
function Trig_008_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A047' ) ) then
        return false
    endif
    return true
endfunction

function Trig_008_Actions takes nothing returns nothing
    set udg_binglianchuanjiandanwei = GetLastCreatedUnit()
    set udg_binglianwanjia = GetTriggerPlayer()
    set udg_binglianweizhi = GetSpellTargetLoc()
    call UnitApplyTimedLifeBJ( 25.00, 'BTLF', udg_binglianchuanjiandanwei )
    call TriggerSleepAction( 0.50 )
    call IssueImmediateOrder( udg_binglianchuanjiandanwei, "whirlwind" )
endfunction

//===========================================================================
function InitTrig_008 takes nothing returns nothing
    set gg_trg_008 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_008, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_008, Condition( function Trig_008_Conditions ) )
    call TriggerAddAction( gg_trg_008, function Trig_008_Actions )
endfunction
