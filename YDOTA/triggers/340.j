
//===========================================================================
// Trigger: 未命名触发器 340
//===========================================================================
function Trig_340_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A035' ) ) then
        return false
    endif
    return true
endfunction

function Trig_340_Actions takes nothing returns nothing
    set udg_wuyunfuzhudanwei = bj_lastCreatedUnit
    set udg_wuyundanwei = GetTriggerUnit()
    set udg_wuyunwanjia = GetTriggerPlayer()
    set udg_wuyunjinengdian = GetSpellTargetLoc()
    call UnitApplyTimedLifeBJ( 21.00, 'BHwe', udg_wuyunfuzhudanwei )
    call TriggerSleepAction( 0.50 )
    call IssuePointOrderLoc( udg_wuyunfuzhudanwei, "cloudoffog", udg_wuyunjinengdian )
    call TriggerSleepAction( 21.00 )
    call RemoveLocation( udg_wuyunjinengdian )
endfunction

//===========================================================================
function InitTrig_340 takes nothing returns nothing
    set gg_trg_340 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_340, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_340, Condition( function Trig_340_Conditions ) )
    call TriggerAddAction( gg_trg_340, function Trig_340_Actions )
endfunction
