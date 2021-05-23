
//===========================================================================
// Trigger: fensui
//===========================================================================
function Trig_fensui_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'A08F',2)
else
if GetUnitLevel(u)==11 then
call SetUnitAbilityLevel(u,'A08F',3)
else
if GetUnitLevel(u)>=16 then
call SetUnitAbilityLevel(u,'A08F',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_fensui takes nothing returns nothing
    set gg_trg_fensui = CreateTrigger(  )
    call TriggerAddAction( gg_trg_fensui, function Trig_fensui_Actions )
endfunction
