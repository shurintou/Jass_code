
//===========================================================================
// Trigger: HighFire
//===========================================================================
function Trig_HighFire_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06G' 
endfunction

function highfireact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,3)
local unit u
local unit m
local real x=0
local real y=0

if n>0 then
set u=LoadUnitHandle(udg_Hash1,i,1)
set m=LoadUnitHandle(udg_Hash1,i,2)
call SaveInteger(udg_Hash1,i,3,n-1)
set x=GetUnitX(u)
set y=GetUnitY(u)
call SetUnitX(m,x)
call SetUnitY(m,y)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl", u, "chest") )
//call IssuePointOrderById( m, 851983, x+GetRandomReal(-60,60), y+GetRandomReal(-60,60) )
else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction

function Trig_HighFire_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(tm)
local real x
local real y
local unit m=CreateUnit(GetTriggerPlayer(),'hgyr',GetUnitX(u),GetUnitY(u),0)

call SetUnitAbilityLevel( m, 'A06A', GetUnitAbilityLevel(u, 'A06G') )
call UnitApplyTimedLife( m, 'BTLF', 10.5 )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveUnitHandle(udg_Hash1,GetHandleId(u),598,m)
call SaveInteger(udg_Hash1,i,3,50)
call TimerStart(tm,0.2,true,function highfireact)

set tm=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_HighFire takes nothing returns nothing
    set gg_trg_HighFire = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HighFire, Condition( function Trig_HighFire_Conditions ) )
    call TriggerAddAction( gg_trg_HighFire, function Trig_HighFire_Actions )
endfunction
