
//===========================================================================
// Trigger: AroundChuanCiT
//
// udg_lsu
// set m=CreateUnit(p,'n001',x,y,0)
//      call UnitAddAbility(m,'ACmp')
//      call SetUnitAbilityLevel(m,'ACmp',level)
//===========================================================================
function Trig_AroundChuanCiT_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'AOws' 
endfunction

function UnitIsNotY takes nothing returns boolean 
return UnitHasBuffBJ(GetFilterUnit(), 'B006') == true and GetUnitDefaultFlyHeight(GetFilterUnit())<10
endfunction 


function uprouci takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local group g=LoadGroupHandle(udg_Hash1,i,1)
local unit u

loop 
exitwhen IsUnitGroupEmptyBJ(g) == true
set u=FirstOfGroup(g)
call GroupRemoveUnit(g,u)
call SetUnitFlyHeight( u, 0.00, 1080.00 )
endloop
call GroupClear(g)
call DestroyGroup(g)
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set g=null
set u=null
endfunction


function harrouci takes nothing returns nothing
local unit u=GetEnumUnit()

call UnitAddAbility( u, 'Amrf' )
call UnitRemoveAbility( u, 'Amrf' )
call SetUnitFlyHeight( u, 360.00, 1080.00 )
call UnitApplyTimedLife( CreateUnit(GetOwningPlayer(udg_lsu),'n00D',GetUnitX(u),GetUnitY(u),0), 'BTLF', 4 )
call UnitRemoveAbility( u, 'B006' )

set u=null
endfunction



function Trig_AroundChuanCiT_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local real dx=0
local real dy=0
local player p=GetTriggerPlayer()
local unit t
local unit m
local timer tm=CreateTimer()
local integer level=GetUnitAbilityLevel(u,'AOws')
local integer n=GetHandleId(tm)
local real pia=3.1415926
local integer i=0
local group g
local boolexpr b

loop
     exitwhen i>12
     set t=CreateUnit(p,'n001',x,y,0)
     set m=CreateUnit(p,'n001',x,y,0)
     call UnitApplyTimedLife( t, 'BTLF', 4 )
     call UnitApplyTimedLife( m, 'BTLF', 4 )
     set dx=x+(100*(Cos(30*i)*pia))
     set dy=y+(100*(Sin(30*i)*pia))
     call UnitAddAbility(m,'ACmp')
     call SetUnitAbilityLevel(m,'ACmp',level)
     call IssuePointOrderById( m, 852555, dx, dy )
     call UnitAddAbility(t,'A00H')
     call SetUnitAbilityLevel(t,'A00H',level)
     call IssuePointOrderById( t, 852560, dx,dy )
     set i=i+1
     endloop

set g=CreateGroup()
set b=Condition(function UnitIsNotY)
call GroupEnumUnitsInRange(g,x,y,750+100*level,b)
set udg_lsu=u
call ForGroup(g,function harrouci)
call SaveGroupHandle(udg_Hash1,n,1,g)
call TimerStart(tm,0.33,false,function uprouci)
call DestroyBoolExpr(b)

set u=null
set m=null
set p=null
set g=null
set b=null
set t=null
set tm=null
endfunction

//===========================================================================
function InitTrig_AroundChuanCiT takes nothing returns nothing
    set gg_trg_AroundChuanCiT = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AroundChuanCiT, Condition( function Trig_AroundChuanCiT_Conditions ) )
    call TriggerAddAction( gg_trg_AroundChuanCiT, function Trig_AroundChuanCiT_Actions )
endfunction
