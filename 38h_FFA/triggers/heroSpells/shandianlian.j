
//===========================================================================
// Trigger: shandianlian
//===========================================================================
function Trig_shandianlian_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A08G',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A08G',3)
else
if GetUnitLevel(u)==13 then
call SetUnitAbilityLevel(u,'A08G',4)
else
if GetUnitLevel(u)==17 then
call SetUnitAbilityLevel(u,'A08G',5)
else
if GetUnitLevel(u)==21 then
call SetUnitAbilityLevel(u,'A08G',6)
else
if GetUnitLevel(u)==25 then
call SetUnitAbilityLevel(u,'A08G',7)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_shandianlian takes nothing returns nothing
    set gg_trg_shandianlian = CreateTrigger(  )
    call TriggerAddAction( gg_trg_shandianlian, function Trig_shandianlian_Actions )
endfunction
