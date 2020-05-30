
//===========================================================================
// Trigger: 未命名触发器 151
//===========================================================================
function Trig_151_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BP' ) ) then
        return false
    endif
    return true
endfunction

function Trig_151_Func001C takes nothing returns boolean
    if ( not ( IsUnitAlly(GetSpellTargetUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_151_Func002C takes nothing returns boolean
    if ( not ( IsUnitEnemy(GetSpellTargetUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_151_Actions takes nothing returns nothing
    if ( Trig_151_Func001C() ) then
        call SetUnitLifeBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) + ( 100.00 + ( 100.00 * I2R(GetUnitAbilityLevelSwapped('A0BP', GetTriggerUnit())) ) ) ) )
    else
    endif
    if ( Trig_151_Func002C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), GetSpellTargetUnit(), ( 100.00 + ( 100.00 * I2R(GetUnitAbilityLevelSwapped('A0BP', GetTriggerUnit())) ) ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE )
    else
    endif
endfunction

//===========================================================================
function InitTrig_151 takes nothing returns nothing
    set gg_trg_151 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_151, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_151, Condition( function Trig_151_Conditions ) )
    call TriggerAddAction( gg_trg_151, function Trig_151_Actions )
endfunction
