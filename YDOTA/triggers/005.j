
//===========================================================================
// Trigger: 未命名触发器 005
//===========================================================================
function Trig_005_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A09P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_005_Actions takes nothing returns nothing
    set udg_daomoguanghuan = GetLastCreatedUnit()
    set udg_daomowanjia = GetTriggerPlayer()
    set udg_daomodidian = GetUnitLoc(GetTriggerUnit())
    set udg_daomodanwei = GetTriggerUnit()
    call UnitApplyTimedLifeBJ( 35.00, 'BHwe', udg_daomoguanghuan )
    call TriggerSleepAction( 0.40 )
    call IssueImmediateOrder( udg_daomoguanghuan, "manaflareon" )
    call TriggerSleepAction( 35.00 )
    call RemoveLocation( udg_daomodidian )
endfunction

//===========================================================================
function InitTrig_005 takes nothing returns nothing
    set gg_trg_005 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_005, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_005, Condition( function Trig_005_Conditions ) )
    call TriggerAddAction( gg_trg_005, function Trig_005_Actions )
endfunction
