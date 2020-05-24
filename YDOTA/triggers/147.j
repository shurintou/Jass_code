
//===========================================================================
// Trigger: 未命名触发器 147
//===========================================================================
function Trig_147_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BI' ) ) then
        return false
    endif
    return true
endfunction

function Trig_147_Actions takes nothing returns nothing
    set udg_leishenzhinuweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_leishenzhinuchuangjiandanwei = GetLastCreatedUnit()
    set udg_leishenzhinuwanjia = GetTriggerPlayer()
    set udg_leishenzhinudanwei = GetTriggerUnit()
    call UnitApplyTimedLifeBJ( 10.00, 'BHwe', udg_leishenzhinuchuangjiandanwei )
    call IssueImmediateOrder( udg_leishenzhinuchuangjiandanwei, "starfall" )
    call PolledWait( 5.00 )
    call RemoveLocation( udg_leishenzhinuweizhi )
endfunction

//===========================================================================
function InitTrig_147 takes nothing returns nothing
    set gg_trg_147 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_147, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_147, Condition( function Trig_147_Conditions ) )
    call TriggerAddAction( gg_trg_147, function Trig_147_Actions )
endfunction
