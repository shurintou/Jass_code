
//===========================================================================
// Trigger: tigaoshouyuliliang
//===========================================================================
function Trig_tigaoshouyuliliang_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==5 then
call SetUnitAbilityLevel(u,'A09D',2)
else
if GetUnitLevel(u)==9 then
call SetUnitAbilityLevel(u,'A09D',3)
else
if GetUnitLevel(u)>=13 then
call SetUnitAbilityLevel(u,'A09D',4)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
set u=null
endfunction

//===========================================================================
function InitTrig_tigaoshouyuliliang takes nothing returns nothing
    set gg_trg_tigaoshouyuliliang = CreateTrigger(  )
    call TriggerAddAction( gg_trg_tigaoshouyuliliang, function Trig_tigaoshouyuliliang_Actions )
endfunction
