
//===========================================================================
// Trigger: 未命名触发器 317
//===========================================================================
function Trig_317_Func003C takes nothing returns boolean
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

function Trig_317_Conditions takes nothing returns boolean
    if ( not Trig_317_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_317_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_317 takes nothing returns nothing
    set gg_trg_317 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_317, gg_rct_003 )
    call TriggerAddCondition( gg_trg_317, Condition( function Trig_317_Conditions ) )
    call TriggerAddAction( gg_trg_317, function Trig_317_Actions )
endfunction
