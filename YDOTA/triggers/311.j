
//===========================================================================
// Trigger: 未命名触发器 311
//===========================================================================
function Trig_311_Func003C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hfoo' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hrif' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hmtm' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hkni' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'edot' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hhes' ) ) then
        return true
    endif
    return false
endfunction

function Trig_311_Conditions takes nothing returns boolean
    if ( not Trig_311_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_311_Actions takes nothing returns nothing
    set udg_Zhongxin015 = GetRectCenter(gg_rct_015)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin015 )
endfunction

//===========================================================================
function InitTrig_311 takes nothing returns nothing
    set gg_trg_311 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_311, gg_rct_001 )
    call TriggerAddCondition( gg_trg_311, Condition( function Trig_311_Conditions ) )
    call TriggerAddAction( gg_trg_311, function Trig_311_Actions )
endfunction
