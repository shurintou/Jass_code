
//===========================================================================
// Trigger: 未命名触发器 312
//===========================================================================
function Trig_312_Func003C takes nothing returns boolean
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

function Trig_312_Conditions takes nothing returns boolean
    if ( not Trig_312_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_312_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_312 takes nothing returns nothing
    set gg_trg_312 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_312, gg_rct_046 )
    call TriggerAddCondition( gg_trg_312, Condition( function Trig_312_Conditions ) )
    call TriggerAddAction( gg_trg_312, function Trig_312_Actions )
endfunction
