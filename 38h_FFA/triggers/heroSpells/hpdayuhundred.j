
//===========================================================================
// Trigger: hpdayuhundred
//===========================================================================
function Trig_hpdayuhundred_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u, 'AOre')
local real r=50+100*level
local player p=GetTriggerPlayer()
call SetUnitState(u, UNIT_STATE_LIFE, r )
call SetUnitState(u, UNIT_STATE_MANA, r )
call SelectUnitForPlayerSingle( u, p )
call DisableTrigger( GetTriggeringTrigger() )
set u=null   
set p=null
endfunction

//===========================================================================
function InitTrig_hpdayuhundred takes nothing returns nothing
    set gg_trg_hpdayuhundred = CreateTrigger(  )
    call TriggerAddAction( gg_trg_hpdayuhundred, function Trig_hpdayuhundred_Actions )
endfunction
