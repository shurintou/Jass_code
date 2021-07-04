
//===========================================================================
// Trigger: novawwww
//===========================================================================
function Trig_novawwww_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0D7' 
endfunction


function movenova takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local unit u
local integer i=LoadInteger(udg_Hash1, n, 2)
local real angle
local real c
local real s
local real x
local real y
local group g
local player p
local unit t
local real r
local unit m
local group f=LoadGroupHandle(udg_Hash1,n,5)
local unit o
local integer level


if i<10 then


set angle=LoadReal(udg_Hash1, n, 3)
set o=LoadUnitHandle(udg_Hash1, n, 4)
set c=Cos(angle)
set s=Sin(angle)
set i=i+1
set x=RealX(LoadReal(udg_Hash1, n, 8)+(100*i*c))
set y=RealY(LoadReal(udg_Hash1, n, 9)+(100*i*s))
set u=LoadUnitHandle(udg_Hash1, n, 0)
set p=GetOwningPlayer(u)
set level=GetUnitAbilityLevel(u,'A0D7')
call SaveInteger(udg_Hash1,n,2,i)
set g=CreateGroup()
call GroupEnumUnitsInRange(g,x,y,300,null)
set m=CreateUnit(p,'n007',x,y,0)
call SetUnitScale( m, 1.2, 1.2, 1.2 )
call UnitAddAbility( m, 'A0D8' )
call UnitApplyTimedLife(m , 'BTLF', 5 )
call DestroyEffect( AddSpecialEffect("war3mapImported\\FrostNova.MDX", x, y) )
loop
set t=FirstOfGroup(g)
exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitInGroup(t,f)==false then
    set o=CreateUnit(p,'n001',GetUnitX(t),GetUnitY(t),0)
    call UnitAddAbility(o,'A0D6')
    call SetUnitAbilityLevel( o, 'A0D6', level )
    call IssueTargetOrderById( o, 852226, t )
    call UnitApplyTimedLife( o, 'BTLF', 3 )
    call GroupAddUnit(f,t)
    endif
call GroupRemoveUnit(g,t)
set t=null
endloop
call DestroyGroup(g)

else
call GroupClear(f)
call DestroyGroup(f)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set g=null
set t=null
set f=null
set o=null
set p=null
set m=null
set u=null
set tm=null
endfunction


function Trig_novawwww_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real sx=GetSpellTargetX()
local real sy=GetSpellTargetY()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real angle=Atan2(sy-y, sx-x)
local real dx=0
local real dy=0
local real c=Cos(angle)
local real s=Sin(angle)
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)





call SaveUnitHandle(udg_Hash1,n,0,u)
call SaveInteger(udg_Hash1,n,2,0)
call SaveReal(udg_Hash1,n,3,angle)
call SaveReal(udg_Hash1,n,8,x)
call SaveReal(udg_Hash1,n,9,y)
call SaveGroupHandle(udg_Hash1,n,5,CreateGroup())
call TimerStart(tm,0.06,true,function movenova)


set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_novawwww takes nothing returns nothing
    set gg_trg_novawwww = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_novawwww, Condition( function Trig_novawwww_Conditions ) )
    call TriggerAddAction( gg_trg_novawwww, function Trig_novawwww_Actions )
endfunction
