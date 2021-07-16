
//===========================================================================
// Trigger: xixueguanghuan
//===========================================================================
function Trig_xixueguanghuan_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()

if GetUnitLevel(u)==4 then
call SetUnitAbilityLevel(u,'AUav',2)
else
if GetUnitLevel(u)>=7 then
call SetUnitAbilityLevel(u,'AUav',3)
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_xixueguanghuan takes nothing returns nothing
    set gg_trg_xixueguanghuan = CreateTrigger(  )
    call TriggerAddAction( gg_trg_xixueguanghuan, function Trig_xixueguanghuan_Actions )
endfunction
