
//===========================================================================
// Trigger: 未命名触发器 165
//===========================================================================
function Trig_165_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_165_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 3.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_165 takes nothing returns nothing
    set gg_trg_165 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_165, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_165, Condition( function Trig_165_Conditions ) )
    call TriggerAddAction( gg_trg_165, function Trig_165_Actions )
endfunction
