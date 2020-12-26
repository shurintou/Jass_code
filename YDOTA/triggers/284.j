
//===========================================================================
// Trigger: 未命名触发器 284
//===========================================================================
function Trig_284_Func002C takes nothing returns boolean
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

function Trig_284_Conditions takes nothing returns boolean
    if ( not Trig_284_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_284_Actions takes nothing returns nothing
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin006 )
endfunction

//===========================================================================
function InitTrig_284 takes nothing returns nothing
    set gg_trg_284 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_284, gg_rct_pianzhuanfangxiang222 )
    call TriggerAddCondition( gg_trg_284, Condition( function Trig_284_Conditions ) )
    call TriggerAddAction( gg_trg_284, function Trig_284_Actions )
endfunction
