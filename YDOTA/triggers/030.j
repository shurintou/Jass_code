
//===========================================================================
// Trigger: 未命名触发器 030
//===========================================================================
function Trig_030_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B4' ) ) then
        return false
    endif
    return true
endfunction

function Trig_030_Actions takes nothing returns nothing
    set udg_quanlingyuchuangjiandanwei = GetLastCreatedUnit()
    set udg_quanlingyudanwei = GetTriggerUnit()
    set udg_quanlingyudidian = GetUnitLoc(GetTriggerUnit())
    set udg_quanlingyuwanjia = GetTriggerPlayer()
    call UnitApplyTimedLifeBJ( 5.00, 'BHwe', udg_quanlingyuchuangjiandanwei )
    call IssuePointOrderLoc( udg_quanlingyuchuangjiandanwei, "silence", udg_quanlingyudidian )
    call TriggerSleepAction( 4.00 )
    call RemoveLocation( udg_quanlingyudidian )
endfunction

//===========================================================================
function InitTrig_030 takes nothing returns nothing
    set gg_trg_030 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_030, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_030, Condition( function Trig_030_Conditions ) )
    call TriggerAddAction( gg_trg_030, function Trig_030_Actions )
endfunction
