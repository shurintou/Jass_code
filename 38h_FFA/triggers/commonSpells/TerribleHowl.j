
//===========================================================================
// Trigger: TerribleHowl
//===========================================================================
function Trig_TerribleHowl_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04T' 
endfunction

function howlact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local real angle=LoadReal(udg_Hash3,i,2)
local integer n=LoadInteger(udg_Hash3,i,5)
local real x=LoadReal(udg_Hash3,i,3)
local real y=LoadReal(udg_Hash3,i,4)
local real c=Cos(angle)
local real s=Sin(angle)
local real ds=350*n
local real dx=x+ds*c
local real dy=y+ds*s
local integer level=GetUnitAbilityLevel(u,'A04T')
local unit m

if n<5 then
call SaveInteger(udg_Hash3,i,5,n+1)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl", dx, dy) )
set m=CreateUnit(GetOwningPlayer(u),'n006',dx,dy,0)
call UnitAddAbility( m, 'ANht' )
call SetUnitAbilityLevel( m, 'ANht', level )
call IssueImmediateOrderById( m, 852588 )
//call UnitAddAbility( m, 'A04S' )
//call SetUnitAbilityLevel( m, 'A04S', level )
call HarmGroup(m,350,30+10*level)
call IssueImmediateOrderById( m, 852526 )
call UnitApplyTimedLife( m, 'BTLF', 5 )
else
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction



function Trig_TerribleHowl_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer level=GetUnitAbilityLevel(u,'A04T')
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=realangle(sy-y,sx-x)
local real c=Cos(angle)
local real s=Sin(angle)

set m=CreateUnit(GetOwningPlayer(u),'n006',x,y,0)
call UnitAddAbility( m, 'ANht' )
call SetUnitAbilityLevel( m, 'ANht', level )
call IssueImmediateOrderById( m, 852588 )
call UnitAddAbility( m, 'A04S' )
call SetUnitAbilityLevel( m, 'A04S', level )
call IssueImmediateOrderById( m, 852526 )
call UnitApplyTimedLife( m, 'BTLF', 5 )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl", x, y) )

call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveReal(udg_Hash3,i,2,angle)
call SaveReal(udg_Hash3,i,3,x)
call SaveReal(udg_Hash3,i,4,y)
call SaveInteger(udg_Hash3,i,5,1)
call TimerStart(tm,0.25,true,function howlact)


set u=null
set m=null
set tm=null
endfunction

//===========================================================================
function InitTrig_TerribleHowl takes nothing returns nothing
    set gg_trg_TerribleHowl = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_TerribleHowl, Condition( function Trig_TerribleHowl_Conditions ) )
    call TriggerAddAction( gg_trg_TerribleHowl, function Trig_TerribleHowl_Actions )
endfunction
