
//===========================================================================
// Trigger: wujindefennu
//===========================================================================
function Trig_wujindefennu_Conditions takes nothing returns boolean
    return GetUnitAbilityLevel(GetTriggerUnit(), 'B02B') ==0 
endfunction

function Trig_wujindefennu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real h=GetEventDamage()
local real r=GetUnitState(u, UNIT_STATE_LIFE)-h
    if r>1 then
    else
    call SetUnitState( u, UNIT_STATE_LIFE, 1+h ) 
    endif
    
set u=null
endfunction

//===========================================================================
function InitTrig_wujindefennu takes nothing returns nothing
    set gg_trg_wujindefennu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_wujindefennu, Condition( function Trig_wujindefennu_Conditions ) )
    call TriggerAddAction( gg_trg_wujindefennu, function Trig_wujindefennu_Actions )
endfunction
