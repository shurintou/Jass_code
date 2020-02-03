
//===========================================================================
// Trigger: shili2deyanshen
//===========================================================================
function Trig_shili2deyanshen_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(gg_unit_nshr_0152, UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('ohun', Player(11)) < 19 ) ) then
        return false
    endif
    if ( not ( CountLivingPlayerUnitsOfTypeId('nzom', Player(11)) < 19 ) ) then
        return false
    endif
    return true
endfunction

function Trig_shili2deyanshen_Actions takes nothing returns nothing
    set udg_Zhongxin006 = GetRectCenter(gg_rct_006)
    set udg_Zhongxin007 = GetRectCenter(gg_rct_007)
    set udg_Zhongxin008 = GetRectCenter(gg_rct_008)
    set udg_Zhongxin028 = GetRectCenter(gg_rct_028)
    set udg_Zhongxin029 = GetRectCenter(gg_rct_029)
    set udg_Zhongxin034 = GetRectCenter(gg_rct_034)
    call CreateNUnitsAtLoc( 1, 'nzom', Player(11), udg_Zhongxin006, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'nzom', Player(11), udg_Zhongxin028, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'nzom', Player(11), udg_Zhongxin029, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'ohun', Player(11), udg_Zhongxin007, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'ohun', Player(11), udg_Zhongxin008, bj_UNIT_FACING )
    call CreateNUnitsAtLoc( 1, 'ohun', Player(11), udg_Zhongxin034, bj_UNIT_FACING )
endfunction

//===========================================================================
function InitTrig_shili2deyanshen takes nothing returns nothing
    set gg_trg_shili2deyanshen = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_shili2deyanshen, 8.00 )
    call TriggerAddCondition( gg_trg_shili2deyanshen, Condition( function Trig_shili2deyanshen_Conditions ) )
    call TriggerAddAction( gg_trg_shili2deyanshen, function Trig_shili2deyanshen_Actions )
endfunction
