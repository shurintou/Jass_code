
//===========================================================================
// Trigger: 未命名触发器 301
//===========================================================================
function Trig_301_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A060' ) ) then
        return false
    endif
    return true
endfunction

function Trig_301_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_301 takes nothing returns nothing
    set gg_trg_301 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_301, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_301, Condition( function Trig_301_Conditions ) )
    call TriggerAddAction( gg_trg_301, function Trig_301_Actions )
endfunction
