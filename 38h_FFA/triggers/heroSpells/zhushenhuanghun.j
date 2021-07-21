
//===========================================================================
// Trigger: zhushenhuanghun
//===========================================================================
function Trig_zhushenhuanghun_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CT' 
endfunction


function removeheiye takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer l=GetHandleId(tm)
local player p=GetOwningPlayer(LoadUnitHandle(udg_Hash1,l,1))
local integer i=0
local integer n=0

loop
exitwhen i>11
set n=0
if IsPlayerEnemy(p, Player(i)) then
call UnitRemoveAbility(udg_PlayerLockToHero[GetConvertedPlayerId(Player(i))],'A0CV')
   loop
   exitwhen n>11
   if IsPlayerAlly(Player(i), Player(n)) then
   call SetPlayerAlliance( Player(i), Player(n), ALLIANCE_SHARED_VISION, true )
   endif
   set n=n+1
   endloop
else
call UnitRemoveAbility(udg_PlayerLockToHero[GetConvertedPlayerId(Player(i))],'A0CW')
endif
set i=i+1
endloop

call SetPlayerAbilityAvailable( p, 'A0CT', true )
call FlushChildHashtable( udg_Hash1, l )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set p=null
endfunction



function Trig_zhushenhuanghun_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=0
local integer n=0
local player p=GetTriggerPlayer()
local unit u=GetTriggerUnit()
loop
exitwhen i>11
set n=0
if IsPlayerEnemy(p, Player(i)) then
call UnitAddAbility(udg_PlayerLockToHero[GetConvertedPlayerId(Player(i))],'A0CV')
   loop
   exitwhen n>11
   if IsPlayerAlly(Player(i), Player(n)) then
   call SetPlayerAlliance( Player(i), Player(n), ALLIANCE_SHARED_VISION, false )
   endif
   set n=n+1
   endloop
else
call UnitAddAbility(udg_PlayerLockToHero[GetConvertedPlayerId(Player(i))],'A0CW')
endif
set i=i+1
endloop
call TimerStart(tm,4+GetUnitAbilityLevel(u, 'A0CT'),false,function removeheiye )
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call SetPlayerAbilityAvailable( p, 'A0CT', false )
set u=null
set tm=null
set p=null
endfunction

//===========================================================================
function InitTrig_zhushenhuanghun takes nothing returns nothing
    set gg_trg_zhushenhuanghun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhushenhuanghun, Condition( function Trig_zhushenhuanghun_Conditions ) )
    call TriggerAddAction( gg_trg_zhushenhuanghun, function Trig_zhushenhuanghun_Actions )
endfunction
