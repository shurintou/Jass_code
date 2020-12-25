
//===========================================================================
// Trigger: 未命名触发器 159
//===========================================================================
function Trig_159_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_159_Actions takes nothing returns nothing
    set udg_Heian = GetSpellTargetUnit()
    call TriggerSleepAction( 0.50 )
    call SetUnitManaBJ( GetTriggerUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_Heian) * ( I2R(GetUnitAbilityLevelSwapped('A04M', GetTriggerUnit())) * 0.15 ) ) ) )
    call KillUnit( udg_Heian )
endfunction

//===========================================================================
function InitTrig_159 takes nothing returns nothing
    set gg_trg_159 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_159, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_159, Condition( function Trig_159_Conditions ) )
    call TriggerAddAction( gg_trg_159, function Trig_159_Actions )
endfunction
