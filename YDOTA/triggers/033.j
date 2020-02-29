
//===========================================================================
// Trigger: 未命名触发器 033
//===========================================================================
function Trig_033_Func003C takes nothing returns boolean
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

function Trig_033_Conditions takes nothing returns boolean
    if ( not Trig_033_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_033_Actions takes nothing returns nothing
    set udg_Zhongxin038 = GetRectCenter(gg_rct_038)
    set udg_Zhongxin038 = GetRectCenter(gg_rct_042)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin042 )
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin038 )
endfunction

//===========================================================================
function InitTrig_033 takes nothing returns nothing
    set gg_trg_033 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_033, gg_rct_006 )
    call TriggerAddCondition( gg_trg_033, Condition( function Trig_033_Conditions ) )
    call TriggerAddAction( gg_trg_033, function Trig_033_Actions )
endfunction
