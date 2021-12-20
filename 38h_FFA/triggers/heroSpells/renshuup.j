
//===========================================================================
// Trigger: renshuup
//===========================================================================
function Trig_renshuup_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A07I' 
endfunction

function Trig_renshuup_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u,'A07I')
call SetUnitAbilityLevel(u,'A07H',1+5*i)
set u=null
endfunction

//===========================================================================
function InitTrig_renshuup takes nothing returns nothing
    set gg_trg_renshuup = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_renshuup, Condition( function Trig_renshuup_Conditions ) )
    call TriggerAddAction( gg_trg_renshuup, function Trig_renshuup_Actions )
endfunction
