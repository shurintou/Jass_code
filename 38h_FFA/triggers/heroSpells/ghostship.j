
//===========================================================================
// Trigger: ghostship
//
// local real pia=face*3.1415926/180
// local unit m
// ANca
// //call IssuePointOrderById( m, 851986, dx, dy )
// //call UnitAddAbility( u, 'Amgr' )
// local real angle2=angle+3.1415926
// call IssuePointOrderById( m, 851986, x+1044*c, y+1044*s )
// //call SetPlayerAbilityAvailable(p , 'AOsh', false )
// //call UnitAddAbility( u, 'A009' )
// //call SetPlayerAbilityAvailable( p, 'A009', false )
// //call SetUnitAbilityLevel( u, 'SCae', 1+level )
// //call SetUnitAbilityLevel( u, 'ANca', level )
// //set m=CreateUnit(p,'h000',2*x-dx,2*y-dy,fa)
//===========================================================================
function Trig_ghostship_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AOsh' 
endfunction

function crashship  takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1, i, 1)
local integer n=LoadInteger(udg_Hash1,i, 2)
local real c
local real s
local real x
local real y

if n>0 then
call SaveInteger(udg_Hash1,i,2,n-1)
call SetUnitFacing(m,LoadReal(udg_Hash1,i,3))
set c=LoadReal(udg_Hash1,i,4)
set s=LoadReal(udg_Hash1,i,5)
set x=RealX(GetUnitX(m)+(15*c))
set y=RealY(GetUnitY(m)+(15*s))
call SetUnitX(m,x)
call SetUnitY(m,y)
else
call IssuePointOrderById( m, 852232, GetUnitX(m), GetUnitY(m) )
call UnitApplyTimedLife( m, 'BTLF', 0.14 )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set m=null
endfunction


function Trig_ghostship_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer level=GetUnitAbilityLevel(u,'AOsh')
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=realangle(sy-y,sx-x)
local real oangle=oppositeangle(angle)
local real fangle=Atan2(sy-y, sx-x)
local real c=Cos(fangle)
local real s=Sin(fangle)
local real dx=x+1044*c
local real dy=y+1044*s
local real ex=x+1044*Cos(oangle)
local real ey=y+1044*Sin(oangle)
local player p=GetOwningPlayer(u)
local real fa=angle*bj_RADTODEG


set m=CreateUnit(p,'h000',RealX(ex),RealY(ey),fangle*bj_RADTODEG)
call SetUnitAbilityLevel( m, 'ANin', level )
call SaveUnitHandle(udg_Hash1,i,1,m)
call SaveInteger(udg_Hash1,i,2,134)
call SaveReal(udg_Hash1,i,3,fangle*bj_RADTODEG)
call SaveReal(udg_Hash1,i,4,c)
call SaveReal(udg_Hash1,i,5,s)
call TimerStart(tm,0.02,true,function crashship)
call SetUnitPathing( m, false )


set u=null
set m=null
set p=null
set tm=null
endfunction

//===========================================================================
function InitTrig_ghostship takes nothing returns nothing
    set gg_trg_ghostship = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ghostship, Condition( function Trig_ghostship_Conditions ) )
    call TriggerAddAction( gg_trg_ghostship, function Trig_ghostship_Actions )
endfunction
