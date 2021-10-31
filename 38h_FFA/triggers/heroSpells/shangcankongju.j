
//===========================================================================
// Trigger: shangcankongju
//===========================================================================
function Trig_shangcankongju_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()


if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'A0AT',2)
else
if GetUnitLevel(u)>=11 then
call SetUnitAbilityLevel(u,'A0AT',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_shangcankongju takes nothing returns nothing
    set gg_trg_shangcankongju = CreateTrigger(  )
    call TriggerAddAction( gg_trg_shangcankongju, function Trig_shangcankongju_Actions )
endfunction
