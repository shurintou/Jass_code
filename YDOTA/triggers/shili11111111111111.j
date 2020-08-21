
//===========================================================================
// Trigger: shili11111111111111
//===========================================================================
function Trig_shili11111111111111_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(gg_unit_haro_0136, UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('hmtm', Player(10)) < 21 ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('hkni', Player(10)) < 21 ) ) then
        return false
    endif
    return true
endfunction

function Trig_shili11111111111111_Actions takes nothing returns nothing
    set udg_Zhongxin000 = GetRectCenter(gg_rct_000)
    set udg_Zhongxin001 = GetRectCenter(gg_rct_001)
    set udg_Zhongxin002 = GetRectCenter(gg_rct_002)
    set udg_Zhongxin011 = GetRectCenter(gg_rct_011)
    set udg_Zhongxin012 = GetRectCenter(gg_rct_012)
    set udg_Zhongxin035 = GetRectCenter(gg_rct_035)
    call CreateNUnitsAtLoc( 1, 'hkni', Player(10), udg_Zhongxin002, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'hkni', Player(10), udg_Zhongxin035, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'hkni', Player(10), udg_Zhongxin000, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'hmtm', Player(10), udg_Zhongxin012, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'hmtm', Player(10), udg_Zhongxin011, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'hmtm', Player(10), udg_Zhongxin001, bj_UNIT_FACING )
endfunction

//===========================================================================
function InitTrig_shili11111111111111 takes nothing returns nothing
    set gg_trg_shili11111111111111 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shili11111111111111, 8.00 )
    call TriggerAddCondition( gg_trg_shili11111111111111, Condition( function Trig_shili11111111111111_Conditions ) )
    call TriggerAddAction( gg_trg_shili11111111111111, function Trig_shili11111111111111_Actions )
endfunction
