
//===========================================================================
// Trigger: 未命名触发器 246
//===========================================================================
function Trig_246_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A07J' ) ) then
        return false
    endif
    return true
endfunction

function Trig_246_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_247 )
endfunction

//===========================================================================
function InitTrig_246 takes nothing returns nothing
    set gg_trg_246 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_246, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_246, Condition( function Trig_246_Conditions ) )
    call TriggerAddAction( gg_trg_246, function Trig_246_Actions )
endfunction
