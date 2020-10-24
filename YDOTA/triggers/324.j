
//===========================================================================
// Trigger: 未命名触发器 324
//===========================================================================
function Trig_324_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_324_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_324 takes nothing returns nothing
    set gg_trg_324 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_324, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_324, Condition( function Trig_324_Conditions ) )
    call TriggerAddAction( gg_trg_324, function Trig_324_Actions )
endfunction
