
//===========================================================================
// Trigger: lvlupchaodu
//===========================================================================
function Trig_lvlupchaodu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()


if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'Arai',2)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'Arai',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif


set u=null
endfunction

//===========================================================================
function InitTrig_lvlupchaodu takes nothing returns nothing
    set gg_trg_lvlupchaodu = CreateTrigger(  )
    call TriggerAddAction( gg_trg_lvlupchaodu, function Trig_lvlupchaodu_Actions )
endfunction
