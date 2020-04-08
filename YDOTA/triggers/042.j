
//===========================================================================
// Trigger: 未命名触发器 042
//===========================================================================
function Trig_042_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B9' ) ) then
        return false
    endif
    return true
endfunction

function Trig_042_Func003002003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_042_Func003002003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == true )
endfunction

function Trig_042_Func003002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_042_Func003002003001(), Trig_042_Func003002003002() )
endfunction

function Trig_042_Func004Func001Func001C takes nothing returns boolean
    if ( not ( ( GetHeroStatBJ(bj_HEROSTAT_INT, udg_shenzhidanwei, true) - GetHeroStatBJ(bj_HEROSTAT_INT, GetEnumUnit(), true) ) < 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_042_Func004Func001A takes nothing returns nothing
    if ( Trig_042_Func004Func001Func001C() ) then
        call SetUnitManaBJ( GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) * 0.80 ) ) )
    else
        call UnitDamageTargetBJ( udg_shenzhidanwei, GetEnumUnit(), ( ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_shenzhidanwei, true)) - I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetEnumUnit(), true)) ) * 10.00 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    endif
endfunction

function Trig_042_Func004Func002Func001C takes nothing returns boolean
    if ( not ( ( GetHeroStatBJ(bj_HEROSTAT_INT, udg_shenzhidanwei, true) - GetHeroStatBJ(bj_HEROSTAT_INT, GetEnumUnit(), true) ) < 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_042_Func004Func002A takes nothing returns nothing
    if ( Trig_042_Func004Func002Func001C() ) then
        call SetUnitManaBJ( GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) * 0.60 ) ) )
    else
        call UnitDamageTargetBJ( udg_shenzhidanwei, GetEnumUnit(), ( ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_shenzhidanwei, true)) - I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetEnumUnit(), true)) ) * 8.00 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    endif
endfunction

function Trig_042_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0B9', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_042_Actions takes nothing returns nothing
    set udg_shenzhidian = GetUnitLoc(GetTriggerUnit())
    set udg_shenzhidanwei = GetTriggerUnit()
    set udg_shenzhidanweizu = GetUnitsInRangeOfLocMatching(600.00, GetUnitLoc(GetTriggerUnit()), Condition(function Trig_042_Func003002003))
    if ( Trig_042_Func004C() ) then
        call ForGroupBJ( udg_shenzhidanweizu, function Trig_042_Func004Func002A )
    else
        call ForGroupBJ( udg_shenzhidanweizu, function Trig_042_Func004Func001A )
    endif
    call PolledWait( 2 )
    call DestroyGroup( udg_shenzhidanweizu )
    call RemoveLocation( udg_shenzhidian )
endfunction

//===========================================================================
function InitTrig_042 takes nothing returns nothing
    set gg_trg_042 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_042, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_042, Condition( function Trig_042_Conditions ) )
    call TriggerAddAction( gg_trg_042, function Trig_042_Actions )
endfunction
