
//===========================================================================
// Trigger: 未命名触发器 018
//===========================================================================
function Trig_018_Actions takes nothing returns nothing
    set udg_shoudaoshanghai = GetEventDamage()
endfunction

//===========================================================================
function InitTrig_018 takes nothing returns nothing
    set gg_trg_018 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_018, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddAction( gg_trg_018, function Trig_018_Actions )
endfunction
