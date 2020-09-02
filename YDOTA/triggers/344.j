
//===========================================================================
// Trigger: 未命名触发器 344
//===========================================================================
function Trig_344_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_344 takes nothing returns nothing
    set gg_trg_344 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_344, function Trig_344_Actions )
endfunction
