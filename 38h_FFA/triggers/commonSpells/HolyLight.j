
//===========================================================================
// Trigger: HolyLight
//===========================================================================
function Trig_HolyLight_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AHhb' 
endfunction

function UnitIsNotHL takes nothing returns boolean 
return  GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 

function Trig_HolyLight_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local group g=CreateGroup()
local boolexpr b
local unit m



set b=Condition(function UnitIsNotHL)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,250,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call UnitDamageTarget( u, m, 40+GetUnitAbilityLevel(u,'AHhb')*60, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set u=null
set g=null
set b=null
set m=null
endfunction

//===========================================================================
function InitTrig_HolyLight takes nothing returns nothing
    set gg_trg_HolyLight = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HolyLight, Condition( function Trig_HolyLight_Conditions ) )
    call TriggerAddAction( gg_trg_HolyLight, function Trig_HolyLight_Actions )
endfunction
