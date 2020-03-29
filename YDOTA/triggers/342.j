
//===========================================================================
// Trigger: 未命名触发器 342
//===========================================================================
function Trig_342_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_342 takes nothing returns nothing
    set gg_trg_342 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_342, function Trig_342_Actions )
endfunction
