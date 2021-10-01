
//===========================================================================
// Trigger: XURUO
//===========================================================================
function Trig_XURUO_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A098',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A098',3)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'A098',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
set u=null
endfunction

//===========================================================================
function InitTrig_XURUO takes nothing returns nothing
    set gg_trg_XURUO = CreateTrigger(  )
    call TriggerAddAction( gg_trg_XURUO, function Trig_XURUO_Actions )
endfunction
