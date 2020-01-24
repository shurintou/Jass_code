
//===========================================================================
// Trigger: 未命名触发器 302
//===========================================================================
function Trig_302_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_302_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_302 takes nothing returns nothing
    set gg_trg_302 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_302, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_302, Condition( function Trig_302_Conditions ) )
    call TriggerAddAction( gg_trg_302, function Trig_302_Actions )
endfunction
