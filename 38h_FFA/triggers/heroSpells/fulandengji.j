
//===========================================================================
// Trigger: fulandengji
//===========================================================================
function Trig_fulandengji_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==4 then
call SetUnitAbilityLevel(u,'A01J',2)
else
if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'A01J',3)
else
if GetUnitLevel(u)>=10 then
call SetUnitAbilityLevel(u,'A01J',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_fulandengji takes nothing returns nothing
    set gg_trg_fulandengji = CreateTrigger(  )
    call TriggerAddAction( gg_trg_fulandengji, function Trig_fulandengji_Actions )
endfunction
