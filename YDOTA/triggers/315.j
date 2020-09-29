
//===========================================================================
// Trigger: 未命名触发器 315
//===========================================================================
function Trig_315_Func003C takes nothing returns boolean
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

function Trig_315_Conditions takes nothing returns boolean
    if ( not Trig_315_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_315_Actions takes nothing returns nothing
    set udg_Zhongxin222 = GetRectCenter(gg_rct_pianzhuanfangxiang222)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin222 )
endfunction

//===========================================================================
function InitTrig_315 takes nothing returns nothing
    set gg_trg_315 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_315, gg_rct_042 )
    call TriggerAddCondition( gg_trg_315, Condition( function Trig_315_Conditions ) )
    call TriggerAddAction( gg_trg_315, function Trig_315_Actions )
endfunction
