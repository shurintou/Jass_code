
//===========================================================================
// Trigger: SpeedInNight
//===========================================================================
function checknight takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(GetExpiredTimer()),1)

if UnitIsSleeping(gg_unit_nwlt_0108) == true then
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A05I', true )
call SetUnitAbilityLevel( u, 'A05I', GetUnitAbilityLevel(u, 'A05H') )
else
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A05I', false )
endif

set u=null
endfunction




function startnight takes unit u returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,1.5,true,function checknight)

set tm=null
endfunction

//===========================================================================
function InitTrig_SpeedInNight takes nothing returns nothing
    set gg_trg_SpeedInNight = CreateTrigger(  )
endfunction
