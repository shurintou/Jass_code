
//===========================================================================
// Trigger: 未命名触发器 035
//===========================================================================
function Trig_035_Func005C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nzom' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nchg' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nfov' ) ) then
        return true
    endif
    return false
endfunction

function Trig_035_Conditions takes nothing returns boolean
    if ( not Trig_035_Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_035_Actions takes nothing returns nothing
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
function InitTrig_035 takes nothing returns nothing
    set gg_trg_035 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_035, gg_rct_028 )
    call TriggerAddCondition( gg_trg_035, Condition( function Trig_035_Conditions ) )
    call TriggerAddAction( gg_trg_035, function Trig_035_Actions )
endfunction
