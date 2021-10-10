
//===========================================================================
// Trigger: illcloudy
//===========================================================================
function Trig_illcloudy_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'Aap1',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'Aap1',3)
else
if GetUnitLevel(u)==13 then
call SetUnitAbilityLevel(u,'Aap1',4)
else
if GetUnitLevel(u)==17 then
call SetUnitAbilityLevel(u,'Aap1',5)
else
if GetUnitLevel(u)>=21 then
call SetUnitAbilityLevel(u,'Aap1',6)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_illcloudy takes nothing returns nothing
    set gg_trg_illcloudy = CreateTrigger(  )
    call TriggerAddAction( gg_trg_illcloudy, function Trig_illcloudy_Actions )
endfunction
