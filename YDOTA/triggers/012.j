
//===========================================================================
// Trigger: 未命名触发器 012
//===========================================================================
function Trig_012_Actions takes nothing returns nothing
    call PanCameraToTimed( 4900.00, -4900.00, 0.50 )
endfunction

//===========================================================================
function InitTrig_012 takes nothing returns nothing
    set gg_trg_012 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_012, function Trig_012_Actions )
endfunction
