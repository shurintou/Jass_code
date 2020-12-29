
//===========================================================================
// Trigger: 未命名触发器 153
//===========================================================================
function Trig_153_Func003C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nzom' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nchg' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nfov' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ohun' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ucry' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ebal' ) ) then
        return true
    endif
    return false
endfunction

function Trig_153_Conditions takes nothing returns boolean
    if ( not Trig_153_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_153_Actions takes nothing returns nothing
    set udg_Zhongxin000 = GetRectCenter(gg_rct_000)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin000 )
endfunction

//===========================================================================
function InitTrig_153 takes nothing returns nothing
    set gg_trg_153 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_153, gg_rct_042 )
    call TriggerAddCondition( gg_trg_153, Condition( function Trig_153_Conditions ) )
    call TriggerAddAction( gg_trg_153, function Trig_153_Actions )
endfunction
