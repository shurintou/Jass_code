
//===========================================================================
// Trigger: 未命名触发器 062
//===========================================================================
function Trig_062_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'ewsp' ) ) then
        return false
    endif
    return true
endfunction

function Trig_062_Actions takes nothing returns nothing
    if ( Trig_062_Func001C() ) then
        call DoNothing(  )
    else
        call SetUnitPositionLoc( GetTriggerUnit(), GetPlayerStartLocationLoc(GetOwningPlayer(GetTriggerUnit())) )
    endif
endfunction

//===========================================================================
function InitTrig_062 takes nothing returns nothing
    set gg_trg_062 = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_062, gg_rct_014 )
    call TriggerAddAction( gg_trg_062, function Trig_062_Actions )
endfunction
