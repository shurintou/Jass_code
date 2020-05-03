
//===========================================================================
// Trigger: 未命名触发器 036
//===========================================================================
function Trig_036_Func001C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ohun' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ucry' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ebal' ) ) then
        return true
    endif
    return false
endfunction

function Trig_036_Conditions takes nothing returns boolean
    if ( not Trig_036_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_036_Actions takes nothing returns nothing
    set udg_Zhongxin043 = GetRectCenter(gg_rct_043)
    set udg_Zhongxin039 = GetRectCenter(gg_rct_039)
    set udg_Zhongxin035 = GetRectCenter(gg_rct_035)
    set udg_Zhongxin037 = GetRectCenter(gg_rct_037)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin043 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin039 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin035 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin037 )
endfunction

//===========================================================================
function InitTrig_036 takes nothing returns nothing
    set gg_trg_036 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_036, gg_rct_008 )
    call TriggerAddCondition( gg_trg_036, Condition( function Trig_036_Conditions ) )
    call TriggerAddAction( gg_trg_036, function Trig_036_Actions )
endfunction
