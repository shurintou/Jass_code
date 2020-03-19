
//===========================================================================
// Trigger: 未命名触发器 307
//===========================================================================
function Trig_307_Func002C takes nothing returns boolean
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

function Trig_307_Conditions takes nothing returns boolean
    if ( not Trig_307_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_307_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_307 takes nothing returns nothing
    set gg_trg_307 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_307, gg_rct_034 )
    call TriggerAddCondition( gg_trg_307, Condition( function Trig_307_Conditions ) )
    call TriggerAddAction( gg_trg_307, function Trig_307_Actions )
endfunction
