
//===========================================================================
// Trigger: xiao2
//===========================================================================
function Trig_xiao2_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'ewsp' ) ) then
        return false
    endif
    return true
endfunction

function Trig_xiao2_Actions takes nothing returns nothing
    call SetUnitPositionLoc( GetTriggerUnit(), GetRectCenter(gg_rct_014) )
    call PanCameraToTimedLocForPlayer( GetOwningPlayer(GetTriggerUnit()), GetRectCenter(gg_rct_014), 2.00 )
endfunction

//===========================================================================
function InitTrig_xiao2 takes nothing returns nothing
    set gg_trg_xiao2 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_xiao2, gg_rct_017 )
    call TriggerAddCondition( gg_trg_xiao2, Condition( function Trig_xiao2_Conditions ) )
    call TriggerAddAction( gg_trg_xiao2, function Trig_xiao2_Actions )
endfunction
