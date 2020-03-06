
//===========================================================================
// Trigger: dizhentingzhi
//===========================================================================
function Trig_dizhentingzhi_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'S001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_dizhentingzhi_Actions takes nothing returns nothing
    call RemoveUnit( udg_dizhendanwei1 )
endfunction

//===========================================================================
function InitTrig_dizhentingzhi takes nothing returns nothing
    set gg_trg_dizhentingzhi = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_dizhentingzhi, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( gg_trg_dizhentingzhi, Condition( function Trig_dizhentingzhi_Conditions ) )
    call TriggerAddAction( gg_trg_dizhentingzhi, function Trig_dizhentingzhi_Actions )
endfunction
