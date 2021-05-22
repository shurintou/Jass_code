
//===========================================================================
// Trigger: MAoTouYING
//===========================================================================
function Trig_MAoTouYING_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()


if GetUnitLevel(u)==10 then
call SetUnitAbilityLevel(u,'AEst',2)
else
if GetUnitLevel(u)>=19 then
call SetUnitAbilityLevel(u,'AEst',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif


set u=null
endfunction

//===========================================================================
function InitTrig_MAoTouYING takes nothing returns nothing
    set gg_trg_MAoTouYING = CreateTrigger(  )
    call TriggerAddAction( gg_trg_MAoTouYING, function Trig_MAoTouYING_Actions )
endfunction
