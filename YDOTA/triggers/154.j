
//===========================================================================
// Trigger: 未命名触发器 154
//===========================================================================
function Trig_154_Func003C takes nothing returns boolean
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

function Trig_154_Conditions takes nothing returns boolean
    if ( not Trig_154_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_154_Actions takes nothing returns nothing
    set udg_Zhongxin042 = GetRectCenter(gg_rct_042)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin042 )
endfunction

//===========================================================================
function InitTrig_154 takes nothing returns nothing
    set gg_trg_154 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_154, gg_rct_pianzhuanfangxiang222 )
    call TriggerAddCondition( gg_trg_154, Condition( function Trig_154_Conditions ) )
    call TriggerAddAction( gg_trg_154, function Trig_154_Actions )
endfunction
