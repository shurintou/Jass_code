
//===========================================================================
// Trigger: waterhole
//
// call DestroyEffect( AddSpecialEffect("Doodads\\Cinematic\\RisingWaterWIDEDoodad\\RisingWaterWIDEDoodad.mdl", 0, 0) )
//===========================================================================
function Trig_waterhole_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AHbz' 
endfunction


function water takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false
endfunction


function moveinwater takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local real x=LoadReal(udg_Hash1, n, 1)
local real y=LoadReal(udg_Hash1, n, 2)
local integer i=LoadInteger(udg_Hash1, n, 3)
local unit u=LoadUnitHandle(udg_Hash1, n, 4)
local group g
local unit m
local boolexpr b
local integer level=GetUnitAbilityLevel(u, 'AHbz'  )
local integer h=5

call SaveInteger( udg_Hash1, n, 3, i-1 )
if i>0 then
set udg_lsu=u
set g=CreateGroup()
set b=Condition(function water)
call GroupEnumUnitsInRange(g,x,y,450,b) 
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", x, y) )
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call SetUnitX(m,x)
call SetUnitY(m,y)
   if udg_WeatherN==1 then
   call UnitDamageTarget( u, m, 60+(30*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
   else
   call UnitDamageTarget( u, m, 40+(20*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
   endif
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)
endif
//////////////////////////
if i==0 then
loop
exitwhen h>17
call RemoveUnit(LoadUnitHandle(udg_Hash1, n,h))
set h=h+1
endloop
call TerrainDeformStop(udg_T,1000)
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)
call SetWaterDeforms( false )
endif

set u=null
set g=null
set tm=null
set b=null
set m=null
endfunction





function Trig_waterhole_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u, 'AHbz'  )
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local timer tm=CreateTimer()
local integer n=GetHandleId(tm)
local integer i=0
local player p=GetTriggerPlayer()
local unit m
local real pia=3.1415926
local real da=0
set udg_T=TerrainDeformCrater(x, y, 525, 500.00, 9000, false)

loop 
exitwhen i>12
set da=pia*30*i/180
set m=CreateUnit(p,'n00E',x+(500*Cos(da)),y+(500*Sin(da)),30*i)
call UnitApplyTimedLife( m, 'BTLF', 6 )
set i=i+1
call SaveUnitHandle(udg_Hash1,n,4+i,m)
endloop
call SaveReal( udg_Hash1, n, 1, x )
call SaveReal( udg_Hash1, n, 2, y )
call SaveInteger( udg_Hash1, n, 3, 6 )
call SaveUnitHandle(udg_Hash1,n,4,u)
call TimerStart(tm,1,true,function moveinwater)
call SetWaterDeforms( true )

set m=null
set u=null
set tm=null
set p=null
endfunction

//===========================================================================
function InitTrig_waterhole takes nothing returns nothing
    set gg_trg_waterhole = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_waterhole, Condition( function Trig_waterhole_Conditions ) )
    call TriggerAddAction( gg_trg_waterhole, function Trig_waterhole_Actions )
endfunction
