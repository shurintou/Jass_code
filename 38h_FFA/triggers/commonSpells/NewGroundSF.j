
//===========================================================================
// Trigger: NewGroundSF
//===========================================================================
function Trig_NewGroundSF_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04L' 
endfunction

function SFAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer g=LoadInteger(udg_Hash3,i,2)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real c=0
local real s=0
local integer n=0
local group gr
local unit t
local integer level
local player p
local unit m
local real h

if g>0 then
set c=LoadReal(udg_Hash3,i,3)
set s=LoadReal(udg_Hash3,i,4)
call SetUnitX(u,x+40*c)
call SetUnitY(u,y+40*s)
call SaveInteger(udg_Hash3,i,2,g-1)
else
set p=GetOwningPlayer(u)
set gr=CreateGroup()
set level=LoadInteger(udg_Hash3,i,10)
set h=20+(30*level)
call UnitApplyTimedLife( u, 'BTLF',0.1)
set c=LoadReal(udg_Hash3,i,5)
set s=LoadReal(udg_Hash3,i,6)
call SetUnitX(u,c)
call SetUnitY(u,s)
set m=CreateUnit(p,'n001',c,s,0)
call UnitApplyTimedLife( m, 'BTLF',5)
call UnitAddAbility(m,'Aens')
call SetUnitAbilityLevel( m, 'Aens', level )
call GroupEnumUnitsInRange(gr,c,s,250,null) 
loop
set t=FirstOfGroup(gr)
exitwhen t==null
if IsUnitEnemy(t, p) == true then
call UnitDamageTarget( m, t, h, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call IssueTargetOrderById( m, 852106, t )
endif
call GroupRemoveUnit(gr,t)
set t=null
endloop
call DestroyGroup(gr)
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set gr=null
set t=null
set m=null
set p=null
set u=null
endfunction



function Trig_NewGroundSF_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real dx=GetSpellTargetX()
local real dy=GetSpellTargetY()
local player p=GetTriggerPlayer()
//local unit m=CreateUnit(p,'n00O',x,y,0)
local real ex=x-dx
local real ey=y-dy
local real dis=SquareRoot(ex * ex + ey * ey)
local timer tm=CreateTimer()
local unit t=CreateUnit(p,'n00O',x,y,0)
local integer level=GetUnitAbilityLevel(u, 'A04L')
local integer n=R2I(dis/40)
local real angle=Atan2(dy-y, dx-x)
local integer g=GetHandleId(tm)


call SetUnitAbilityLevel( t, 'Aens', level )
call SaveReal(udg_Hash3,g,5,dx)
call SaveReal(udg_Hash3,g,6,dy)
call SaveReal(udg_Hash3,g,3,Cos(angle))
call SaveReal(udg_Hash3,g,4,Sin(angle))
call SaveInteger(udg_Hash3,g,2,n)
call SaveInteger(udg_Hash3,g,10,level)
call SaveUnitHandle(udg_Hash3,g,1,t)
call TimerStart(tm,0.05,true,function SFAct)

set tm=null
set u=null
set p=null
set t=null
endfunction

//===========================================================================
function InitTrig_NewGroundSF takes nothing returns nothing
    set gg_trg_NewGroundSF = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_NewGroundSF, Condition( function Trig_NewGroundSF_Conditions ) )
    call TriggerAddAction( gg_trg_NewGroundSF, function Trig_NewGroundSF_Actions )
endfunction
