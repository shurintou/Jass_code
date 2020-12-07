
//===========================================================================
// Trigger: 未命名触发器 299
//===========================================================================
function Trig_299_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_299_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_299 takes nothing returns nothing
    set gg_trg_299 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_299, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_299, Condition( function Trig_299_Conditions ) )
    call TriggerAddAction( gg_trg_299, function Trig_299_Actions )
endfunction
