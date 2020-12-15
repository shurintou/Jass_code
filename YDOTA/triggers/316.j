
//===========================================================================
// Trigger: 未命名触发器 316
//===========================================================================
function Trig_316_Func003C takes nothing returns boolean
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

function Trig_316_Conditions takes nothing returns boolean
    if ( not Trig_316_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_316_Actions takes nothing returns nothing
    set udg_Zhongxin003 = GetRectCenter(gg_rct_003)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin003 )
endfunction

//===========================================================================
function InitTrig_316 takes nothing returns nothing
    set gg_trg_316 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_316, gg_rct_048 )
    call TriggerAddCondition( gg_trg_316, Condition( function Trig_316_Conditions ) )
    call TriggerAddAction( gg_trg_316, function Trig_316_Actions )
endfunction
