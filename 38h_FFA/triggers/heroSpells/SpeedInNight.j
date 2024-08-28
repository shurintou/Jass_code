
//===========================================================================
// Trigger: SpeedInNight
//
//    local item t=GetSoldItem()
//     local integer i=GetItemTypeId(t)
//     local player p=GetOwningPlayer(GetBuyingUnit())
//     local integer g=GetConvertedPlayerId(p)
//     local unit u=udg_PlayerLockToHero[g]
//     local integer n=0
// if i=='srrc' then//攻击
// set n=LoadInteger(udg_Hash6,g,23)
//===========================================================================
function checknight takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(GetExpiredTimer()),1)
local integer n=0

if UnitIsSleeping(gg_unit_nwlt_0108) == true then
call UnitAddAbility( udg_Bag[GetConvertedPlayerId(GetOwningPlayer(u))], 'A0EC' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A05I', true )
call SetUnitAbilityLevel( u, 'A05I', GetUnitAbilityLevel(u, 'A05H') )
set n=LoadInteger(udg_Hash6,GetConvertedPlayerId(GetOwningPlayer(u)),33)
  if n>0 then
  call SetTimeOfDayScale( 1.00-0.03*n )
  else
  call SetTimeOfDayScale( 1.00 )
  endif
else
call SetTimeOfDayScale( 1.00 )
call UnitRemoveAbility( udg_Bag[GetConvertedPlayerId(GetOwningPlayer(u))], 'A0EC' )
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
