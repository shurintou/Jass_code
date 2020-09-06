
//===========================================================================
// Trigger: 未命名触发器 155
//===========================================================================
function Trig_155_Func003C takes nothing returns boolean
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

function Trig_155_Conditions takes nothing returns boolean
    if ( not Trig_155_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_155_Actions takes nothing returns nothing
    set udg_Zhongxin042 = GetRectCenter(gg_rct_042)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin042 )
endfunction

//===========================================================================
function InitTrig_155 takes nothing returns nothing
    set gg_trg_155 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_155, gg_rct_pianzhuanfangxiang3 )
    call TriggerAddCondition( gg_trg_155, Condition( function Trig_155_Conditions ) )
    call TriggerAddAction( gg_trg_155, function Trig_155_Actions )
endfunction
