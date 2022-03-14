
//===========================================================================
// Trigger: level
//===========================================================================
function Trig_level_Func001A takes nothing returns nothing
    call SetHeroLevel( GetEnumUnit(), 25, true )
endfunction

function Trig_level_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsOfPlayerAll(Player(0)), function Trig_level_Func001A )
endfunction

//===========================================================================
function InitTrig_level takes nothing returns nothing
    set gg_trg_level = CreateTrigger(  )
    call TriggerAddAction( gg_trg_level, function Trig_level_Actions )
endfunction
