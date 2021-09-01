
//===========================================================================
// Trigger: tunshishengji
//===========================================================================
function Trig_tunshishengji_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==4 then
call SetUnitAbilityLevel(u,'Adev',2)
else
if GetUnitLevel(u)==7 then
call SetUnitAbilityLevel(u,'Adev',3)
else
if GetUnitLevel(u)>=10 then
call SetUnitAbilityLevel(u,'Adev',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_tunshishengji takes nothing returns nothing
    set gg_trg_tunshishengji = CreateTrigger(  )
    call TriggerAddAction( gg_trg_tunshishengji, function Trig_tunshishengji_Actions )
endfunction
