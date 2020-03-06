
//===========================================================================
// Trigger: 未命名触发器 168
//===========================================================================
function Trig_168_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A033' ) ) then
        return false
    endif
    return true
endfunction

function Trig_168_Actions takes nothing returns nothing
    set udg_chuansongweizhi = GetSpellTargetLoc()
    set udg_chuansongchuangjiandanwei = GetLastCreatedUnit()
    set udg_chuansongwanjia = GetTriggerPlayer()
    call TriggerSleepAction( 3.00 )
    call SetUnitPositionLoc( GetTriggerUnit(), udg_chuansongweizhi )
    call UnitApplyTimedLifeBJ( 5.00, 'BTLF', udg_chuansongchuangjiandanwei )
    call SetUnitAbilityLevelSwapped( 'A02U', udg_chuansongchuangjiandanwei, GetUnitAbilityLevelSwapped('A033', GetTriggerUnit()) )
    call IssueImmediateOrder( udg_chuansongchuangjiandanwei, "stomp" )
    call TriggerSleepAction( 1.50 )
    call RemoveLocation( udg_chuansongweizhi )
endfunction

//===========================================================================
function InitTrig_168 takes nothing returns nothing
    set gg_trg_168 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_168, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_168, Condition( function Trig_168_Conditions ) )
    call TriggerAddAction( gg_trg_168, function Trig_168_Actions )
endfunction
