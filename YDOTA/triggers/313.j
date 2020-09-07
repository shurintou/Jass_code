
//===========================================================================
// Trigger: 未命名触发器 313
//===========================================================================
function Trig_313_Func003C takes nothing returns boolean
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

function Trig_313_Conditions takes nothing returns boolean
    if ( not Trig_313_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_313_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_313 takes nothing returns nothing
    set gg_trg_313 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_313, gg_rct_047 )
    call TriggerAddCondition( gg_trg_313, Condition( function Trig_313_Conditions ) )
    call TriggerAddAction( gg_trg_313, function Trig_313_Actions )
endfunction
