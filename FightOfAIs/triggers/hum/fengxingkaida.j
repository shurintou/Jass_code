
//===========================================================================
// Trigger: fengxingkaida
//===========================================================================
function Trig_fengxingkaida_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real r
    local real l=0.3*GetHeroInt(u,true)
    local integer i=R2I((GetHeroLevel(u)-4)/6)
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssuePointOrderById( u, 852664, x, y )
        call IssuePointOrderById( u, 852592, x, y )
    endif
    set r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    if r>l and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false  then
        call UnitDamageTarget( u, t, 1.2*l, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCaster.mdl", t, "chest") )
        call SetUnitState( u, UNIT_STATE_MANA,r-l)
    endif
    call SetUnitAbilityLevel( u, 'ANsi', i )
    call SetUnitAbilityLevel( u, 'A00B', i )
    call SetUnitAbilityLevel( u, 'A00A', i )
    
    
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_fengxingkaida takes nothing returns nothing
    set gg_trg_fengxingkaida = CreateTrigger(  )
    call DisableTrigger(gg_trg_fengxingkaida)
    call TriggerAddCondition( gg_trg_fengxingkaida, Condition( function Trig_fengxingkaida_Conditions ) )
    
endfunction
