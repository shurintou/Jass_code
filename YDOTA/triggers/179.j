
//===========================================================================
// Trigger: 未命名触发器 179
//===========================================================================
function Trig_179_Func003C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hkni' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hfoo' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hrif' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'hmtm' ) ) then
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

function Trig_179_Conditions takes nothing returns boolean
    if ( not Trig_179_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_179_Actions takes nothing returns nothing
    set udg_Zhongxin047 = GetRectCenter(gg_rct_047)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin047 )
endfunction

//===========================================================================
function InitTrig_179 takes nothing returns nothing
    set gg_trg_179 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_179, gg_rct_Azhucheng222222 )
    call TriggerAddCondition( gg_trg_179, Condition( function Trig_179_Conditions ) )
    call TriggerAddAction( gg_trg_179, function Trig_179_Actions )
endfunction
