
//===========================================================================
// Trigger: 未命名触发器 040
//===========================================================================
function Trig_040_Func002C takes nothing returns boolean
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

function Trig_040_Conditions takes nothing returns boolean
    if ( not Trig_040_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_040_Actions takes nothing returns nothing
    set udg_Zhongxin037 = GetRectCenter(gg_rct_037)
    call IssuePointOrderLoc( GetTriggerUnit(), "attack", udg_Zhongxin037 )
endfunction

//===========================================================================
function InitTrig_040 takes nothing returns nothing
    set gg_trg_040 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_040, gg_rct_038 )
    call TriggerAddCondition( gg_trg_040, Condition( function Trig_040_Conditions ) )
    call TriggerAddAction( gg_trg_040, function Trig_040_Actions )
endfunction
