
//===========================================================================
// Trigger: walkaournd
//===========================================================================
function Trig_walkaournd_Conditions takes nothing returns boolean
    local integer i=GetIssuedOrderId()
    return  i== 851988 or i== 851971 or i== 851986
endfunction

function movearouneact takes nothing returns nothing
call IssueImmediateOrderById(GetEnumUnit(),852557)
endfunction



function Trig_walkaournd_Actions takes nothing returns nothing
if GetUnitState(LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_attackwithfengkuang),1), UNIT_STATE_LIFE)<=0 then
call ForGroup(LoadGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2),function movearouneact)   
endif
endfunction

//===========================================================================
function InitTrig_walkaournd takes nothing returns nothing
    set gg_trg_walkaournd = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_walkaournd, Condition( function Trig_walkaournd_Conditions ) )
    call TriggerAddAction( gg_trg_walkaournd, function Trig_walkaournd_Actions )
endfunction
