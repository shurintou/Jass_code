
//===========================================================================
// Trigger: 未命名触发器 320
//===========================================================================
function Trig_320_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'S001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_320_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('S001', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_320_Actions takes nothing returns nothing
    set udg_dizhendidian = GetSpellTargetLoc()
    set udg_aaa = GetTriggerPlayer()
    set udg_dizhendanwei1 = GetLastCreatedUnit()
    if ( Trig_320_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n01O', udg_aaa, udg_dizhendidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_dizhendanwei1 )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_dizhendanwei1, "rainoffire", udg_dizhendidian )
        call TriggerSleepAction( 20.00 )
        call RemoveUnit( udg_dizhendanwei1 )
        call RemoveLocation( udg_dizhendidian )
    else
        call CreateNUnitsAtLoc( 1, 'n01P', udg_aaa, udg_dizhendidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_dizhendanwei1 )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_dizhendanwei1, "rainoffire", udg_dizhendidian )
        call TriggerSleepAction( 20.00 )
        call RemoveUnit( udg_dizhendanwei1 )
        call RemoveLocation( udg_dizhendidian )
    endif
endfunction

//===========================================================================
function InitTrig_320 takes nothing returns nothing
    set gg_trg_320 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_320, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_320, Condition( function Trig_320_Conditions ) )
    call TriggerAddAction( gg_trg_320, function Trig_320_Actions )
endfunction
