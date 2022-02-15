
//===========================================================================
// Trigger: NoCD
//===========================================================================
function Trig_NoCD_Func001A takes nothing returns nothing
    call SetUnitState( GetEnumUnit(), UNIT_STATE_LIFE, GetUnitState(GetEnumUnit(), UNIT_STATE_MAX_LIFE) )
    call UnitResetCooldown( GetEnumUnit() )
    call SetUnitState( GetEnumUnit(), UNIT_STATE_MANA, GetUnitState(GetEnumUnit(), UNIT_STATE_MAX_MANA) )
endfunction

function Trig_NoCD_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAll(Player(0)), function Trig_NoCD_Func001A )
endfunction

//===========================================================================
function InitTrig_NoCD takes nothing returns nothing
    set gg_trg_NoCD = CreateTrigger(  )
    call TriggerAddAction( gg_trg_NoCD, function Trig_NoCD_Actions )
endfunction
