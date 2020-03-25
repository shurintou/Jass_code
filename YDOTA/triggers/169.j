
//===========================================================================
// Trigger: 未命名触发器 169
//===========================================================================
function Trig_169_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A033' ) ) then
        return false
    endif
    return true
endfunction

function Trig_169_Actions takes nothing returns nothing
    set udg_chuansongweizhi = GetSpellTargetLoc()
    set udg_chuansongchuangjiandanwei = GetLastCreatedUnit()
    set udg_chuansongwanjia = GetTriggerPlayer()
    call CreateNUnitsAtLoc( 1, 'n038', udg_chuansongwanjia, udg_chuansongweizhi, bj_UNIT_FACING )
    call UnitApplyTimedLifeBJ( 5.00, 'BTLF', udg_chuansongchuangjiandanwei )
    call SetUnitAbilityLevelSwapped( 'A02U', udg_chuansongchuangjiandanwei, GetUnitAbilityLevelSwapped('A033', GetTriggerUnit()) )
    call IssueImmediateOrder( udg_chuansongchuangjiandanwei, "stomp" )
endfunction

//===========================================================================
function InitTrig_169 takes nothing returns nothing
    set gg_trg_169 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_169, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_169, Condition( function Trig_169_Conditions ) )
    call TriggerAddAction( gg_trg_169, function Trig_169_Actions )
endfunction
