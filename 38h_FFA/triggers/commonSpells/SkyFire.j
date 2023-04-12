
//===========================================================================
// Trigger: SkyFire
//===========================================================================
function Trig_SkyFire_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04P' 
endfunction


function skyfireb takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false  and GetUnitDefaultFlyHeight(GetFilterUnit())<10
endfunction


function skyfireact takes nothing returns nothing
local timer tt=GetExpiredTimer()
local integer i=GetHandleId(tt)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local unit m
local real x=LoadReal(udg_Hash3,i,3)
local real y=LoadReal(udg_Hash3,i,4)
local integer level=200+100*GetUnitAbilityLevel(u,'A04P')
local group g=CreateGroup()
local boolexpr b=Condition(function skyfireb)
local integer n=0

call UnitApplyTimedLife( CreateUnit(GetOwningPlayer(u),'n006',x,y,0), 'BTLF', 2 )
call RemoveUnit(LoadUnitHandle(udg_Hash3,i,2))
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,235,b)
set n=CountUnitsInGroup(g)
call DestroyEffect( AddSpecialEffect("war3mapImported\\ShrapnelShards.mdx", x, y) )

loop 
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call GroupRemoveUnit(g,m)
call UnitDamageTarget( u, m, level/n, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endloop
call DestroyBoolExpr(b)
call GroupClear(g)
call DestroyGroup(g)
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tt)
call DestroyTimer(tt)

set u=null
set m=null
set g=null
set b=null
set tt=null
endfunction




function Trig_SkyFire_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n00H',x,y,0)

call UnitApplyTimedLife( m, 'BTLF', 1.7 )
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveUnitHandle(udg_Hash3,i,2,m)
call SaveReal(udg_Hash3,i,3,x)
call SaveReal(udg_Hash3,i,4,y)
call TimerStart(tm,1.7,false,function skyfireact)

set u=null
set tm=null
set m=null
endfunction

//===========================================================================
function InitTrig_SkyFire takes nothing returns nothing
    set gg_trg_SkyFire = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_SkyFire, Condition( function Trig_SkyFire_Conditions ) )
    call TriggerAddAction( gg_trg_SkyFire, function Trig_SkyFire_Actions )
endfunction
