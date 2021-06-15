
//===========================================================================
// Trigger: angleup
//===========================================================================
function Trig_angleup_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'ANsw',2)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'ANsw',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_angleup takes nothing returns nothing
    set gg_trg_angleup = CreateTrigger(  )
    call TriggerAddAction( gg_trg_angleup, function Trig_angleup_Actions )
endfunction
