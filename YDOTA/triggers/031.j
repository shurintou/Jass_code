
//===========================================================================
// Trigger: 未命名触发器 031
//===========================================================================
function Trig_031_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B4' ) ) then
        return false
    endif
    return true
endfunction

function Trig_031_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0B4', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_031_Actions takes nothing returns nothing
    set udg_quanlingyuchuangjiandanwei = GetLastCreatedUnit()
    set udg_quanlingyudanwei = GetTriggerUnit()
    set udg_quanlingyudidian = GetUnitLoc(GetTriggerUnit())
    set udg_quanlingyuwanjia = GetTriggerPlayer()
    if ( Trig_031_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'n02Y', udg_quanlingyuwanjia, udg_quanlingyudidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 5.00, 'BHwe', udg_quanlingyuchuangjiandanwei )
        call IssuePointOrderLoc( udg_quanlingyuchuangjiandanwei, "silence", udg_quanlingyudidian )
        call TriggerSleepAction( 4.00 )
        call RemoveLocation( udg_quanlingyudidian )
    else
        call CreateNUnitsAtLoc( 1, 'n02Z', udg_quanlingyuwanjia, udg_quanlingyudidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 5.00, 'BHwe', udg_quanlingyuchuangjiandanwei )
        call IssuePointOrderLoc( udg_quanlingyuchuangjiandanwei, "silence", udg_quanlingyudidian )
        call TriggerSleepAction( 4.00 )
        call RemoveLocation( udg_quanlingyudidian )
    endif
endfunction

//===========================================================================
function InitTrig_031 takes nothing returns nothing
    set gg_trg_031 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_031, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_031, Condition( function Trig_031_Conditions ) )
    call TriggerAddAction( gg_trg_031, function Trig_031_Actions )
endfunction
