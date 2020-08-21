
//===========================================================================
// Trigger: AbilityDiren
//===========================================================================
function Trig_AbilityDiren_Func002C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'AEmb' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A00C' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A01U' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A0AB' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'S000' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A01T' ) ) then
        return true
    endif
    return false
endfunction

function Trig_AbilityDiren_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_AbilityDiren_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_AbilityDiren_Actions takes nothing returns nothing
    // 需要添加新的单体技能请在上边加条件 - 支持自定义技能 - 
    // 不需要辅助技能和变量完美释放 - 需要一个辅助单位详细请看函数
    call AbilityGo_Diren()
endfunction

//===========================================================================
function InitTrig_AbilityDiren takes nothing returns nothing
    set gg_trg_AbilityDiren = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_AbilityDiren, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_AbilityDiren, Condition( function Trig_AbilityDiren_Conditions ) )
    call TriggerAddAction( gg_trg_AbilityDiren, function Trig_AbilityDiren_Actions )
endfunction
