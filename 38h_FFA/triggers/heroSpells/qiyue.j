
//===========================================================================
// Trigger: qiyue
//
// function Trig_DarkThrough_Conditions takes nothing returns boolean
//     return GetSpellAbilityId() == 'A071' 
// endfunction
// function Trig_DarkThrough_Actions takes nothing returns nothing
//     local unit u=GetTriggerUnit()
//     local unit t=GetSpellTargetUnit()
//     call SetUnitState( u, UNIT_STATE_MANA,  GetUnitState(u, UNIT_STATE_MANA) + (0.5*GetUnitState(t, UNIT_STATE_MAX_LIFE))  )
//     call UnitDamageTarget( u, t, 1500, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
//     set u=null
//     set t=null
// endfunction
//===========================================================================
function Trig_qiyue_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08J' 
endfunction

function Trig_qiyue_Actions takes nothing returns nothing
 local unit u=GetTriggerUnit()
    local unit t=GetSpellTargetUnit()
    call SetUnitState( u, UNIT_STATE_LIFE,  GetUnitState(u, UNIT_STATE_LIFE) + GetUnitState(t, UNIT_STATE_MAX_LIFE)  )
    call UnitDamageTarget( u, t, 1500, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
    set u=null
    set t=null
endfunction

//===========================================================================
function InitTrig_qiyue takes nothing returns nothing
    set gg_trg_qiyue = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_qiyue, Condition( function Trig_qiyue_Conditions ) )
    call TriggerAddAction( gg_trg_qiyue, function Trig_qiyue_Actions )
endfunction
