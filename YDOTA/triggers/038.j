
//===========================================================================
// Trigger: 未命名触发器 038
//===========================================================================
function Trig_038_Func001C takes nothing returns boolean
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

function Trig_038_Conditions takes nothing returns boolean
    if ( not Trig_038_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_038_Actions takes nothing returns nothing
    set udg_Zhongxin040 = GetRectCenter(gg_rct_040)
    set udg_Zhongxin012 = GetRectCenter(gg_rct_012)
    set udg_Zhongxin037 = GetRectCenter(gg_rct_037)
    set udg_Zhongxin041 = GetRectCenter(gg_rct_041)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin041 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin040 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin012 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin037 )
endfunction

//===========================================================================
function InitTrig_038 takes nothing returns nothing
    set gg_trg_038 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_038, gg_rct_034 )
    call TriggerAddCondition( gg_trg_038, Condition( function Trig_038_Conditions ) )
    call TriggerAddAction( gg_trg_038, function Trig_038_Actions )
endfunction
