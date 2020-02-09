
//===========================================================================
// Trigger: 未命名触发器 303
//===========================================================================
function Trig_303_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A012' ) ) then
        return false
    endif
    return true
endfunction

function Trig_303_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_303 takes nothing returns nothing
    set gg_trg_303 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_303, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_303, Condition( function Trig_303_Conditions ) )
    call TriggerAddAction( gg_trg_303, function Trig_303_Actions )
endfunction
