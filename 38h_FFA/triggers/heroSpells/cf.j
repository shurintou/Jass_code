
//===========================================================================
// Trigger: cf
//===========================================================================
function Trig_cf_Conditions takes nothing returns boolean
    return GetUnitAbilityLevel(LoadUnitHandle(udg_Hash1,234,159),'B02H')> 0
endfunction

function Trig_cf_Actions takes nothing returns nothing
local unit t=GetTriggerUnit()
local unit u=LoadUnitHandle(udg_Hash1,234,159)
local group g=LoadGroupHandle(udg_Hash1,234,160)

if IsUnitEnemy(t, GetOwningPlayer(u)) == true and IsUnitInGroup(t,g)==false then
call GroupAddUnit( g, t)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", t, "origin") )
call UnitDamageTarget( u, t, 80+10*GetUnitAbilityLevel(u,'A07G'), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif

set u=null
set t=null
set g=null
endfunction

//===========================================================================
function InitTrig_cf takes nothing returns nothing
    set gg_trg_cf = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_cf, Condition( function Trig_cf_Conditions ) )
    call TriggerAddAction( gg_trg_cf, function Trig_cf_Actions )
endfunction
