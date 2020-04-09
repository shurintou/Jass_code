
//===========================================================================
// Trigger: 未命名触发器 341
//===========================================================================
function Trig_341_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A035' ) ) then
        return false
    endif
    return true
endfunction

function Trig_341_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_341_Func006C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_341_Func007C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_341_Func008C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A035', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_341_Actions takes nothing returns nothing
    set udg_wuyunfuzhudanwei = bj_lastCreatedUnit
    set udg_wuyundanwei = GetTriggerUnit()
    set udg_wuyunwanjia = GetTriggerPlayer()
    set udg_wuyunjinengdian = GetSpellTargetLoc()
    if ( Trig_341_Func005C() ) then
        call CreateNUnitsAtLocFacingLocBJ( 1, 'n025', udg_wuyunwanjia, udg_wuyunjinengdian, GetRectCenter(GetPlayableMapRect()) )
        call UnitApplyTimedLifeBJ( 21.00, 'BHwe', udg_wuyunfuzhudanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_wuyunfuzhudanwei, "cloudoffog", udg_wuyunjinengdian )
        call TriggerSleepAction( 21.00 )
        call RemoveLocation( udg_wuyunjinengdian )
    else
    endif
    if ( Trig_341_Func006C() ) then
        call CreateNUnitsAtLocFacingLocBJ( 1, 'n026', udg_wuyunwanjia, udg_wuyunjinengdian, GetRectCenter(GetPlayableMapRect()) )
        call UnitApplyTimedLifeBJ( 21.00, 'BHwe', udg_wuyunfuzhudanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_wuyunfuzhudanwei, "cloudoffog", udg_wuyunjinengdian )
        call TriggerSleepAction( 21.00 )
        call RemoveLocation( udg_wuyunjinengdian )
    else
    endif
    if ( Trig_341_Func007C() ) then
        call CreateNUnitsAtLocFacingLocBJ( 1, 'n027', udg_wuyunwanjia, udg_wuyunjinengdian, GetRectCenter(GetPlayableMapRect()) )
        call UnitApplyTimedLifeBJ( 21.00, 'BHwe', udg_wuyunfuzhudanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_wuyunfuzhudanwei, "cloudoffog", udg_wuyunjinengdian )
        call TriggerSleepAction( 21.00 )
        call RemoveLocation( udg_wuyunjinengdian )
    else
    endif
    if ( Trig_341_Func008C() ) then
        call CreateNUnitsAtLocFacingLocBJ( 1, 'n028', udg_wuyunwanjia, udg_wuyunjinengdian, GetRectCenter(GetPlayableMapRect()) )
        call UnitApplyTimedLifeBJ( 21.00, 'BHwe', udg_wuyunfuzhudanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_wuyunfuzhudanwei, "cloudoffog", udg_wuyunjinengdian )
        call TriggerSleepAction( 21.00 )
        call RemoveLocation( udg_wuyunjinengdian )
    else
    endif
endfunction

//===========================================================================
function InitTrig_341 takes nothing returns nothing
    set gg_trg_341 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_341, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_341, Condition( function Trig_341_Conditions ) )
    call TriggerAddAction( gg_trg_341, function Trig_341_Actions )
endfunction
