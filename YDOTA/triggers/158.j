
//===========================================================================
// Trigger: 未命名触发器 158
//===========================================================================
function Trig_158_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_158 takes nothing returns nothing
    set gg_trg_158 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_158, function Trig_158_Actions )
endfunction
