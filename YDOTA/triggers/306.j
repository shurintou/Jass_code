
//===========================================================================
// Trigger: 未命名触发器 306
//===========================================================================
function Trig_306_Func002C takes nothing returns boolean
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

function Trig_306_Conditions takes nothing returns boolean
    if ( not Trig_306_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_306_Actions takes nothing returns nothing
    set udg_Zhongxin034 = GetRectCenter(gg_rct_034)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin034 )
endfunction

//===========================================================================
function InitTrig_306 takes nothing returns nothing
    set gg_trg_306 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_306, gg_rct_041 )
    call TriggerAddCondition( gg_trg_306, Condition( function Trig_306_Conditions ) )
    call TriggerAddAction( gg_trg_306, function Trig_306_Actions )
endfunction
