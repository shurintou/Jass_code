
//===========================================================================
// Trigger: maoji
//===========================================================================
function Trig_maoji_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A08A',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A08A',3)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'A08A',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_maoji takes nothing returns nothing
    set gg_trg_maoji = CreateTrigger(  )
    call TriggerAddAction( gg_trg_maoji, function Trig_maoji_Actions )
endfunction
