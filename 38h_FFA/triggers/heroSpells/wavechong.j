
//===========================================================================
// Trigger: wavechong
//===========================================================================
function Trig_wavechong_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08T' 
endfunction

function moveslam takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1, n, 0)
local unit m=LoadUnitHandle(udg_Hash1, n, 1)
local integer i=LoadInteger(udg_Hash1, n, 2)
local real c=LoadReal(udg_Hash1, n, 3)
local real s=LoadReal(udg_Hash1, n, 4)
local real x
local real y

if i<8+2*GetUnitAbilityLevel(u,'A08T') then
set i=i+1
set x=GetUnitX(m)+(50*c)
set y=GetUnitY(m)+(50*s)
call SetUnitX(m,x)
call SetUnitY(m,y)
call SetUnitX(u,x)
call SetUnitY(u,y)
call IssueImmediateOrderById( m, 852127 )
call SaveInteger(udg_Hash1,n,2,i)
else
call RemoveUnit(m)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set u=null
set tm=null
set m=null
endfunction



function Trig_wavechong_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real r=GetUnitFacing(u)*3.1415/180
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local integer level=GetUnitAbilityLevel(u,'A08T')
local real dx=0
local real dy=0
local unit m
local real c=Cos(r)
local real s=Sin(r)
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)




set m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
call UnitAddAbility(m,'A08R')
call SetUnitAbilityLevel(m,'A08R',level)
call IssueImmediateOrderById( m, 852127 )
call UnitApplyTimedLife( m, 'BTLF', 10 )
call SaveUnitHandle(udg_Hash1,n,0,u)
call SaveUnitHandle(udg_Hash1,n,1,m)
call SaveInteger(udg_Hash1,n,2,0)
call SaveReal(udg_Hash1,n,3,c)
call SaveReal(udg_Hash1,n,4,s)
call TimerStart(tm,0.02,true,function moveslam)


set m=null
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_wavechong takes nothing returns nothing
    set gg_trg_wavechong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_wavechong, Condition( function Trig_wavechong_Conditions ) )
    call TriggerAddAction( gg_trg_wavechong, function Trig_wavechong_Actions )
endfunction
