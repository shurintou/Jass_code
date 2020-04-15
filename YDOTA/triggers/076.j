
//===========================================================================
// Trigger: 未命名触发器 076
//===========================================================================
function Trig_076_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02W' ) ) then
        return false
    endif
    return true
endfunction

function Trig_076_Func001C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), 'B01S') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_076_Func002C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), 'B01U') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_076_Func003C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), 'B01R') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_076_Func004C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), 'B01T') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_076_Actions takes nothing returns nothing
    if ( Trig_076_Func001C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), GetSpellTargetUnit(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetTriggerUnit(), true)) * 1.00 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_076_Func002C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), GetSpellTargetUnit(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetTriggerUnit(), true)) * 2.00 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_076_Func003C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), GetSpellTargetUnit(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetTriggerUnit(), true)) * 3.00 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_076_Func004C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), GetSpellTargetUnit(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetTriggerUnit(), true)) * 4.00 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
    else
    endif
endfunction

//===========================================================================
function InitTrig_076 takes nothing returns nothing
    set gg_trg_076 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_076, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_076, Condition( function Trig_076_Conditions ) )
    call TriggerAddAction( gg_trg_076, function Trig_076_Actions )
endfunction
