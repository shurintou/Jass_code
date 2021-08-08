
//===========================================================================
// Trigger: wtfdown
//===========================================================================
function Trig_wtfdown_Actions takes nothing returns nothing
    call SetUnitManaPercentBJ( GetTriggerUnit(), 100 )
    call UnitResetCooldown( GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_wtfdown takes nothing returns nothing
    set gg_trg_wtfdown = CreateTrigger(  )
    call DisableTrigger( gg_trg_wtfdown )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_wtfdown, EVENT_PLAYER_UNIT_ISSUED_ORDER )
    call TriggerAddAction( gg_trg_wtfdown, function Trig_wtfdown_Actions )
endfunction
