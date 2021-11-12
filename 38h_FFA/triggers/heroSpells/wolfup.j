
//===========================================================================
// Trigger: wolfup
//===========================================================================
function Trig_wolfup_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'ACs7',2)
else
if GetUnitLevel(u)>=11 then
call SetUnitAbilityLevel(u,'ACs7',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_wolfup takes nothing returns nothing
    set gg_trg_wolfup = CreateTrigger(  )
    call TriggerAddAction( gg_trg_wolfup, function Trig_wolfup_Actions )
endfunction
