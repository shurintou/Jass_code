
//===========================================================================
// Trigger: 未命名触发器 150
//===========================================================================
function Trig_150_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BO' ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004Func001Func001C takes nothing returns boolean
    if ( not ( GetSpellTargetUnit() != GetTriggerUnit() ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetSpellTargetUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004Func001C takes nothing returns boolean
    if ( not Trig_150_Func004Func001Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004Func002Func002C takes nothing returns boolean
    if ( not ( GetUnitLifePercent(GetTriggerUnit()) < 29.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004Func002C takes nothing returns boolean
    if ( not ( IsUnitEnemy(GetSpellTargetUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004Func003C takes nothing returns boolean
    if ( not ( GetSpellTargetUnit() == GetTriggerUnit() ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Func004C takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_150_Actions takes nothing returns nothing
    set udg_Linghungeduanbaifenbi = GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit())
    if ( Trig_150_Func004C() ) then
        if ( Trig_150_Func004Func001C() ) then
            call SetUnitLifePercentBJ( GetSpellTargetUnit(), ( GetUnitLifePercent(GetTriggerUnit()) * ( 0.80 + ( I2R(GetUnitAbilityLevelSwapped('A0BO', GetTriggerUnit())) / 10.00 ) ) ) )
        else
        endif
        if ( Trig_150_Func004Func002C() ) then
            if ( Trig_150_Func004Func002Func002C() ) then
                call SetUnitLifePercentBJ( GetSpellTargetUnit(), ( 33.00 - ( 5.00 * I2R(GetUnitAbilityLevelSwapped('A0BO', GetTriggerUnit())) ) ) )
            else
                call SetUnitLifePercentBJ( GetSpellTargetUnit(), ( GetUnitLifePercent(GetTriggerUnit()) * ( 1 - ( I2R(GetUnitAbilityLevelSwapped('A0BO', GetTriggerUnit())) / 10.00 ) ) ) )
            endif
        else
        endif
        if ( Trig_150_Func004Func003C() ) then
            call SetUnitLifeBJ( GetTriggerUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) + ( 400.00 + ( I2R(GetUnitAbilityLevelSwapped('A0BO', GetTriggerUnit())) * 100.00 ) ) ) )
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_150 takes nothing returns nothing
    set gg_trg_150 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_150, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_150, Condition( function Trig_150_Conditions ) )
    call TriggerAddAction( gg_trg_150, function Trig_150_Actions )
endfunction
