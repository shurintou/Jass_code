
//===========================================================================
// Trigger: 未命名触发器 310
//===========================================================================
function Trig_310_Func002C takes nothing returns boolean
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

function Trig_310_Conditions takes nothing returns boolean
    if ( not Trig_310_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_310_Actions takes nothing returns nothing
    set udg_Zhongxin040 = GetRectCenter(gg_rct_040)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin040 )
endfunction

//===========================================================================
function InitTrig_310 takes nothing returns nothing
    set gg_trg_310 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_310, gg_rct_012 )
    call TriggerAddCondition( gg_trg_310, Condition( function Trig_310_Conditions ) )
    call TriggerAddAction( gg_trg_310, function Trig_310_Actions )
endfunction
