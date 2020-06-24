
//===========================================================================
// Trigger: 未命名触发器 163
//===========================================================================
function Trig_163_Actions takes nothing returns nothing
    set udg_DH = GetTriggerUnit()
    set udg_bo_wen = GetLastCreatedTerrainDeformation()
endfunction

//===========================================================================
function InitTrig_163 takes nothing returns nothing
    set gg_trg_163 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_163, function Trig_163_Actions )
endfunction
