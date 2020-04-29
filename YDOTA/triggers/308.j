
//===========================================================================
// Trigger: 未命名触发器 308
//===========================================================================
function Trig_308_Func002C takes nothing returns boolean
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

function Trig_308_Conditions takes nothing returns boolean
    if ( not Trig_308_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_308_Actions takes nothing returns nothing
    set udg_Zhongxin043 = GetRectCenter(gg_rct_043)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin043 )
endfunction

//===========================================================================
function InitTrig_308 takes nothing returns nothing
    set gg_trg_308 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_308, gg_rct_015 )
    call TriggerAddCondition( gg_trg_308, Condition( function Trig_308_Conditions ) )
    call TriggerAddAction( gg_trg_308, function Trig_308_Actions )
endfunction
