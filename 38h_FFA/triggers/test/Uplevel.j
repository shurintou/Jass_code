
//===========================================================================
// Trigger: Uplevel
//===========================================================================
function Trig_Uplevel_Func001A takes nothing returns nothing
    call SetHeroLevel( GetEnumUnit(), ( GetUnitLevel(GetEnumUnit()) + 1 ), false )
endfunction

function Trig_Uplevel_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAll(Player(0)), function Trig_Uplevel_Func001A )
endfunction

//===========================================================================
function InitTrig_Uplevel takes nothing returns nothing
    set gg_trg_Uplevel = CreateTrigger(  )
    call DisableTrigger( gg_trg_Uplevel )
    call TriggerRegisterPlayerKeyEventBJ( gg_trg_Uplevel, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP )
    call TriggerAddAction( gg_trg_Uplevel, function Trig_Uplevel_Actions )
endfunction
