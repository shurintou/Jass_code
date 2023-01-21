
//===========================================================================
// Trigger: DarkShadowWave
//===========================================================================
function Trig_DarkShadowWave_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANhw' 
endfunction

function darkshadowb takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0
endfunction



function Trig_DarkShadowWave_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g
local unit m
local boolexpr b
local integer level=GetUnitAbilityLevel(u, 'ANhw'  )
local unit n=GetSpellTargetUnit()


set udg_lsu=u
set g=CreateGroup()
set b=Condition(function darkshadowb)
call GroupEnumUnitsInRange(g,GetUnitX(n),GetUnitY(n),250,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call UnitDamageTarget( u, m, 70+(20*level), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)


set u=null
set g=null
set m=null
set b=null
set n=null
endfunction

//===========================================================================
function InitTrig_DarkShadowWave takes nothing returns nothing
    set gg_trg_DarkShadowWave = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DarkShadowWave, Condition( function Trig_DarkShadowWave_Conditions ) )
    call TriggerAddAction( gg_trg_DarkShadowWave, function Trig_DarkShadowWave_Actions )
endfunction
