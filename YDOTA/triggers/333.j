
//===========================================================================
// Trigger: 未命名触发器 333
//===========================================================================
function Trig_333_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_333 takes nothing returns nothing
    set gg_trg_333 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_333, function Trig_333_Actions )
endfunction
