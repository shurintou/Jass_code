
//===========================================================================
// Trigger: 未命名触发器 037
//===========================================================================
function Trig_037_Func009C takes nothing returns boolean
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

function Trig_037_Conditions takes nothing returns boolean
    if ( not Trig_037_Func009C() ) then
        return false
    endif
    return true
endfunction

function Trig_037_Actions takes nothing returns nothing
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
function InitTrig_037 takes nothing returns nothing
    set gg_trg_037 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_037, gg_rct_029 )
    call TriggerAddCondition( gg_trg_037, Condition( function Trig_037_Conditions ) )
    call TriggerAddAction( gg_trg_037, function Trig_037_Actions )
endfunction
