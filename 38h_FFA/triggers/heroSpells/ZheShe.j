
//===========================================================================
// Trigger: ZheShe
//===========================================================================
function Trig_ZheShe_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventDamageSource(), GetTriggerPlayer()) == true and GetEventDamage() > 0 and  GetUnitTypeId(GetEventDamageSource())!= 'e000'
endfunction

function zheshe takes nothing returns nothing
local unit u=GetEnumUnit()
local unit m=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_ZheShe),1)
local real x=GetUnitX(m)
local real y=GetUnitY(m)
local real dx=GetUnitX(u)
local real dy=GetUnitY(u)
local real ex=dx-x
local real ey=dy-y

if IsUnitEnemy(u, GetOwningPlayer(m)) and SquareRoot(ex*ex+ey*ey)<1000 then
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayDamage.mdl", u, "chest") )
call UnitDamageTarget( m, u, udg_N, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
endif

set u=null
set m=null
endfunction



function Trig_ZheShe_Actions takes nothing returns nothing
local real rh=GetEventDamage()
local unit m=GetTriggerUnit()


set udg_N=R2I(0.05*GetUnitAbilityLevel(m, 'AEev')*rh)

if rh<1500 then
call ForGroup(udg_CheckHpGroup,function zheshe)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayDamage.mdl", m, "chest") )
call SetUnitState( m, UNIT_STATE_LIFE, GetUnitState(m, UNIT_STATE_LIFE)+udg_N )
endif


set m=null
endfunction

//===========================================================================
function InitTrig_ZheShe takes nothing returns nothing
    set gg_trg_ZheShe = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ZheShe, Condition( function Trig_ZheShe_Conditions ) )
    call TriggerAddAction( gg_trg_ZheShe, function Trig_ZheShe_Actions )
endfunction
