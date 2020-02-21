
//===========================================================================
// Trigger: 未命名触发器 334
//===========================================================================
function Trig_334_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetAttacker(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'BUts') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_334_Func008Func002001001 takes nothing returns boolean
    return ( udg_gongjicishu == 5 )
endfunction

function Trig_334_Func008Func002001002 takes nothing returns boolean
    return ( udg_gongjicishu == 6 )
endfunction

function Trig_334_Func008Func002001 takes nothing returns boolean
    return GetBooleanOr( Trig_334_Func008Func002001001(), Trig_334_Func008Func002001002() )
endfunction

function Trig_334_Func008Func002002 takes nothing returns boolean
    return ( GetUnitAbilityLevelSwapped('A08O', udg_xuanyunpitiaopinan) == 2 )
endfunction

function Trig_334_Func008C takes nothing returns boolean
    if ( not GetBooleanAnd( Trig_334_Func008Func002001(), Trig_334_Func008Func002002() ) ) then
        return false
    endif
    return true
endfunction

function Trig_334_Func009Func002001 takes nothing returns boolean
    return ( udg_gongjicishu == 6 )
endfunction

function Trig_334_Func009Func002002 takes nothing returns boolean
    return ( GetUnitAbilityLevelSwapped('A08O', udg_xuanyunpitiaopinan) == 1 )
endfunction

function Trig_334_Func009C takes nothing returns boolean
    if ( not GetBooleanAnd( Trig_334_Func009Func002001(), Trig_334_Func009Func002002() ) ) then
        return false
    endif
    return true
endfunction

function Trig_334_Actions takes nothing returns nothing
    set udg_xuanyunpiwanjia = GetTriggerPlayer()
    set udg_xuanyunpidanwei = GetLastCreatedUnit()
    set udg_gongjicishu = GetRandomInt(1, 8)
    set udg_xuanyunpitiaopinan = GetTriggerUnit()
    set udg_xuanyunpimubiao = GetAttacker()
    set udg_tiaopiweizhi = GetUnitLoc(udg_xuanyunpitiaopinan)
    if ( Trig_334_Func008C() ) then
        call CreateNUnitsAtLoc( 1, 'n01Y', udg_xuanyunpiwanjia, udg_tiaopiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 5.00, 'BHwe', udg_xuanyunpidanwei )
        call SetUnitAnimation( udg_xuanyunpitiaopinan, "slam" )
        call TriggerSleepAction( 0.40 )
        call IssueImmediateOrder( udg_xuanyunpidanwei, "stomp" )
        call ResetUnitAnimation( udg_xuanyunpitiaopinan )
        call RemoveLocation( udg_tiaopiweizhi )
    else
    endif
    if ( Trig_334_Func009C() ) then
        call CreateNUnitsAtLoc( 1, 'n01X', udg_xuanyunpiwanjia, udg_tiaopiweizhi, bj_UNIT_FACING )
        call UnitApplyTimedLifeBJ( 5.00, 'BHwe', udg_xuanyunpidanwei )
        call SetUnitAnimation( udg_xuanyunpitiaopinan, "slam" )
        call TriggerSleepAction( 0.40 )
        call IssueImmediateOrder( udg_xuanyunpidanwei, "stomp" )
        call ResetUnitAnimation( udg_xuanyunpitiaopinan )
        call RemoveLocation( udg_tiaopiweizhi )
    else
    endif
endfunction

//===========================================================================
function InitTrig_334 takes nothing returns nothing
    set gg_trg_334 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_334, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_334, Condition( function Trig_334_Conditions ) )
    call TriggerAddAction( gg_trg_334, function Trig_334_Actions )
endfunction
