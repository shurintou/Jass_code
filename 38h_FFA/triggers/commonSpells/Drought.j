
//===========================================================================
// Trigger: Drought
//===========================================================================
function Trig_Drought_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04H' 
endfunction

function drouhtb takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false  
endfunction


function drouhtdown takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local group g=LoadGroupHandle(udg_Hash3,i,1)
local unit m

loop 
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call GroupRemoveUnit(g,m)
call UnitRemoveAbility(m,'A04D')
if GetUnitDefaultFlyHeight(m)<10 then
call SetUnitFlyHeight( m, 0.00, 480.00 )
endif
endloop

call GroupClear(g)
call DestroyGroup(g)
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set g=null
set m=null
endfunction


function drouhtupact takes nothing returns nothing
local unit u=GetEnumUnit()
if GetUnitDefaultFlyHeight(u)<10 then
call UnitAddAbility( u, 'Amrf' )
call UnitRemoveAbility( u, 'Amrf' )
call SetUnitFlyHeight(  u, 480.00, 480.00 )
endif
call UnitAddAbility(u,'A04D')
set u=null
endfunction





function drouhtup takes nothing returns nothing
local timer tt=GetExpiredTimer()
local integer i=GetHandleId(tt)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local unit m=LoadUnitHandle(udg_Hash3,i,2)
local real x=LoadReal(udg_Hash3,i,3)
local real y=LoadReal(udg_Hash3,i,4)
local timer tm=CreateTimer()
local integer level=GetUnitAbilityLevel(u,'A04H')
local integer n=GetHandleId(tm)
local group g=CreateGroup()
local boolexpr b=Condition(function drouhtb)


set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,250,b)
call UnitApplyTimedLife( CreateUnit(GetOwningPlayer(u),'n006',x,y,0), 'BTLF', 2 )
call SaveGroupHandle(udg_Hash3,n,1,g)
call TimerStart(tm,0.75,false,function drouhtdown)
call ForGroup(g,function drouhtupact)
call SetUnitAbilityLevel( m, 'A04I', level )
call IssuePointOrderById( m, 852232, x, y )
call DestroyBoolExpr(b)
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tt)
call DestroyTimer(tt)

set u=null
set m=null
set g=null
set b=null
set tt=null
set tm=null
endfunction




function Trig_Drought_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n005',x,y,0)

call UnitApplyTimedLife( m, 'BTLF', 3 )
call SetUnitTimeScale( m, 15.00 )
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveUnitHandle(udg_Hash3,i,2,m)
call SaveReal(udg_Hash3,i,3,x)
call SaveReal(udg_Hash3,i,4,y)
call TimerStart(tm,2,false,function drouhtup)

set u=null
set tm=null
set m=null
endfunction

//===========================================================================
function InitTrig_Drought takes nothing returns nothing
    set gg_trg_Drought = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Drought, Condition( function Trig_Drought_Conditions ) )
    call TriggerAddAction( gg_trg_Drought, function Trig_Drought_Actions )
endfunction
