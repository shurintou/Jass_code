
//===========================================================================
// Trigger: julihuiwu
//===========================================================================
function Trig_julihuiwu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A09W',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A09W',3)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'A09W',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_julihuiwu takes nothing returns nothing
    set gg_trg_julihuiwu = CreateTrigger(  )
    call TriggerAddAction( gg_trg_julihuiwu, function Trig_julihuiwu_Actions )
endfunction
