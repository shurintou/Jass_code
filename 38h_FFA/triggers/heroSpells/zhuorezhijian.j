
//===========================================================================
// Trigger: zhuorezhijian
//===========================================================================
function Trig_zhuorezhijian_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==4 then
call SetUnitAbilityLevel(u,'AHfa',2)
else
if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'AHfa',3)
else
if GetUnitLevel(u)>=10 then
call SetUnitAbilityLevel(u,'AHfa',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_zhuorezhijian takes nothing returns nothing
    set gg_trg_zhuorezhijian = CreateTrigger(  )
    call TriggerAddAction( gg_trg_zhuorezhijian, function Trig_zhuorezhijian_Actions )
endfunction
