
//===========================================================================
// Trigger: 未命名触发器 019
//===========================================================================
function Trig_019_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_019 takes nothing returns nothing
    set gg_trg_019 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_019, function Trig_019_Actions )
endfunction
