
//===========================================================================
// Trigger: 未命名触发器 027
//===========================================================================
function Trig_027_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0AS' ) ) then
        return false
    endif
    return true
endfunction

function Trig_027_Actions takes nothing returns nothing
    set udg_binghuodanweididian = GetUnitLoc(GetTriggerUnit())
    set udg_binghuoshifangdian = GetSpellTargetLoc()
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
function InitTrig_027 takes nothing returns nothing
    set gg_trg_027 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_027, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_027, Condition( function Trig_027_Conditions ) )
    call TriggerAddAction( gg_trg_027, function Trig_027_Actions )
endfunction
