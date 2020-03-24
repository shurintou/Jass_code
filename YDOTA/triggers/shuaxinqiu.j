
//===========================================================================
// Trigger: shuaxinqiu
//===========================================================================
function Trig_shuaxinqiu_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07F' ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) != 'H00F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_shuaxinqiu_Actions takes nothing returns nothing
    call UnitResetCooldown( GetSpellAbilityUnit() )
endfunction

//===========================================================================
function InitTrig_shuaxinqiu takes nothing returns nothing
    set gg_trg_shuaxinqiu = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_shuaxinqiu, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_shuaxinqiu, Condition( function Trig_shuaxinqiu_Conditions ) )
    call TriggerAddAction( gg_trg_shuaxinqiu, function Trig_shuaxinqiu_Actions )
endfunction
