
//===========================================================================
// Trigger: 未命名触发器 004
//===========================================================================
function Trig_004_Actions takes nothing returns nothing
    set udg_xiongzhanshixueliang = GetUnitLifePercent(GetTriggerUnit())
endfunction

//===========================================================================
function InitTrig_004 takes nothing returns nothing
    set gg_trg_004 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_004, function Trig_004_Actions )
endfunction
