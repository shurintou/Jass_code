
//===========================================================================
// Trigger: 未命名触发器 300
//===========================================================================
function Trig_300_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A019' ) ) then
        return false
    endif
    return true
endfunction

function Trig_300_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_300 takes nothing returns nothing
    set gg_trg_300 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_300, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_300, Condition( function Trig_300_Conditions ) )
    call TriggerAddAction( gg_trg_300, function Trig_300_Actions )
endfunction
