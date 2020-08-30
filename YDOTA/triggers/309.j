
//===========================================================================
// Trigger: 未命名触发器 309
//===========================================================================
function Trig_309_Func002C takes nothing returns boolean
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

function Trig_309_Conditions takes nothing returns boolean
    if ( not Trig_309_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_309_Actions takes nothing returns nothing
    set udg_Zhongxin046 = GetRectCenter(gg_rct_046)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin046 )
endfunction

//===========================================================================
function InitTrig_309 takes nothing returns nothing
    set gg_trg_309 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_309, gg_rct_043 )
    call TriggerAddCondition( gg_trg_309, Condition( function Trig_309_Conditions ) )
    call TriggerAddAction( gg_trg_309, function Trig_309_Actions )
endfunction
