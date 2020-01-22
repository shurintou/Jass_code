
//===========================================================================
// Trigger: 未命名触发器 082
//===========================================================================
function Trig_082_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'nbal' ) ) then
        return false
    endif
    return true
endfunction

function Trig_082_Actions takes nothing returns nothing
    call SetUnitAcquireRange( GetTriggerUnit(), 600.00 )
endfunction

//===========================================================================
function InitTrig_082 takes nothing returns nothing
    set gg_trg_082 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_082, gg_rct_015 )
    call TriggerAddCondition( gg_trg_082, Condition( function Trig_082_Conditions ) )
    call TriggerAddAction( gg_trg_082, function Trig_082_Actions )
endfunction
