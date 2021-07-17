
//===========================================================================
// Trigger: yaoshuup
//===========================================================================
function Trig_yaoshuup_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==6 then
call SetUnitAbilityLevel(u,'AOhx',2)
else
if GetUnitLevel(u)>=11 then
call SetUnitAbilityLevel(u,'AOhx',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_yaoshuup takes nothing returns nothing
    set gg_trg_yaoshuup = CreateTrigger(  )
    call TriggerAddAction( gg_trg_yaoshuup, function Trig_yaoshuup_Actions )
endfunction
