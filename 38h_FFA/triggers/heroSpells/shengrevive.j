
//===========================================================================
// Trigger: shengrevive
//===========================================================================
function Trig_shengrevive_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    call DisableTrigger( gg_trg_hpdayuhundred )
    call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE) )
    call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) )
    set u=null
endfunction

//===========================================================================
function InitTrig_shengrevive takes nothing returns nothing
    set gg_trg_shengrevive = CreateTrigger(  )
    call TriggerAddAction( gg_trg_shengrevive, function Trig_shengrevive_Actions )
endfunction
