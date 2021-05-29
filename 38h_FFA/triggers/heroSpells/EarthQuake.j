// Trigger: EarthQuake
//
//  local force f=udg_OnlinePlayer
// local player p
// local player up=GetOwningPlayer(u)
// loop
// set p=ForcePickRandomPlayer(f)
// exitwhen p==null
// call ForceRemovePlayer( f, p )
// if IsPlayerEnemy(p, up) then
// call ResetToGameCameraForPlayer( p, 0 )
// endif
// set p=null
// endloop
// call DestroyForce( f )
// set f=null
// set p=null
// set up=null
//===========================================================================
function Trig_EarthQuake_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A033' 
endfunction

function chongzhidizhenjingtou takes nothing returns nothing
call ResetToGameCameraForPlayer( GetEnumPlayer(), 1 )
endfunction

function EarthQuakeAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,3)
local unit u
local unit m

if n>0 then
set u=LoadUnitHandle(udg_Hash1,i,1)
set m=LoadUnitHandle(udg_Hash1,i,2)
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
call IssueImmediateOrderById( m, 852096 )
call SaveInteger(udg_Hash1,i,3,n-1)
else
call ResetToGameCamera( 0 )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction



function Trig_EarthQuake_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A033')
local integer n=4+2*level
local integer i=GetHandleId(tm)
local player up=GetTriggerPlayer()
local unit m=CreateUnit(up,'n001',GetUnitX(u),GetUnitY(u),0)
local force f=udg_OnlinePlayer
local player p

call UnitAddAbility(m,'A034')
call SetUnitAbilityLevel(m,'A034',level)
call UnitApplyTimedLife( m, 'BTLF', 10 )
//call IssueImmediateOrderById( m, 852096 )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveInteger(udg_Hash1,i,3,n)

loop
set p=ForcePickRandomPlayer(f)
exitwhen p==null
call ForceRemovePlayer( f, p )
if IsPlayerEnemy(p, up) then
call CameraSetEQNoiseForPlayer( p, 13.00 )
endif
set p=null
endloop

call TimerStart(tm,0.38,true,function EarthQuakeAct)
call DestroyForce( f )

set f=null
set p=null
set up=null
set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_EarthQuake takes nothing returns nothing
    set gg_trg_EarthQuake = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_EarthQuake, Condition( function Trig_EarthQuake_Conditions ) )
    call TriggerAddAction( gg_trg_EarthQuake, function Trig_EarthQuake_Actions )
endfunction
