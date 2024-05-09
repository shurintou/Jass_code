
//===========================================================================
// Trigger: UG1
//===========================================================================
function Trig_UG1_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    call UnitDamageTarget( u, t, 15.00+i, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl", t, "chest") )
    call IssueImmediateOrderById( u, 852183 )
    call IssueTargetOrderById( u, 852095, t )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_UG1 takes nothing returns nothing
    set gg_trg_UG1 = CreateTrigger(  )
    call DisableTrigger(gg_trg_UG1)
    call TriggerAddCondition( gg_trg_UG1, Condition( function Trig_UG1_Conditions ) )
    
endfunction
