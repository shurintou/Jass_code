
//===========================================================================
// Trigger: QuakeWave
//===========================================================================
function Trig_QuakeWave_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04V' 
endfunction


function UnitIsNotQW takes nothing returns boolean 
return  GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false
endfunction


function Trig_QuakeWave_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local group g=CreateGroup()
local boolexpr b
local unit m
local integer level=GetUnitAbilityLevel(u,'A04V')
local real dx=GetUnitX(u)
local real dy=GetUnitY(u)

set b=Condition(function UnitIsNotQW)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,375,b) 
set u=CreateUnit(GetTriggerPlayer(),'n001',dx,dy,0)
call UnitAddAbility( u, 'Acdh' )
call SetUnitAbilityLevel( u, 'Acdh', level )
call UnitApplyTimedLife( u, 'BTLF', 5.00 )
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call IssueTargetOrderById( u, 852585, m )
call UnitDamageTarget( u, m, level*60, true, false,ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,m)
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\FrozenArmor.MDX", m, "chest") )
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
function InitTrig_QuakeWave takes nothing returns nothing
    set gg_trg_QuakeWave = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_QuakeWave, Condition( function Trig_QuakeWave_Conditions ) )
    call TriggerAddAction( gg_trg_QuakeWave, function Trig_QuakeWave_Actions )
endfunction
