
//===========================================================================
// Trigger: 未命名触发器 174
//===========================================================================
function Trig_174_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06Y' ) ) then
        return false
    endif
    return true
endfunction

function Trig_174_Actions takes nothing returns nothing
    set udg_youmindanwei = GetTriggerUnit()
endfunction

//===========================================================================
function InitTrig_174 takes nothing returns nothing
    set gg_trg_174 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_174, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_174, Condition( function Trig_174_Conditions ) )
    call TriggerAddAction( gg_trg_174, function Trig_174_Actions )
endfunction
