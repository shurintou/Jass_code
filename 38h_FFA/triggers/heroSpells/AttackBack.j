
//===========================================================================
// Trigger: AttackBack
//===========================================================================
function Trig_AttackBack_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function moda takes real r returns real 
if r<0 then
return r*(-1)
else
return r
endif
endfunction


function Trig_AttackBack_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=GetEventTargetUnit()
local real uf=GetUnitFacing(u)
local real um=GetUnitFacing(m)
local real agi=GetHeroAgi(u, true)
local integer level=GetUnitAbilityLevel(u, 'A05Z' )
local real rate=0.25+0.25*level


if moda(uf-um) < 95.00 or moda(uf-um) ==0 then
call UnitDamageTarget( u, m, agi*rate, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", m, "chest") )
endif

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_AttackBack takes nothing returns nothing
    set gg_trg_AttackBack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AttackBack, Condition( function Trig_AttackBack_Conditions ) )
    call TriggerAddAction( gg_trg_AttackBack, function Trig_AttackBack_Actions )
endfunction
