
//===========================================================================
// Trigger: fanlaohuantong
//===========================================================================
function Trig_fanlaohuantong_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==3 then
call SetUnitAbilityLevel(u,'Arej',2)
else
if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'Arej',3)
else
if GetUnitLevel(u)>=7 then
call SetUnitAbilityLevel(u,'Arej',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
set u=null
endfunction

//===========================================================================
function InitTrig_fanlaohuantong takes nothing returns nothing
    set gg_trg_fanlaohuantong = CreateTrigger(  )
    call TriggerAddAction( gg_trg_fanlaohuantong, function Trig_fanlaohuantong_Actions )
endfunction
