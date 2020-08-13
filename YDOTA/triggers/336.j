
//===========================================================================
// Trigger: 未命名触发器 336
//===========================================================================
function Trig_336_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A08V' ) ) then
        return false
    endif
    return true
endfunction

function Trig_336_Actions takes nothing returns nothing
    set udg_fenlitiaopinan = GetTriggerUnit()
    set udg_fenlidanweiweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_fenliwanjia = GetTriggerPlayer()
    set udg_fenlidanwei = bj_lastCreatedUnit
    call UnitApplyTimedLifeBJ( 4.00, 'BHwe', udg_fenlidanwei )
    call TriggerSleepAction( 0.20 )
    call IssuePointOrderLoc( udg_fenlidanwei, "silence", udg_fenlidanweiweizhi )
    call TriggerSleepAction( 0.20 )
    call RemoveLocation( udg_fenlidanweiweizhi )
endfunction

//===========================================================================
function InitTrig_336 takes nothing returns nothing
    set gg_trg_336 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_336, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_336, Condition( function Trig_336_Conditions ) )
    call TriggerAddAction( gg_trg_336, function Trig_336_Actions )
endfunction
