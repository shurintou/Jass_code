
//===========================================================================
// Trigger: GOGOGO
//
// udg_Hash1,GetHandleId(u),297 //发条的计时器call DisableTrigger( gg_trg_GetCloseToGOGO )call EnableTrigger( gg_trg_GetCloseToGOGO )call SaveTimerHandle(udg_Hash1,GetHandleId(u),297,tm)
//===========================================================================
function Trig_GOGOGO_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06I' 
endfunction

function movegogogo takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,4)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local real x=0
local real y=0
local group g
local unit t
local unit m


if n>0 then
set g=CreateGroup()
set x=RealX(GetUnitX(u)+LoadReal(udg_Hash1,i,2))
set y=RealY(GetUnitY(u)+LoadReal(udg_Hash1,i,3))
call SetUnitX(u,x)
call SetUnitY(u,y)
call PanCameraToForPlayer(GetOwningPlayer(u),x,y)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\ForkedLightning\\ForkedLightningTarget.mdl", x, y) )
call SaveInteger(udg_Hash1,i,4,n-1)
call GroupEnumUnitsInRange(g,x,y,150,null)
loop  
set t=FirstOfGroup(g)
exitwhen t==null or n==10000
   if IsUnitEnemy(t, GetOwningPlayer(u)) and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false and GetUnitTypeId(t) != 'e000' and GetUnitTypeId(t) != 'Hdgo' and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
   set m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
   call IssueTargetOrderById( u, 851983, t )
   call UnitAddAbility( m, 'A06K' )
   call SetUnitAbilityLevel( m, 'A06K', GetUnitAbilityLevel(u, 'A06I') )
   call UnitApplyTimedLife( m, 'BTLF', 2 )
   call IssuePointOrderById( m, 852232, x, y )
   call FlushChildHashtable( udg_Hash1, i )
   call PauseTimer(tm)
   call DestroyTimer(tm)
   set n=10000
   endif
call GroupRemoveUnit(g,t)
set t=null
endloop
call DestroyGroup(g)
else

call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif


set g=null
set m=null
set t=null
set tm=null
set u=null 
endfunction


function Trig_GOGOGO_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer level=GetUnitAbilityLevel(u,'A06I')
local real angle=Atan2(GetSpellTargetY()-GetUnitY(u), GetSpellTargetX()-GetUnitX(u))
local real c=100*Cos(angle)
local real s=100*Sin(angle)
local integer n=(15+5*level)

call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveReal(udg_Hash1,i,2,c)
call SaveReal(udg_Hash1,i,3,s)
call SaveInteger(udg_Hash1,i,4,n)
call TimerStart(tm,0.04,true,function movegogogo)


set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_GOGOGO takes nothing returns nothing
    set gg_trg_GOGOGO = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GOGOGO, Condition( function Trig_GOGOGO_Conditions ) )
    call TriggerAddAction( gg_trg_GOGOGO, function Trig_GOGOGO_Actions )
endfunction
