
//===========================================================================
// Trigger: 未命名触发器 314
//===========================================================================
function Trig_314_Func003C takes nothing returns boolean
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

function Trig_314_Conditions takes nothing returns boolean
    if ( not Trig_314_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_314_Actions takes nothing returns nothing
    set udg_Zhongxin042 = GetRectCenter(gg_rct_042)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin042 )
endfunction

//===========================================================================
function InitTrig_314 takes nothing returns nothing
    set gg_trg_314 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_314, gg_rct_038 )
    call TriggerAddCondition( gg_trg_314, Condition( function Trig_314_Conditions ) )
    call TriggerAddAction( gg_trg_314, function Trig_314_Actions )
endfunction
