
//===========================================================================
// Trigger: asd
//===========================================================================
function Trig_asd_Actions takes nothing returns nothing
    call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMGExchange.blp" )
endfunction

//===========================================================================
function InitTrig_asd takes nothing returns nothing
    set gg_trg_asd = CreateTrigger(  )
    call TriggerAddAction( gg_trg_asd, function Trig_asd_Actions )
endfunction
