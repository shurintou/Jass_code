
//===========================================================================
// Trigger: 未命名触发器 326
//===========================================================================
function Trig_326_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A072' ) ) then
        return false
    endif
    return true
endfunction

function Trig_326_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A072', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_326_Actions takes nothing returns nothing
    set udg_dianjidianzhenweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_CCC = GetTriggerPlayer()
    set udg_dianjidianzhendanwei = GetLastCreatedUnit()
    if ( Trig_326_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n01T', udg_CCC, udg_dianjidianzhenweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 17.00, 'BHwe', udg_dianjidianzhendanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_dianjidianzhendanwei, "blizzard", udg_dianjidianzhenweizhi )
        call TriggerSleepAction( 17.00 )
        call RemoveLocation( udg_dianjidianzhenweizhi )
    else
        call CreateNUnitsAtLoc( 1, 'n01U', udg_CCC, udg_dianjidianzhenweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 17.00, 'BHwe', udg_dianjidianzhendanwei )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_dianjidianzhendanwei, "blizzard", udg_dianjidianzhenweizhi )
        call TriggerSleepAction( 17.00 )
        call RemoveLocation( udg_dianjidianzhenweizhi )
    endif
endfunction

//===========================================================================
function InitTrig_326 takes nothing returns nothing
    set gg_trg_326 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_326, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_326, Condition( function Trig_326_Conditions ) )
    call TriggerAddAction( gg_trg_326, function Trig_326_Actions )
endfunction
