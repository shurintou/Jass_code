
//===========================================================================
// Trigger: 未命名触发器 107
//===========================================================================
function Trig_107_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_107 takes nothing returns nothing
    set gg_trg_107 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_107, function Trig_107_Actions )
endfunction
