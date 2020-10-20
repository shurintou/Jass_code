
//===========================================================================
// Trigger: 未命名触发器 034
//===========================================================================
function Trig_034_Func001C takes nothing returns boolean
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

function Trig_034_Conditions takes nothing returns boolean
    if ( not Trig_034_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_034_Actions takes nothing returns nothing
    set udg_Zhongxin038 = GetRectCenter(gg_rct_038)
    set udg_Zhongxin038 = GetRectCenter(gg_rct_042)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin042 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin038 )
endfunction

//===========================================================================
function InitTrig_034 takes nothing returns nothing
    set gg_trg_034 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_034, gg_rct_007 )
    call TriggerAddCondition( gg_trg_034, Condition( function Trig_034_Conditions ) )
    call TriggerAddAction( gg_trg_034, function Trig_034_Actions )
endfunction
