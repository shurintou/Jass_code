
//===========================================================================
// Trigger: 未命名触发器 304
//===========================================================================
function Trig_304_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_304_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 1.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_304 takes nothing returns nothing
    set gg_trg_304 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_304, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_304, Condition( function Trig_304_Conditions ) )
    call TriggerAddAction( gg_trg_304, function Trig_304_Actions )
endfunction
