
//===========================================================================
// Trigger: 未命名触发器 146
//===========================================================================
function Trig_146_Func002C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'A0BI' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A0BE' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A0BF' ) ) then
        return true
    endif
    return false
endfunction

function Trig_146_Conditions takes nothing returns boolean
    if ( not Trig_146_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_146_Func001002003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_146_Func001002003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == true )
endfunction

function Trig_146_Func001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_146_Func001002003001(), Trig_146_Func001002003002() )
endfunction

function Trig_146_Func003Func001A takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetEnumUnit()), "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl" )
    set udg_jingdianchangtexiao = GetLastCreatedEffectBJ()
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.05 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 4.00 )
    call DestroyEffect( udg_jingdianchangtexiao )
    call DestroyGroup( udg_jingdianchangdanweizu )
endfunction

function Trig_146_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BG', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_146_Func004Func001A takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetEnumUnit()), "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl" )
    set udg_jingdianchangtexiao = GetLastCreatedEffectBJ()
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.08 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 4.00 )
    call DestroyEffect( udg_jingdianchangtexiao )
    call DestroyGroup( udg_jingdianchangdanweizu )
endfunction

function Trig_146_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BG', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_146_Func005Func001A takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetEnumUnit()), "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl" )
    set udg_jingdianchangtexiao = GetLastCreatedEffectBJ()
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.11 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 4.00 )
    call DestroyEffect( udg_jingdianchangtexiao )
    call DestroyGroup( udg_jingdianchangdanweizu )
endfunction

function Trig_146_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BG', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_146_Func006Func001A takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetEnumUnit()), "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl" )
    set udg_jingdianchangtexiao = GetLastCreatedEffectBJ()
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.15 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 4.00 )
    call DestroyEffect( udg_jingdianchangtexiao )
    call DestroyGroup( udg_jingdianchangdanweizu )
endfunction

function Trig_146_Func006C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BG', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_146_Actions takes nothing returns nothing
    set udg_jingdianchangdanweizu = GetUnitsInRangeOfLocMatching(800.00, GetUnitLoc(GetTriggerUnit()), Condition(function Trig_146_Func001002003))
    if ( Trig_146_Func003C() ) then
        call ForGroupBJ( udg_jingdianchangdanweizu, function Trig_146_Func003Func001A )
    else
    endif
    if ( Trig_146_Func004C() ) then
        call ForGroupBJ( udg_jingdianchangdanweizu, function Trig_146_Func004Func001A )
    else
    endif
    if ( Trig_146_Func005C() ) then
        call ForGroupBJ( udg_jingdianchangdanweizu, function Trig_146_Func005Func001A )
    else
    endif
    if ( Trig_146_Func006C() ) then
        call ForGroupBJ( udg_jingdianchangdanweizu, function Trig_146_Func006Func001A )
    else
    endif
endfunction

//===========================================================================
function InitTrig_146 takes nothing returns nothing
    set gg_trg_146 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_146, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_146, Condition( function Trig_146_Conditions ) )
    call TriggerAddAction( gg_trg_146, function Trig_146_Actions )
endfunction
