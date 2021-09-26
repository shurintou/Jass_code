
//===========================================================================
// Trigger: dddd
//===========================================================================
function Trig_dddd_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'Aakb',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'Aakb',3)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'Aakb',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_dddd takes nothing returns nothing
    set gg_trg_dddd = CreateTrigger(  )
    call TriggerAddAction( gg_trg_dddd, function Trig_dddd_Actions )
endfunction
