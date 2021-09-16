
//===========================================================================
// Trigger: DarkThrough
//===========================================================================
function Trig_DarkThrough_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A071' 
endfunction

function Trig_DarkThrough_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit t=GetSpellTargetUnit()
    call SetUnitState( u, UNIT_STATE_MANA,  GetUnitState(u, UNIT_STATE_MANA) + (0.5*GetUnitState(t, UNIT_STATE_MAX_LIFE))  )
    call UnitDamageTarget( u, t, 1500, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
    set u=null
    set t=null
endfunction

//===========================================================================
function InitTrig_DarkThrough takes nothing returns nothing
    set gg_trg_DarkThrough = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DarkThrough, Condition( function Trig_DarkThrough_Conditions ) )
    call TriggerAddAction( gg_trg_DarkThrough, function Trig_DarkThrough_Actions )
endfunction
