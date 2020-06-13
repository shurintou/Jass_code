
//===========================================================================
// Trigger: 未命名触发器 148
//===========================================================================
function Trig_148_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BI' ) ) then
        return false
    endif
    return true
endfunction

function Trig_148_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BI', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_148_Actions takes nothing returns nothing
    set udg_leishenzhinuweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_leishenzhinuchuangjiandanwei = GetLastCreatedUnit()
    set udg_leishenzhinuwanjia = GetTriggerPlayer()
    set udg_leishenzhinudanwei = GetTriggerUnit()
    if ( Trig_148_Func005C() ) then
        call CreateNUnitsAtLoc( 1, 'n033', udg_leishenzhinuwanjia, udg_leishenzhinuweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 10.00, 'BHwe', udg_leishenzhinuchuangjiandanwei )
        call IssueImmediateOrder( udg_leishenzhinuchuangjiandanwei, "starfall" )
        call PolledWait( 5.00 )
        call RemoveLocation( udg_leishenzhinuweizhi )
    else
        call CreateNUnitsAtLoc( 1, 'n034', udg_leishenzhinuwanjia, udg_leishenzhinuweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 10.00, 'BHwe', udg_leishenzhinuchuangjiandanwei )
        call IssueImmediateOrder( udg_leishenzhinuchuangjiandanwei, "starfall" )
        call PolledWait( 5.00 )
        call RemoveLocation( udg_leishenzhinuweizhi )
    endif
endfunction

//===========================================================================
function InitTrig_148 takes nothing returns nothing
    set gg_trg_148 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_148, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_148, Condition( function Trig_148_Conditions ) )
    call TriggerAddAction( gg_trg_148, function Trig_148_Actions )
endfunction
