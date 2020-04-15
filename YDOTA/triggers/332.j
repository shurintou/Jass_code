
//===========================================================================
// Trigger: 未命名触发器 332
//===========================================================================
function Trig_332_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'S001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_332_Actions takes nothing returns nothing
    call SetUnitInvulnerable( GetTriggerUnit(), true )
    call TriggerSleepAction( 5.00 )
    call SetUnitInvulnerable( GetTriggerUnit(), false )
endfunction

//===========================================================================
function InitTrig_332 takes nothing returns nothing
    set gg_trg_332 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_332, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_332, Condition( function Trig_332_Conditions ) )
    call TriggerAddAction( gg_trg_332, function Trig_332_Actions )
endfunction
