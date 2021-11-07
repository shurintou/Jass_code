
//===========================================================================
// Trigger: CCCkaominjie
//
// HASH表中索引1为英雄
//===========================================================================
function Trig_CCCkaominjie_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CG' 
endfunction

function Trig_CCCkaominjie_Actions takes nothing returns nothing//0即为没有技能了
    local unit u=GetTriggerUnit()
    local integer level=GetUnitAbilityLevel(u, 'A0CG')
    local real r=60+20*level
    local integer i=GetHandleId(gg_trg_xueCCC)
    local unit t=GetSpellTargetUnit()
    call UnitDamageTarget( u, t, r+2*I2R(GetHeroAgi(u, true)), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    call SaveInteger(udg_Hash1,GetHandleId(gg_trg_CCCkaominjie),2,level)
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\ForestBolt.mdx",t , "origin") )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\AnimateDead\\AnimateDeadTarget.mdl", u, "origin") )
    call UnitRemoveAbility( u, 'A0CG' )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0CG', false )
    call SaveInteger(udg_Hash1,i,2,0)
    call SaveInteger(udg_Hash1,i,1,7)
    set u=null
    set t=null
endfunction

//===========================================================================
function InitTrig_CCCkaominjie takes nothing returns nothing
    set gg_trg_CCCkaominjie = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_CCCkaominjie, Condition( function Trig_CCCkaominjie_Conditions ) )
    call TriggerAddAction( gg_trg_CCCkaominjie, function Trig_CCCkaominjie_Actions )
endfunction
