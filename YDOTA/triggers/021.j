
//===========================================================================
// Trigger: 未命名触发器 021
//===========================================================================
function Trig_021_Func001002 takes nothing returns nothing
    call DestructableRestoreLife( GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), true )
endfunction

function Trig_021_Actions takes nothing returns nothing
    call EnumDestructablesInRectAll( GetPlayableMapRect(), function Trig_021_Func001002 )
endfunction

//===========================================================================
function InitTrig_021 takes nothing returns nothing
    set gg_trg_021 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_021, 70.00 )
    call TriggerAddAction( gg_trg_021, function Trig_021_Actions )
endfunction
