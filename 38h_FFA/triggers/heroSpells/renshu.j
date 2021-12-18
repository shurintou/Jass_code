
//===========================================================================
// Trigger: renshu
//===========================================================================
function Trig_renshu_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_renshu_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u,'A07I')
local integer level=GetUnitAbilityLevel(u,'A07H')

if level>i*2 then
call SetUnitAbilityLevel(u,'A07H',level-1)
endif

set u=null
endfunction

//===========================================================================
function InitTrig_renshu takes nothing returns nothing
    set gg_trg_renshu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_renshu, Condition( function Trig_renshu_Conditions ) )
    call TriggerAddAction( gg_trg_renshu, function Trig_renshu_Actions )
endfunction
