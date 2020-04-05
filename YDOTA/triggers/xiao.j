
//===========================================================================
// Trigger: xiao
//===========================================================================
function Trig_xiao_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'ewsp' ) ) then
        return false
    endif
    return true
endfunction

function Trig_xiao_Actions takes nothing returns nothing
    call SetUnitPositionLoc( GetTriggerUnit(), GetRectCenter(gg_rct_014) )
    call PanCameraToTimedLocForPlayer( GetOwningPlayer(GetTriggerUnit()), GetRectCenter(gg_rct_014), 2.00 )
endfunction

//===========================================================================
function InitTrig_xiao takes nothing returns nothing
    set gg_trg_xiao = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_xiao, gg_rct_016 )
    call TriggerAddCondition( gg_trg_xiao, Condition( function Trig_xiao_Conditions ) )
    call TriggerAddAction( gg_trg_xiao, function Trig_xiao_Actions )
endfunction
