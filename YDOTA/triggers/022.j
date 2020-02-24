
//===========================================================================
// Trigger: 未命名触发器 022
//===========================================================================
function Trig_022_Actions takes nothing returns nothing
    set udg_Shenglingsharenshu = 0
    set udg_Tianzaisharenshu = 0
endfunction

//===========================================================================
function InitTrig_022 takes nothing returns nothing
    set gg_trg_022 = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_022, 2.00 )
    call TriggerAddAction( gg_trg_022, function Trig_022_Actions )
endfunction
