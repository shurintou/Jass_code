
//===========================================================================
// Trigger: huoyanzhiren
//
// AIfw
//===========================================================================
function Trig_huoyanzhiren_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A09N',2)
call SetUnitAbilityLevel(u,'AIfw',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A09N',3)
call SetUnitAbilityLevel(u,'AIfw',3)
else
if GetUnitLevel(u)==13 then
call SetUnitAbilityLevel(u,'A09N',4)
call SetUnitAbilityLevel(u,'AIfw',4)
else
if GetUnitLevel(u)==17 then
call SetUnitAbilityLevel(u,'A09N',5)
call SetUnitAbilityLevel(u,'AIfw',5)
else
if GetUnitLevel(u)==21 then
call SetUnitAbilityLevel(u,'A09N',6)
call SetUnitAbilityLevel(u,'AIfw',6)
else
if GetUnitLevel(u)>=25 then
call SetUnitAbilityLevel(u,'A09N',7)
call SetUnitAbilityLevel(u,'AIfw',7)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
endif
endif
endif


set u=null
endfunction

//===========================================================================
function InitTrig_huoyanzhiren takes nothing returns nothing
    set gg_trg_huoyanzhiren = CreateTrigger(  )
    call TriggerAddAction( gg_trg_huoyanzhiren, function Trig_huoyanzhiren_Actions )
endfunction
