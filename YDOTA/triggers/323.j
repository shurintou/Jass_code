
//===========================================================================
// Trigger: 未命名触发器 323
//===========================================================================
function Trig_323_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A068' ) ) then
        return false
    endif
    return true
endfunction

function Trig_323_Actions takes nothing returns nothing
    set udg_BBB = GetTriggerPlayer()
    set udg_shenglingshuilangdidian = GetSpellTargetLoc()
    set udg_shenglingshuilang = GetLastCreatedUnit()
    call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_shenglingshuilang )
    call TriggerSleepAction( 0.50 )
    call IssuePointOrderLoc( udg_shenglingshuilang, "blizzard", udg_shenglingshuilangdidian )
    call TriggerSleepAction( 20.00 )
    call RemoveLocation( udg_shenglingshuilangdidian )
endfunction

//===========================================================================
function InitTrig_323 takes nothing returns nothing
    set gg_trg_323 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_323, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_323, Condition( function Trig_323_Conditions ) )
    call TriggerAddAction( gg_trg_323, function Trig_323_Actions )
endfunction
