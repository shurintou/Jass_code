
//===========================================================================
// Trigger: LearnTS
//===========================================================================
function Trig_LearnTS_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'ANsq' 
endfunction

function Trig_LearnTS_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'ANsq' )
    if i==1 then
    call UnitAddAbility( u, 'A00O' )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A00O', false )
    else
    call SetUnitAbilityLevel( u, 'Awar', i )
    endif
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_LearnTS takes nothing returns nothing
    set gg_trg_LearnTS = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnTS, Condition( function Trig_LearnTS_Conditions ) )
    call TriggerAddAction( gg_trg_LearnTS, function Trig_LearnTS_Actions )
endfunction
