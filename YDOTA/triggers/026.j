
//===========================================================================
// Trigger: 未命名触发器 026
//===========================================================================
function Trig_026_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0AS' ) ) then
        return false
    endif
    return true
endfunction

function Trig_026_Actions takes nothing returns nothing
    set udg_binghuoshifangdian = GetSpellTargetLoc()
    set udg_binglianwanjia = GetTriggerPlayer()
    set udg_binghuodanweididian = GetUnitLoc(GetTriggerUnit())
    set udg_binghuochuanjiandanwei = GetLastCreatedUnit()
    set udg_binghuodanwei = GetTriggerUnit()
    call CreateNUnitsAtLoc( 1, 'n02S', GetTriggerPlayer(), udg_binghuodanweididian, bj_UNIT_FACING )
    call UnitApplyTimedLifeBJ( 5.00, 'BTLF', udg_binghuochuanjiandanwei )
    call PolledWait( 0.25 )
    call IssuePointOrderLoc( udg_binghuochuanjiandanwei, "breathoffire", udg_binghuoshifangdian )
    call TriggerSleepAction( 4.00 )
    call RemoveLocation( udg_binghuoshifangdian )
    call RemoveLocation( udg_binghuodanweididian )
endfunction

//===========================================================================
function InitTrig_026 takes nothing returns nothing
    set gg_trg_026 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_026, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_026, Condition( function Trig_026_Conditions ) )
    call TriggerAddAction( gg_trg_026, function Trig_026_Actions )
endfunction
