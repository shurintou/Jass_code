
//===========================================================================
// Trigger: HuanXiangFanJi
//===========================================================================
function Trig_HuanXiangFanJi_Conditions takes nothing returns boolean
    local integer i=GetRandomInt(1, 100)
 return   i<18 and GetUnitAbilityLevel(GetAttacker(),'Aloc') == 0 and IsUnitIllusion(GetTriggerUnit())==true
endfunction

function UnitIsNotFanJiu takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 


function Trig_HuanXiangFanJi_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local integer level=GetUnitAbilityLevel(udg_PlayerLockToHero[GetConvertedPlayerId(GetTriggerPlayer())],'A02P')
local group g=CreateGroup()
local boolexpr b=Condition(function UnitIsNotFanJiu)

call SetUnitAnimation( u, "Attack Walk Stand" )
set udg_lsu=u
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),300,b)
loop 
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call GroupRemoveUnit(g,m)
call UnitDamageTarget( u, m, 50+(25*level), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodPeasant.mdl", m, "chest") )
endloop

call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set g=null
set b=null
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_HuanXiangFanJi takes nothing returns nothing
    set gg_trg_HuanXiangFanJi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HuanXiangFanJi, Condition( function Trig_HuanXiangFanJi_Conditions ) )
    call TriggerAddAction( gg_trg_HuanXiangFanJi, function Trig_HuanXiangFanJi_Actions )
endfunction
