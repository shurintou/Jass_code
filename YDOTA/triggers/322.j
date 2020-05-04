
//===========================================================================
// Trigger: 未命名触发器 322
//===========================================================================
function Trig_322_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A068' ) ) then
        return false
    endif
    return true
endfunction

function Trig_322_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A068', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_322_Actions takes nothing returns nothing
    set udg_BBB = GetTriggerPlayer()
    set udg_shenglingshuilangdidian = GetSpellTargetLoc()
    set udg_shenglingshuilang = GetLastCreatedUnit()
    if ( Trig_322_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n01Q', udg_BBB, udg_shenglingshuilangdidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_shenglingshuilang )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_shenglingshuilang, "blizzard", udg_shenglingshuilangdidian )
        call TriggerSleepAction( 20.00 )
        call RemoveLocation( udg_shenglingshuilangdidian )
    else
        call CreateNUnitsAtLoc( 1, 'n01R', udg_BBB, udg_shenglingshuilangdidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_shenglingshuilang )
        call TriggerSleepAction( 0.50 )
        call IssuePointOrderLoc( udg_shenglingshuilang, "blizzard", udg_shenglingshuilangdidian )
        call TriggerSleepAction( 20.00 )
        call RemoveLocation( udg_shenglingshuilangdidian )
    endif
endfunction

//===========================================================================
function InitTrig_322 takes nothing returns nothing
    set gg_trg_322 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_322, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_322, Condition( function Trig_322_Conditions ) )
    call TriggerAddAction( gg_trg_322, function Trig_322_Actions )
endfunction
