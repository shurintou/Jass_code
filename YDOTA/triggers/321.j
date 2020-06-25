
//===========================================================================
// Trigger: 未命名触发器 321
//===========================================================================
function Trig_321_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'S001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_321_Actions takes nothing returns nothing
    set udg_dizhendidian = GetSpellTargetLoc()
    set udg_aaa = GetTriggerPlayer()
    set udg_dizhendanwei1 = GetLastCreatedUnit()
    call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_dizhendanwei1 )
    call TriggerSleepAction( 0.50 )
    call IssuePointOrderLoc( udg_dizhendanwei1, "rainoffire", udg_dizhendidian )
    call TriggerSleepAction( 20.00 )
    call RemoveUnit( udg_dizhendanwei1 )
    call RemoveLocation( udg_dizhendidian )
endfunction

//===========================================================================
function InitTrig_321 takes nothing returns nothing
    set gg_trg_321 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_321, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_321, Condition( function Trig_321_Conditions ) )
    call TriggerAddAction( gg_trg_321, function Trig_321_Actions )
endfunction
