
//===========================================================================
// Trigger: clap
//===========================================================================
function Trig_clap_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08E' 
endfunction

function clapfilter takes nothing returns boolean
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and  IsUnitAlly(GetFilterUnit(), GetTriggerPlayer()) == false
endfunction




function Trig_clap_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A08E')
local group g=CreateGroup()
local boolexpr b=Condition(function clapfilter)
local real far=((level*50)+300)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local unit target
local real xt
local real yt
local integer str=GetHeroStr(u, true)
local real sr=(0.5*level)+1.5
local real hh

call GroupEnumUnitsInRange(g,x,y,far,b)
call SetUnitAnimation( u, "Attack Slam" )

loop
exitwhen IsUnitGroupEmptyBJ(g)==true
set target=GroupPickRandomUnit(g)
set xt=GetUnitX(target)
set yt=GetUnitY(target)
set hh=GetUnitState(target, UNIT_STATE_MAX_LIFE)*(0.08+(level*0.04))
call UnitDamageTarget( u, target,sr*str+hh, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", target, "origin") )
call SetUnitX(target,x)
call SetUnitY(target,y)
call GroupRemoveUnit(g,target)
endloop

call DestroyGroup(g)
set g=null
call DestroyBoolExpr(b)
set b=null
set u=null
set target=null
endfunction

//===========================================================================
function InitTrig_clap takes nothing returns nothing
    set gg_trg_clap = CreateTrigger(  )
    
    call TriggerAddCondition( gg_trg_clap, Condition( function Trig_clap_Conditions ) )
    call TriggerAddAction( gg_trg_clap, function Trig_clap_Actions )
endfunction
