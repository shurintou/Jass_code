
//===========================================================================
// Trigger: 未命名触发器 166
//===========================================================================
function Trig_166_Func002C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'A00K' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A00X' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A07K' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'S001' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A019' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A02F' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A012' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A00D' ) ) then
        return true
    endif
    return false
endfunction

function Trig_166_Conditions takes nothing returns boolean
    if ( not Trig_166_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_166_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_166 takes nothing returns nothing
    set gg_trg_166 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_166, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( gg_trg_166, Condition( function Trig_166_Conditions ) )
    call TriggerAddAction( gg_trg_166, function Trig_166_Actions )
endfunction
