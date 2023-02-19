
//===========================================================================
// Trigger: TrueEmpty
//===========================================================================
function Trig_TrueEmpty_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04G' 
endfunction

function trueemptyb takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false
endfunction



function Trig_TrueEmpty_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local group g
local unit m
local boolexpr b
local integer level=GetUnitAbilityLevel(u, 'A04G'  )



set udg_lsu=u
set g=CreateGroup()
set b=Condition(function trueemptyb)
call GroupEnumUnitsInRange(g,x,y,200+100*level,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call SetUnitX(m,x)
call SetUnitY(m,y)
call UnitDamageTarget( u, m, 40+(40*level), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
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
function InitTrig_TrueEmpty takes nothing returns nothing
    set gg_trg_TrueEmpty = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_TrueEmpty, Condition( function Trig_TrueEmpty_Conditions ) )
    call TriggerAddAction( gg_trg_TrueEmpty, function Trig_TrueEmpty_Actions )
endfunction
