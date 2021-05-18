
//===========================================================================
// Trigger: xionglevel
//===========================================================================
function Trig_xionglevel_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A0BF',2)
else
if GetUnitLevel(u)>=9 then
call SetUnitAbilityLevel(u,'A0BF',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_xionglevel takes nothing returns nothing
    set gg_trg_xionglevel = CreateTrigger(  )
    call TriggerAddAction( gg_trg_xionglevel, function Trig_xionglevel_Actions )
endfunction
