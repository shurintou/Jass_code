
//===========================================================================
// Trigger: UpSHUailao
//===========================================================================
function Trig_UpSHUailao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'AHbn',2)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'AHbn',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_UpSHUailao takes nothing returns nothing
    set gg_trg_UpSHUailao = CreateTrigger(  )
    call TriggerAddAction( gg_trg_UpSHUailao, function Trig_UpSHUailao_Actions )
endfunction
