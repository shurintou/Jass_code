
//===========================================================================
// Trigger: shuaxin
//===========================================================================
function Trig_shuaxin_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_shuaxin_Actions takes nothing returns nothing
    call UnitResetCooldown( GetSpellAbilityUnit() )
endfunction

//===========================================================================
function InitTrig_shuaxin takes nothing returns nothing
    set gg_trg_shuaxin = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_shuaxin, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_shuaxin, Condition( function Trig_shuaxin_Conditions ) )
    call TriggerAddAction( gg_trg_shuaxin, function Trig_shuaxin_Actions )
endfunction
