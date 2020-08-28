
//===========================================================================
// Trigger: 未命名触发器 305
//===========================================================================
function Trig_305_Func002C takes nothing returns boolean
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

function Trig_305_Conditions takes nothing returns boolean
    if ( not Trig_305_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_305_Actions takes nothing returns nothing
    set udg_Zhongxin041 = GetRectCenter(gg_rct_041)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin041 )
endfunction

//===========================================================================
function InitTrig_305 takes nothing returns nothing
    set gg_trg_305 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_305, gg_rct_040 )
    call TriggerAddCondition( gg_trg_305, Condition( function Trig_305_Conditions ) )
    call TriggerAddAction( gg_trg_305, function Trig_305_Actions )
endfunction
