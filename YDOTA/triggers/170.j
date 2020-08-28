
//===========================================================================
// Trigger: 未命名触发器 170
//===========================================================================
function Trig_170_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0BO' ) ) then
        return false
    endif
    return true
endfunction

function Trig_170_Actions takes nothing returns nothing
    call TriggerSleepAction( 0.50 )
    call SetUnitLifeBJ( GetTriggerUnit(), udg_Linghungeduanbaifenbi )
endfunction

//===========================================================================
function InitTrig_170 takes nothing returns nothing
    set gg_trg_170 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_170, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_170, Condition( function Trig_170_Conditions ) )
    call TriggerAddAction( gg_trg_170, function Trig_170_Actions )
endfunction
