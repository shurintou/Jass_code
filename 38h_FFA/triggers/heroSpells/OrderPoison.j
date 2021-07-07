
//===========================================================================
// Trigger: OrderPoison
//===========================================================================
function Trig_OrderPoison_Actions takes nothing returns nothing
if GetIssuedOrderId() == 852578 then
call EnableTrigger( gg_trg_AttackPoison )
else
if GetIssuedOrderId() == 852579 then
call DisableTrigger( gg_trg_AttackPoison )
endif
endif
endfunction

//===========================================================================
function InitTrig_OrderPoison takes nothing returns nothing
    set gg_trg_OrderPoison = CreateTrigger(  )
    call TriggerAddAction( gg_trg_OrderPoison, function Trig_OrderPoison_Actions )
endfunction
