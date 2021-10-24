
//===========================================================================
// Trigger: yanmo
//===========================================================================
function Trig_yanmo_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'A08L',2)
else
if GetUnitLevel(u)>=11 then
call SetUnitAbilityLevel(u,'A08L',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_yanmo takes nothing returns nothing
    set gg_trg_yanmo = CreateTrigger(  )
    call TriggerAddAction( gg_trg_yanmo, function Trig_yanmo_Actions )
endfunction
