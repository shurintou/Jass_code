
//===========================================================================
// Trigger: 未命名触发器 156
//===========================================================================
function Trig_156_Func003C takes nothing returns boolean
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

function Trig_156_Conditions takes nothing returns boolean
    if ( not Trig_156_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_156_Actions takes nothing returns nothing
    set udg_Zhongxin037 = GetRectCenter(gg_rct_037)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin037 )
endfunction

//===========================================================================
function InitTrig_156 takes nothing returns nothing
    set gg_trg_156 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_156, gg_rct_shli_2_pianxiang4 )
    call TriggerAddCondition( gg_trg_156, Condition( function Trig_156_Conditions ) )
    call TriggerAddAction( gg_trg_156, function Trig_156_Actions )
endfunction
