
//===========================================================================
// Trigger: fengkuangshalu
//
// 加入单位组
//===========================================================================
function Trig_fengkuangshalu_Conditions takes nothing returns boolean
    return GetIssuedOrderId() == 852557 and GetUnitTypeId(GetOrderedUnit())=='O00D'
endfunction

function Trig_fengkuangshalu_Actions takes nothing returns nothing
local group g=LoadGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2)
local unit u=GetOrderedUnit()
local integer i=0
local unit t=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),1)
local item e

call EnableTrigger( gg_trg_attackwithfengkuang )
call EnableTrigger( gg_trg_walkaournd )
if IsUnitInGroup(u, g) then
else
call SuspendHeroXP( u, true )
call GroupAddUnit( g, u )
loop
exitwhen i>5
set e=UnitAddItemById( u, GetItemTypeId(UnitItemInSlot(t, i)) )
call SetItemDropOnDeath(e, false )
set i=i+1
endloop
endif

set g=null
set u=null
set e=null
set t=null
endfunction

//===========================================================================
function InitTrig_fengkuangshalu takes nothing returns nothing
    set gg_trg_fengkuangshalu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_fengkuangshalu, Condition( function Trig_fengkuangshalu_Conditions ) )
    call TriggerAddAction( gg_trg_fengkuangshalu, function Trig_fengkuangshalu_Actions )
endfunction
