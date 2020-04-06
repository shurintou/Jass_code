
//===========================================================================
// Trigger: 未命名触发器 006
//===========================================================================
function Trig_006_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A09P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_006_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09O', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_006_Actions takes nothing returns nothing
    set udg_daomoguanghuan = GetLastCreatedUnit()
    set udg_daomowanjia = GetTriggerPlayer()
    set udg_daomodidian = GetUnitLoc(GetTriggerUnit())
    set udg_daomodanwei = GetTriggerUnit()
    if ( Trig_006_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'n02H', udg_daomowanjia, udg_daomodidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 35.00, 'BHwe', udg_daomoguanghuan )
        call TriggerSleepAction( 0.40 )
        call IssueImmediateOrder( udg_daomoguanghuan, "manaflareon" )
        call TriggerSleepAction( 35.00 )
        call RemoveLocation( udg_daomodidian )
    else
        call CreateNUnitsAtLoc( 1, 'n02I', udg_daomowanjia, udg_daomodidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 35.00, 'BHwe', udg_daomoguanghuan )
        call TriggerSleepAction( 0.40 )
        call IssueImmediateOrder( udg_daomoguanghuan, "manaflareon" )
        call TriggerSleepAction( 35.00 )
        call RemoveLocation( udg_daomodidian )
    endif
endfunction

//===========================================================================
function InitTrig_006 takes nothing returns nothing
    set gg_trg_006 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_006, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_006, Condition( function Trig_006_Conditions ) )
    call TriggerAddAction( gg_trg_006, function Trig_006_Actions )
endfunction
