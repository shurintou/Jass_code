
//===========================================================================
// Trigger: 未命名触发器 283
//===========================================================================
function Trig_283_Func003C takes nothing returns boolean
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

function Trig_283_Conditions takes nothing returns boolean
    if ( not Trig_283_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_283_Actions takes nothing returns nothing
    set udg_Zhongxin222 = GetRectCenter(gg_rct_pianzhuanfangxiang222)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin222 )
endfunction

//===========================================================================
function InitTrig_283 takes nothing returns nothing
    set gg_trg_283 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_283, gg_rct_pianzhuanfangxiang )
    call TriggerAddCondition( gg_trg_283, Condition( function Trig_283_Conditions ) )
    call TriggerAddAction( gg_trg_283, function Trig_283_Actions )
endfunction
