
//===========================================================================
// Trigger: wtf
//===========================================================================
function Trig_wtf_Actions takes nothing returns nothing
    call RemoveItem( UnitItemInSlotBJ(gg_unit_Hamg_0130, 1) )
    call EnableTrigger( gg_trg_wtfdown )
    call EnableTrigger( gg_trg_wtfd )
endfunction

//===========================================================================
function InitTrig_wtf takes nothing returns nothing
    set gg_trg_wtf = CreateTrigger(  )
    call TriggerAddAction( gg_trg_wtf, function Trig_wtf_Actions )
endfunction
