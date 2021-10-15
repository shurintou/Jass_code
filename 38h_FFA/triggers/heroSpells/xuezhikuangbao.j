
//===========================================================================
// Trigger: xuezhikuangbao
//===========================================================================
function Trig_xuezhikuangbao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'A0AU',2)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'A0AU',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_xuezhikuangbao takes nothing returns nothing
    set gg_trg_xuezhikuangbao = CreateTrigger(  )
    call TriggerAddAction( gg_trg_xuezhikuangbao, function Trig_xuezhikuangbao_Actions )
endfunction
