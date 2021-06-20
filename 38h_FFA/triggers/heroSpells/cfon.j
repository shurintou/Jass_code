
//===========================================================================
// Trigger: cfon
//===========================================================================
function Trig_cfon_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A07G' 
endfunction

function cfbolean takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0 and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE)>0
endfunction



function Trig_cfon_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g
local unit m
local boolexpr b
local integer level=GetUnitAbilityLevel(u, 'A07G'  )
local group f=LoadGroupHandle(udg_Hash1,234,160) 

call GroupClear(f)
set udg_lsu=u
set g=CreateGroup()
set b=Condition(function cfbolean)
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),265,b) 

loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", m, "origin") )
call UnitDamageTarget( u, m, 80+10*level, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
call GroupAddUnit( f, m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

//////////////////////////


set u=null
set g=null
set b=null
set m=null
set f=null
endfunction

//===========================================================================
function InitTrig_cfon takes nothing returns nothing
    set gg_trg_cfon = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_cfon, Condition( function Trig_cfon_Conditions ) )
    call TriggerAddAction( gg_trg_cfon, function Trig_cfon_Actions )
endfunction
