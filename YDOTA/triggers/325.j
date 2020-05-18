
//===========================================================================
// Trigger: 未命名触发器 325
//===========================================================================
function Trig_325_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A072' ) ) then
        return false
    endif
    return true
endfunction

function Trig_325_Actions takes nothing returns nothing
    set udg_dianjidianzhenweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_CCC = GetTriggerPlayer()
    set udg_dianjidianzhendanwei = GetLastCreatedUnit()
    call UnitApplyTimedLifeBJ( 17.00, 'BHwe', udg_dianjidianzhendanwei )
    call TriggerSleepAction( 0.50 )
    call IssuePointOrderLoc( udg_dianjidianzhendanwei, "blizzard", udg_dianjidianzhenweizhi )
    call TriggerSleepAction( 17.00 )
    call RemoveLocation( udg_dianjidianzhenweizhi )
endfunction

//===========================================================================
function InitTrig_325 takes nothing returns nothing
    set gg_trg_325 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_325, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_325, Condition( function Trig_325_Conditions ) )
    call TriggerAddAction( gg_trg_325, function Trig_325_Actions )
endfunction
