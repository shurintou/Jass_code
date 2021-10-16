
//===========================================================================
// Trigger: EarthBomb
//===========================================================================
function Trig_EarthBomb_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03U' 
endfunction


function UnitIsNotEB takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0
endfunction

function earthbombact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local real x=LoadReal(udg_Hash1,i,2)
local real y=LoadReal(udg_Hash1,i,3)
local group g=CreateGroup()
local boolexpr b=Condition(function UnitIsNotEB)
local unit m

set m=CreateUnit(GetOwningPlayer(u),'n002',x,y,0)
call UnitApplyTimedLife(m , 'BTLF', 5.00 )
call SetUnitAbilityLevel( m, 'A05M', GetUnitAbilityLevel(u,'A03U') )
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,600,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call UnitDamageTarget( u, m, 0.35*GetUnitState(m, UNIT_STATE_MAX_LIFE), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)
call DestroyEffect( LoadEffectHandle(udg_Hash1,i,4) )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set g=null
set m=null
set u=null
set b=null
set tm=null
endfunction



function Trig_EarthBomb_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()

call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveReal(udg_Hash1,i,2,x)
call SaveReal(udg_Hash1,i,3,y)
call SaveEffectHandle(udg_Hash1,i,4,AddSpecialEffect("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", x, y) )
call TimerStart(tm,4-GetUnitAbilityLevel(u,'A03U'),false,function earthbombact)

set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_EarthBomb takes nothing returns nothing
    set gg_trg_EarthBomb = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_EarthBomb, Condition( function Trig_EarthBomb_Conditions ) )
    call TriggerAddAction( gg_trg_EarthBomb, function Trig_EarthBomb_Actions )
endfunction
