
//===========================================================================
// Trigger: Flare
//===========================================================================
function Trig_Flare_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06B' 
endfunction

function FlareAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer g=LoadInteger(udg_Hash3,i,2)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real c=0
local real s=0
local integer n=0

if g>0 then
set c=LoadReal(udg_Hash3,i,3)
set s=LoadReal(udg_Hash3,i,4)
call SetUnitX(u,x+550*c)
call SetUnitY(u,y+550*s)
call SaveInteger(udg_Hash3,i,2,g-1)
else
call UnitApplyTimedLife( u, 'BTLF',2)
set c=LoadReal(udg_Hash3,i,5)
set s=LoadReal(udg_Hash3,i,6)
call SetUnitX(u,c)
call SetUnitY(u,s)
call UnitApplyTimedLife( CreateUnit(GetOwningPlayer(u),'n006',c,s,0), 'BTLF', 5+GetUnitAbilityLevel(u, 'A06C') )
call IssuePointOrderById( u, 852060, c,s  )
call IssueImmediateOrderById( u, 852526 )
loop
exitwhen n>12
call DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\FlyingMachine\\FlyingMachineImpact.mdl", x+GetRandomReal(-600,600), y+GetRandomReal(-600,600)) )
set n=n+1
endloop
call HarmGroup(u,600,40+40*GetUnitAbilityLevel(u, 'A06C'))
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction

function Trig_Flare_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real dx=GetSpellTargetX()
local real dy=GetSpellTargetY()
local player p=GetTriggerPlayer()
local unit m=CreateUnit(p,'hdhw',x,y,0)
local real ex=x-dx
local real ey=y-dy
local real dis=SquareRoot(ex * ex + ey * ey)
local timer tm=CreateTimer()
local unit t=CreateUnit(p,'n006',x,y,0)
local integer level=GetUnitAbilityLevel(u, 'A06B')
local integer n=R2I(dis/550)
local real angle=Atan2(dy-y, dx-x)
local integer g=GetHandleId(tm)

call UnitAddAbility( t, 'ANtr' )
call UnitAddAbility( t, 'A06C' )
call SetUnitAbilityLevel( t, 'A06C', level )
call UnitAddAbility( t, 'Alfa' )
call SetUnitAbilityLevel( t, 'Alfa', level )
call IssuePointOrderById( m, 851984, dx, dy )
call UnitApplyTimedLife( m, 'BTLF', 1.2 )
call SaveReal(udg_Hash3,g,5,dx)
call SaveReal(udg_Hash3,g,6,dy)
call SaveReal(udg_Hash3,g,3,Cos(angle))
call SaveReal(udg_Hash3,g,4,Sin(angle))
call SaveInteger(udg_Hash3,g,2,n)
call SaveUnitHandle(udg_Hash3,g,1,t)
call TimerStart(tm,0.5,true,function FlareAct)

set tm=null
set u=null
set p=null
set t=null
set m=null
endfunction

//===========================================================================
function InitTrig_Flare takes nothing returns nothing
    set gg_trg_Flare = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Flare, Condition( function Trig_Flare_Conditions ) )
    call TriggerAddAction( gg_trg_Flare, function Trig_Flare_Actions )
endfunction
