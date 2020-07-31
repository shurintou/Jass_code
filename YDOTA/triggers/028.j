
//===========================================================================
// Trigger: 未命名触发器 028
//===========================================================================
function Trig_028_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0AY' ) ) then
        return false
    endif
    return true
endfunction

function Trig_028_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0AY', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_028_Actions takes nothing returns nothing
    set udg_yaokongchuangjiandanwei = GetLastCreatedUnit()
    set udg_yaokongwanjia = GetTriggerPlayer()
    set udg_yaokongdidian = GetSpellTargetLoc()
    if ( Trig_028_Func004C() ) then
        call CreateNUnitsAtLoc( 1, 'n02W', udg_yaokongwanjia, udg_yaokongdidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 480.00, 'BTLF', udg_yaokongchuangjiandanwei )
        call TriggerSleepAction( 3.00 )
        call RemoveLocation( udg_yaokongdidian )
    else
        call CreateNUnitsAtLoc( 1, 'n02X', udg_yaokongwanjia, udg_yaokongdidian, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 480.00, 'BTLF', udg_yaokongchuangjiandanwei )
        call TriggerSleepAction( 3.00 )
        call RemoveLocation( udg_yaokongdidian )
    endif
endfunction

//===========================================================================
function InitTrig_028 takes nothing returns nothing
    set gg_trg_028 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_028, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_028, Condition( function Trig_028_Conditions ) )
    call TriggerAddAction( gg_trg_028, function Trig_028_Actions )
endfunction
