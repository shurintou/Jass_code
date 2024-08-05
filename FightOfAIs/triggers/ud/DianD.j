
//===========================================================================
// Trigger: DianD
//===========================================================================
function Trig_DianD_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t
    local integer i=GetHeroLevel(u)
    
    if GetRandomInt(1,70)<i  then
        set t=GetAttacker()
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Great Lightning.mdx",t, "origin") )
        call UnitAddAbility(t,'A08B')
        call UnitRemoveAbility(t,'A08B')
        call UnitDamageTarget( u, t, 50+2*i, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    
    set u=null
    set t=null
    return false
endfunction

//===========================================================================
function InitTrig_DianD takes nothing returns nothing
    set gg_trg_DianD = CreateTrigger(  )
    call DisableTrigger( gg_trg_DianD )
    call TriggerAddCondition( gg_trg_DianD, Condition( function Trig_DianD_Conditions ) )
endfunction
