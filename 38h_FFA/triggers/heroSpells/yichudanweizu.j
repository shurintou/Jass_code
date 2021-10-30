
//===========================================================================
// Trigger: yichudanweizu
//===========================================================================
function Trig_yichudanweizu_Conditions takes nothing returns boolean
    return GetIssuedOrderId() == 852558 and GetUnitTypeId(GetOrderedUnit())=='O00D'
endfunction

function Trig_yichudanweizu_Actions takes nothing returns nothing
local group g=LoadGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2)
local unit u=GetOrderedUnit()

if IsUnitInGroup(u, g) then
call GroupRemoveUnit( g, u )
endif

set g=null
set u=null
endfunction

//===========================================================================
function InitTrig_yichudanweizu takes nothing returns nothing
    set gg_trg_yichudanweizu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_yichudanweizu, Condition( function Trig_yichudanweizu_Conditions ) )
    call TriggerAddAction( gg_trg_yichudanweizu, function Trig_yichudanweizu_Actions )
endfunction
