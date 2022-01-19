
//===========================================================================
// Trigger: kill
//===========================================================================
function Trig_kill_Func001A takes nothing returns nothing
    call UnitDamageTarget( gg_unit_Hamg_0130, GetEnumUnit(), 99999.00, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
endfunction

function Trig_kill_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAll(Player(0)), function Trig_kill_Func001A )
endfunction

//===========================================================================
function InitTrig_kill takes nothing returns nothing
    set gg_trg_kill = CreateTrigger(  )
    call TriggerAddAction( gg_trg_kill, function Trig_kill_Actions )
endfunction
