
//===========================================================================
// Trigger: 未命名触发器 288
//===========================================================================
function Trig_288_Func003C takes nothing returns boolean
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

function Trig_288_Conditions takes nothing returns boolean
    if ( not Trig_288_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_288_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_288 takes nothing returns nothing
    set gg_trg_288 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_288, gg_rct_047 )
    call TriggerAddCondition( gg_trg_288, Condition( function Trig_288_Conditions ) )
    call TriggerAddAction( gg_trg_288, function Trig_288_Actions )
endfunction
