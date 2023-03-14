
//===========================================================================
// Trigger: ShengYan
//===========================================================================
function Trig_ShengYan_Conditions takes nothing returns boolean
    local real ex=GetUnitX(GetTriggerUnit())-GetUnitX(GetEventTargetUnit())
    local real ey=GetUnitY(GetTriggerUnit())-GetUnitY(GetEventTargetUnit())
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true and SquareRoot(ex * ex + ey * ey)<200
endfunction

function Trig_ShengYan_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=GetEventTargetUnit()
local integer level=GetUnitAbilityLevel(u, 'A0A7')
local real r=0.01*level
local real h=r*GetUnitState(t, UNIT_STATE_LIFE)*0.5
call UnitDamageTarget( u, t,h , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", u, "chest") )
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+h )
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_ShengYan takes nothing returns nothing
    set gg_trg_ShengYan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ShengYan, Condition( function Trig_ShengYan_Conditions ) )
    call TriggerAddAction( gg_trg_ShengYan, function Trig_ShengYan_Actions )
endfunction
