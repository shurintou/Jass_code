
//===========================================================================
// Trigger: blink
//===========================================================================
function Trig_blink_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'A08H',2)
else
if GetUnitLevel(u)>=10 then
call SetUnitAbilityLevel(u,'A08H',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_blink takes nothing returns nothing
    set gg_trg_blink = CreateTrigger(  )
    call TriggerAddAction( gg_trg_blink, function Trig_blink_Actions )
endfunction
