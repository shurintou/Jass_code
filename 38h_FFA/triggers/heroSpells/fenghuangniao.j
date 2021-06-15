
//===========================================================================
// Trigger: fenghuangniao
//===========================================================================
function Trig_fenghuangniao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()


if GetUnitLevel(u)==8 then
call SetUnitAbilityLevel(u,'Avng',2)
else
if GetUnitLevel(u)>=15 then
call SetUnitAbilityLevel(u,'Avng',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif


set u=null
endfunction

//===========================================================================
function InitTrig_fenghuangniao takes nothing returns nothing
    set gg_trg_fenghuangniao = CreateTrigger(  )
    call TriggerAddAction( gg_trg_fenghuangniao, function Trig_fenghuangniao_Actions )
endfunction
