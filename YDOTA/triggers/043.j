
//===========================================================================
// Trigger: 未命名触发器 043
//===========================================================================
function Trig_043_Actions takes nothing returns nothing
endfunction

//===========================================================================
function InitTrig_043 takes nothing returns nothing
    set gg_trg_043 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_043, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_043, function Trig_043_Actions )
endfunction
